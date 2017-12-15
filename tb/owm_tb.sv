
//
// 1-wire master testbench
//

module owm_tb #(
    parameter SEED       = 0,
    parameter OW_BUS_NUM = 1
);
    timeunit 1ns;
    timeprecision 1ns;

    time T_clk = 100ns;

    logic clk = 1'b0;
    logic rst = 1'b1;

    always  #(T_clk / 2) clk = ~clk;
    initial #(5 * T_clk) rst = 1'b0;

    // ----------------------------------------------------
    // UUT
    // ----------------------------------------------------

    localparam OW_ADDR_W = (OW_BUS_NUM == 1) ? 1 : $clog2(OW_BUS_NUM);

    logic                  start      ;
    logic  [OW_ADDR_W-1:0] ow_addr    ;
    logic            [2:0] cmd        ;
    logic                  write_data ;
    logic                  read_data  ;
    logic                  presence   ;
    logic                  ready      ;
    logic [OW_BUS_NUM-1:0] ow_i       ;
    logic [OW_BUS_NUM-1:0] ow_o       ;

    logic [15:0] clk_prcl     ;
    logic [15:0] t_reset_l    ;
    logic [15:0] t_reset_h    ;
    logic [15:0] t_reset_pd   ;
    logic [15:0] t_write_slot ;
    logic [15:0] t_write_l    ;
    logic [15:0] t_write_rec  ;
    logic [15:0] t_read_slot  ;
    logic [15:0] t_read_l     ;
    logic [15:0] t_read_read  ;
    logic [15:0] t_read_rec   ;

    owm #(
        .USE_INPUT_REGS ( 0            ),
        .OW_BUS_NUM     ( OW_BUS_NUM   )
    ) uut (
        .clk_i          ( clk          ),
        .rst_i          ( rst          ),

        .start_i        ( start        ),
        .cmd_i          ( cmd          ),
        .ow_addr_i      ( ow_addr      ),
        .wrdat_i        ( write_data   ),
        .rddat_o        ( read_data    ),
        .presence_o     ( presence     ),
        .ready_o        ( ready        ),

        .clk_prcl_i     ( clk_prcl     ),
        .t_reset_l_i    ( t_reset_l    ),
        .t_reset_h_i    ( t_reset_h    ),
        .t_reset_pd_i   ( t_reset_pd   ),
        .t_write_slot_i ( t_write_slot ),
        .t_write_l_i    ( t_write_l    ),
        .t_write_rec_i  ( t_write_rec  ),
        .t_read_slot_i  ( t_read_slot  ),
        .t_read_l_i     ( t_read_l     ),
        .t_read_read_i  ( t_read_read  ),
        .t_read_rec_i   ( t_read_rec   ),

        .ow_i ,
        .ow_o
    );

    // ----------------------------------------------------
    // 1-wire buses with pullup to VCC
    // ----------------------------------------------------

    tri1 [OW_BUS_NUM-1:0] owr;

    logic [OW_BUS_NUM-1:0] dat_r   ;
    wire  [OW_BUS_NUM-1:0] dat_w   ;
    logic [OW_BUS_NUM-1:0] ows_ena ;

    generate
        genvar i;
        for (i = 0; i < OW_BUS_NUM; ++i) begin : g
            assign owr[i]  = ow_o[i] ? 1'bz : 1'b0;
            assign ow_i[i] = owr[i];

            onewire_slave_model #(
                .TS (55.0)
            ) ows_inst (
                .ena   ( ows_ena[i] ),
                .ovd   ( 1'b0       ),
                .dat_r ( dat_r[i]   ),
                .dat_w ( dat_w[i]   ),
                .owr   ( owr[i]     )
            );
        end
    endgenerate

    // ----------------------------------------------------
    // Test
    // ----------------------------------------------------

    initial begin : main
        $urandom(SEED);
        $timeformat(-6, 3, "us", 13);
        wait(rst == 0);

        $display("\n%t # %m : Start!\n", $time());

        for (int timing_set = 0; timing_set < 4; ++timing_set) begin
            set_timing_parameters(timing_set);
            tick(10);

            for (bit [OW_ADDR_W-1:0] owaddr = 0; 1; ++owaddr)
            begin
                tick(10);
                owm_reset_test(owaddr);

                owm_write_test(0, owaddr);
                owm_write_test(1, owaddr);

                owm_read_test(0, owaddr);
                owm_read_test(1, owaddr);

                $display("\n");

                if (owaddr == OW_BUS_NUM - 1)
                    break;
            end
        end

        $display("%t # %m : Test passed!\n", $time());
        $finish;
    end

    // -------------------------------------------------------

    typedef enum bit [2:0] {
        OWM_RESET = 3'b001,
        OWM_WRITE = 3'b010,
        OWM_READ  = 3'b100
    } owm_command_t;

    typedef enum bit {
        OWS_DISABLE = 1'b0,
        OWS_ENABLE = 1'b1
    } ows_ena_t;

    task owm_reset_test(bit [OW_ADDR_W-1:0] owaddr=0);
        fork
            begin
                $display("%t # %m : Reset bus %1d ...", $time(), owaddr);
                set_reset_param(OWS_ENABLE, owaddr);
                @(posedge ready);

                if (!presence) begin
                    $display("%t # %m : Bus %1d, check presence ERROR!",
                              $time(), owaddr);
                    $finish;
                end

                disable timeout;
            end

            begin : timeout
                #((t_reset_l + t_reset_h) * T_clk * (clk_prcl + 1) + 3 * T_clk);
                $display("%t # %m : Bus %1d, timeout expire!",
                          $time(), owaddr);
                $finish;
            end
        join
    endtask

    task owm_write_test(bit wd, bit [OW_ADDR_W-1:0] owaddr=0);
        fork
            begin
                $display("%t # %m : Write \'%d\' to bus %1d ...",
                         $time(), wd, owaddr);
                set_write_param(OWS_ENABLE, wd, owaddr);
                @(posedge ready);
                if (wd != dat_w[owaddr]) begin
                    $display("%t # %m : Bus %1d, check write ERROR!",
                              $time(), owaddr);
                    $finish;
                end

                disable timeout;
            end

            begin : timeout
                #((t_write_slot + t_write_rec) * T_clk * (clk_prcl + 1) + 3 * T_clk);
                $display("%t # %m : Bus %1d, timeout expire!",
                          $time(), owaddr);
                $finish;
            end
        join
    endtask

    task owm_read_test(bit rd, bit [OW_ADDR_W-1:0] owaddr=0);
        fork
            begin
                $display("%t # %m : Read \'%d\' from bus %1d ...",
                         $time(), rd, owaddr);
                set_read_param(OWS_ENABLE, rd, owaddr);
                @(posedge ready);
                if (read_data != dat_r[owaddr]) begin
                    $display("%t # %m : Bus %1d, check read ERROR!",
                              $time(), owaddr);
                    $finish;
                end

                disable timeout;
            end

            begin : timeout
                #((t_read_slot + t_read_rec) * T_clk * (clk_prcl + 1) + 3 * T_clk);
                $display("%t # %m : Bus %1d, timeout expire!",
                          $time(), owaddr);
                $finish;
            end
        join
    endtask

    // -------------------------------------------------------

    task set_timing_parameters(bit [1:0] timing_set=0);
        $display("%t # %m : Select timing set %1d\n", $time(), timing_set);

        if (timing_set == 0) begin
            // 1 MHz, clk_prcl = 0
            T_clk        = 1000ns;
            clk_prcl     = 0     ;
            t_reset_l    = 480   ;
            t_reset_h    = 480   ;
            t_reset_pd   = 100   ;
            t_write_slot = 60    ;
            t_write_l    = 10    ;
            t_write_rec  = 2     ;
            t_read_slot  = 60    ;
            t_read_l     = 10    ;
            t_read_read  = 13    ;
            t_read_rec   = 2     ;
        end
        else if (timing_set == 1) begin
            // 10 MHz, clk_prcl = 9 (10-1)
            T_clk        = 100ns ;
            clk_prcl     = 9     ;
            t_reset_l    = 480   ;
            t_reset_h    = 480   ;
            t_reset_pd   = 100   ;
            t_write_slot = 60    ;
            t_write_l    = 10    ;
            t_write_rec  = 2     ;
            t_read_slot  = 60    ;
            t_read_l     = 10    ;
            t_read_read  = 13    ;
            t_read_rec   = 2     ;
        end
        else if (timing_set == 2) begin
            // 10 MHz, clk_prcl = 4 (5-1)
            T_clk        = 100ns   ;
            clk_prcl     = 4       ;
            t_reset_l    = 2 * 480 ;
            t_reset_h    = 2 * 480 ;
            t_reset_pd   = 2 * 100 ;
            t_write_slot = 2 * 60  ;
            t_write_l    = 2 * 10  ;
            t_write_rec  = 2 * 2   ;
            t_read_slot  = 2 * 60  ;
            t_read_l     = 2 * 10  ;
            t_read_read  = 2 * 13  ;
            t_read_rec   = 2 * 2   ;
        end
        else begin
            // 100 MHz, clk_prcl = 99 (100-1)
            T_clk        = 10ns;
            clk_prcl     = 99  ;
            t_reset_l    = 480 ;
            t_reset_h    = 480 ;
            t_reset_pd   = 100 ;
            t_write_slot = 60  ;
            t_write_l    = 10  ;
            t_write_rec  = 2   ;
            t_read_slot  = 60  ;
            t_read_l     = 10  ;
            t_read_read  = 13  ;
            t_read_rec   = 2   ;
        end
    endtask

    task owm_command(owm_command_t c, bit wd=0, bit[OW_ADDR_W-1:0] owaddr=0);
        write_data = wd;
        ow_addr    = owaddr;
        cmd        = c;

        start = 1;
        tick(1);
        start = 0;
    endtask

    task set_reset_param(ows_ena_t en, bit[OW_ADDR_W-1:0] owaddr=0);
        dat_r[owaddr] = 1;
        ows_ena[owaddr] = en;
        owm_command(OWM_RESET, 0, owaddr);
    endtask

    task set_write_param(ows_ena_t en, bit wd, bit[OW_ADDR_W-1:0] owaddr=0);
        dat_r[owaddr] = 1;
        ows_ena[owaddr] = en;
        owm_command(OWM_WRITE, wd, owaddr);
    endtask

    task set_read_param(ows_ena_t en, bit rd, bit[OW_ADDR_W-1:0] owaddr=0);
        ows_ena[owaddr] = en;
        dat_r[owaddr] = rd;
        owm_command(OWM_READ, 0, owaddr);
    endtask

    task tick(int n);
        repeat(n) @(posedge clk);
    endtask

endmodule


// MASTER - hierarchical name of Avalon-MM Master BFM instance
// TB - top level testbench module

module owm_qsys_test_programm #(
    parameter SEED        = 0 ,
    parameter OWM_BUS_NUM = 1 ,
    parameter OWM_BASE    = 0
);
    timeunit 1ns;
    timeprecision 1ns;

    import verbosity_pkg::*;
    import avalon_mm_pkg::*;

    // Timing settings for 10MHz clock
    int timings_10mhz [11] = {
        9   ,    // clk_pclr, 10 - 1
        480 ,    // t_reset_l
        480 ,    // t_reset_h
        100 ,    // t_reset_pd
        60  ,    // t_write_slot
        10  ,    // t_write_l
        2   ,    // t_write_rec
        60  ,    // t_read_slot
        10  ,    // t_read_l
        13  ,    // t_read_read
        2        // t_read_rec
    };

    localparam OW_ADDR_W = (OWM_BUS_NUM == 1) ? 1 : $clog2(OWM_BUS_NUM);

    // OWM register address
    const logic [3:0] OWM_CTRL = 4'd11;
    const logic [3:0] OWM_STAT = 4'd12;
    const logic [3:0] OWM_IE   = 4'd13;
    const logic [3:0] OWM_ADDR = 4'd14;

    // OWM Control register commands
    const logic [31:0] OWM_RESET_REQ = 1;
    const logic [31:0] OWM_WRITE_REQ = 2;
    const logic [31:0] OWM_READ_REQ  = 8;

    bit r;

    initial begin : main
        $urandom(SEED);
        $timeformat(-6, 3, "us", 13);
        wait(`TB.reset_n == 1);
        tick(1);

        display_msg($sformatf("%m : Start!\n"));

        `MASTER.init();

        owm_init(timings_10mhz, 1);

        for (int i = 0; i < OWM_BUS_NUM; ++i) begin
            reset_test(timings_10mhz, i);
            repeat (10)
                write_test(timings_10mhz, i, $urandom);
            repeat (10)
                read_test(timings_10mhz,  i, $urandom);

            $display("");
        end

        $display("");
        display_msg($sformatf("%m : Test passed!\n"));
        tick(10);
        $finish;
    end

    // -------------------------------------------------------
    // Test cases
    // -------------------------------------------------------

    task automatic read_test(const ref int tm [11], input int bus_num, bit b);
        bit rb;
        fork
            begin
                `TB.ows_ena[bus_num] = 1;

                `TB.ows_dat_r[bus_num] = b;
                display_msg($sformatf("%m : Bus %1d read \'%1b\'", bus_num, b));
                owm_read_bit(bus_num, rb);
                check(rb === b, $sformatf("%m : Error!"));

                disable timeout;
            end

            begin : timeout
                #((tm[7] + tm[10]) * `TB.T_clk * (tm[0] + 1) + 20 * `TB.T_clk);
                check(0, $sformatf("%m : Time expired!"));
            end
        join

        `TB.ows_ena[bus_num] = 0;
    endtask

    task automatic write_test(const ref int tm [11], input int bus_num, bit wb);
        fork
            begin
                `TB.ows_dat_r[bus_num] = 1;
                `TB.ows_ena[bus_num]   = 1;

                display_msg($sformatf("%m : Bus %1d write \'%1b\'",
                                      bus_num, wb));
                owm_write_bit(bus_num, wb);
                check(`TB.ows_dat_w[bus_num] === wb, $sformatf("%m : Error!"));

                disable timeout;
            end

            begin : timeout
                #((tm[4] + tm[6]) * `TB.T_clk * (tm[0] + 1) + 20 * `TB.T_clk);
                check(0, $sformatf("%m : Time expired!"));
            end
        join

        `TB.ows_ena[bus_num] = 0;
    endtask

    task automatic reset_test(const ref int tm [11], input int bus_num);
        bit presence;

        fork
            begin
                // Slave enable - presence 1
                `TB.ows_dat_r[bus_num] = 1;
                `TB.ows_ena[bus_num]   = 1;
                display_msg($sformatf("%m : Bus %1d reset test, slave enable...", bus_num));
                owm_reset(bus_num, presence);
                check(presence, $sformatf("%m : Error!"));

                // Slave disable - presence 0
                `TB.ows_dat_r[bus_num] = 1;
                `TB.ows_ena[bus_num]   = 0;
                display_msg($sformatf("%m : Bus %1d reset test, slave disable...", bus_num));
                owm_reset(bus_num, presence);
                check(!presence, $sformatf("%m : Error!"));

                disable timeout;
            end

            begin : timeout
                #((tm[1] + tm[1]) * `TB.T_clk * (tm[0] + 1) + 20 * `TB.T_clk);
                #((tm[1] + tm[1]) * `TB.T_clk * (tm[0] + 1) + 20 * `TB.T_clk);
                check(0, $sformatf("%m : Time expired!"));
            end
        join

        `TB.ows_ena[bus_num] = 0;
    endtask

    // -------------------------------------------------------
    // OWM operation
    // -------------------------------------------------------

    task automatic owm_read_bit(int bus_num, output bit rb);
        logic [31:0] rd;

        // Select 1-wire bus
        avalon_master_write(OWM_ADDR, bus_num);

        // Check busy status and clear ready bit
        avalon_master_read(OWM_STAT, rd);
        check(rd[2], $sformatf("%m : Device busy!"));

        avalon_master_write(OWM_CTRL, OWM_READ_REQ);
        owm_wait_ready(rd);

        rb = rd[1];
    endtask

    task automatic owm_write_bit(int bus_num, bit b);
        logic [31:0] rd;

        // Select 1-wire bus
        avalon_master_write(OWM_ADDR, bus_num);

        // Check busy status and clear ready bit
        avalon_master_read(OWM_STAT, rd);
        check(rd[2], $sformatf("%m : Device busy!"));

        avalon_master_write(OWM_CTRL, OWM_WRITE_REQ | int'(b) << 2);
        owm_wait_ready(rd);
    endtask


    task automatic owm_reset(int bus_num, output bit presence);
        logic [31:0] rd, wr;

        // Select 1-wire bus
        avalon_master_write(OWM_ADDR, bus_num);

        // Check busy status and clear ready bit
        avalon_master_read(OWM_STAT, rd);
        check(rd[2], $sformatf("%m : Device busy!"));

        avalon_master_write(OWM_CTRL, OWM_RESET_REQ);
        owm_wait_ready(rd);

        presence = rd[0];
    endtask


    task automatic owm_wait_ready(output logic [31:0] rd);
        while (1) begin
            avalon_master_read(OWM_STAT, rd);
            if (rd & 'h08)
                break;
        end
    endtask

    // -------------------------------------------------------
    // Initialization
    // -------------------------------------------------------

    task automatic owm_init(const ref int timing [11], input bit ie=0);
        logic [31:0] rd, wr;

        // Setup timings
        for (int i = 0; i < 11; ++i)
            avalon_master_write(i, timing[i]);

        // Read and check timings
        for (int i = 0; i < 11; ++i) begin
            avalon_master_read(i, rd);

            if (rd !== timing[i]) begin
                $display("Error!");
                $stop;
            end
        end

        // Enable interrupt
        avalon_master_write(OWM_IE, ie);

        // Read and check IE reg
        avalon_master_read(OWM_IE, rd);
        if (rd[0] !== ie) begin
            $display("Error!");
            $stop;
        end

    endtask

    // -------------------------------------------------------
    // Read/Write Avalon-MM Master address space
    // -------------------------------------------------------

    event        read_resp_recv  ;
    event        write_resp_recv ;
    logic [31:0] resp_data       ;

    always @(`MASTER.signal_response_complete) begin
        `MASTER.pop_response();

        if (`MASTER.get_response_request() == REQ_READ) begin
            resp_data = `MASTER.get_response_data(0);
            ->read_resp_recv;
        end else if (`MASTER.get_response_request() == REQ_WRITE) begin
            ->write_resp_recv;
        end
    end

    task automatic avalon_master_write (
        input logic  [3:0] addr,
        input logic [31:0] data
    );
        `MASTER.set_command_address(addr * 4);
        `MASTER.set_command_burst_count(1);
        `MASTER.set_command_burst_size(1);
        `MASTER.set_command_byte_enable('hf, 0);
        `MASTER.set_command_data(data, 0);
        `MASTER.set_command_request(REQ_WRITE);
        `MASTER.push_command();

        @(write_resp_recv);
    endtask

    task automatic avalon_master_read (
        input  logic  [3:0] addr,
        output logic [31:0] data
    );
        `MASTER.set_command_address(addr * 4);
        `MASTER.set_command_burst_count(1);
        `MASTER.set_command_burst_size(1);
        `MASTER.set_command_byte_enable('hf, 0);
        `MASTER.set_command_request(REQ_READ);
        `MASTER.push_command();

        @(read_resp_recv);
        data = resp_data;
    endtask

    // -------------------------------------------------------
    // Utils
    // -------------------------------------------------------

    task tick(int n);
        repeat(n) @(posedge `TB.clock);
    endtask

    task check(bit exp_value, string msg);
        if (!exp_value) begin
            display_msg(msg);
            $finish;
        end
    endtask

    task display_msg(string msg);
        $display("%t # %s", $time, msg);
    endtask

endmodule

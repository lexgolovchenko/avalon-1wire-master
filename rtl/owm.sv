
//
// 1-wire master
//

module owm #(
    parameter USE_INPUT_REGS = 1,
    parameter OW_BUS_NUM     = 4,
    parameter OW_ADDR_W      = (OW_BUS_NUM == 1) ? 1 : $clog2(OW_BUS_NUM)
)(
    input  logic                  clk_i          ,
    input  logic                  rst_i          ,

    input  logic                  start_i        ,
    input  logic            [2:0] cmd_i          ,
    input  logic  [OW_ADDR_W-1:0] ow_addr_i      ,
    input  logic                  wrdat_i        ,
    output logic                  rddat_o        ,
    output logic                  presence_o     ,
    output logic                  ready_o        ,

    input  logic           [15:0] clk_prcl_i     ,
    input  logic           [15:0] t_reset_l_i    ,
    input  logic           [15:0] t_reset_h_i    ,
    input  logic           [15:0] t_reset_pd_i   ,
    input  logic           [15:0] t_write_slot_i ,
    input  logic           [15:0] t_write_l_i    ,
    input  logic           [15:0] t_write_rec_i  ,
    input  logic           [15:0] t_read_slot_i  ,
    input  logic           [15:0] t_read_l_i     ,
    input  logic           [15:0] t_read_read_i  ,
    input  logic           [15:0] t_read_rec_i   ,

    input  logic [OW_BUS_NUM-1:0] ow_i           ,
    output logic [OW_BUS_NUM-1:0] ow_o
);

    enum logic [1:0] {
        IDLE  ,
        RESET ,
        WRITE ,
        READ
    } state;

    // -----------------------------------------------
    // Input registers
    // -----------------------------------------------

    logic [OW_ADDR_W-1:0] ow_addr_r ;
    logic                 wrdat_r   ;

    logic [15:0] t_reset_l_r    ;
    logic [15:0] t_reset_h_r    ;
    logic [15:0] t_reset_pd_r   ;
    logic [15:0] t_write_slot_r ;
    logic [15:0] t_write_l_r    ;
    logic [15:0] t_write_rec_r  ;
    logic [15:0] t_read_slot_r  ;
    logic [15:0] t_read_l_r     ;
    logic [15:0] t_read_read_r  ;
    logic [15:0] t_read_rec_r   ;

    generate
        if (USE_INPUT_REGS) begin
            always_ff @(posedge clk_i)
                if (start_i && state == IDLE) begin
                    t_reset_l_r    <= t_reset_l_i    ;
                    t_reset_h_r    <= t_reset_h_i    ;
                    t_reset_pd_r   <= t_reset_pd_i   ;
                    t_write_slot_r <= t_write_slot_i ;
                    t_write_l_r    <= t_write_l_i    ;
                    t_write_rec_r  <= t_write_rec_i  ;
                    t_read_slot_r  <= t_read_slot_i  ;
                    t_read_l_r     <= t_read_l_i     ;
                    t_read_read_r  <= t_read_read_i  ;
                    t_read_rec_r   <= t_read_rec_i   ;
                end
        end
        else begin
            assign t_reset_l_r    = t_reset_l_i    ;
            assign t_reset_h_r    = t_reset_h_i    ;
            assign t_reset_pd_r   = t_reset_pd_i   ;
            assign t_write_slot_r = t_write_slot_i ;
            assign t_write_l_r    = t_write_l_i    ;
            assign t_write_rec_r  = t_write_rec_i  ;
            assign t_read_slot_r  = t_read_slot_i  ;
            assign t_read_l_r     = t_read_l_i     ;
            assign t_read_read_r  = t_read_read_i  ;
            assign t_read_rec_r   = t_read_rec_i   ;
        end

        if (OW_BUS_NUM == 1)
            assign ow_addr_r = '0;
        else begin
            always_ff @(posedge clk_i)
                if (start_i && state == IDLE)
                    ow_addr_r <= ow_addr_i;
        end
    endgenerate

    always_ff @(posedge clk_i)
        if (start_i && state == IDLE)
            wrdat_r <= wrdat_i;

    // -----------------------------------------------
    // Clock prescaler
    // -----------------------------------------------

    logic [15:0] clk_prcl_r ;
    logic [15:0] clkcnt     ;

    always_ff @(posedge clk_i)
        if (state == IDLE && start_i) begin
            clk_prcl_r <= clk_prcl_i;
            clkcnt     <= clk_prcl_i;
        end else
            clkcnt <= (clkcnt == '0) ? clk_prcl_r : clkcnt - 1'b1;

    wire clkena = (clkcnt == '0);

    // -----------------------------------------------
    // Control FSM
    // -----------------------------------------------

    logic cmd_is_done;

    always_ff @(posedge clk_i or posedge rst_i)
        if (rst_i)
            state <= IDLE;
        else case (state)
            IDLE:
                if (start_i) begin
                    if      (cmd_i[0]) state <= RESET;
                    else if (cmd_i[1]) state <= WRITE;
                    else if (cmd_i[2]) state <= READ;
                end

            RESET:
                if (cmd_is_done)
                    state <= IDLE;

            WRITE:
                if (cmd_is_done)
                    state <= IDLE;

            READ:
                if (cmd_is_done)
                    state <= IDLE;
        endcase

    // -----------------------------------------------
    // Timing counter
    // -----------------------------------------------

    logic [16:0] tcnt;

    always_ff @(posedge clk_i)
        if (state == IDLE && start_i) begin
            if (cmd_i[0])
                tcnt <= t_reset_l_r + t_reset_h_r - 1'b1;
            else if (cmd_i[1])
                tcnt <= t_write_slot_r + t_write_rec_r - 1'b1;
            else if (cmd_i[2])
                tcnt <= t_read_slot_r + t_read_rec_r - 1'b1;
        end
        else if (state != IDLE && clkena)
            tcnt <= tcnt - 1'b1;

    assign cmd_is_done = (tcnt == '0) && clkena;

    // -----------------------------------------------
    // Write data to bus
    // -----------------------------------------------

    logic [16:0] t_ow_write_l;
    logic [16:0] t_ow_read_l ;

    always_ff @(posedge clk_i)
        if (start_i && state == IDLE) begin
            t_ow_write_l <= t_write_slot_r + t_write_rec_r - t_write_l_r;
            t_ow_read_l  <= t_read_slot_r  + t_read_rec_r  - t_read_l_r ;
        end

    always_ff @(posedge clk_i or posedge rst_i)
        if (rst_i)
            ow_o <= '1;
        else case (state)
            RESET:
                ow_o[ow_addr_r] <= (tcnt >= t_reset_h_r) ? 1'b0 : 1'b1;
            WRITE:
                ow_o[ow_addr_r] <= (tcnt >= t_ow_write_l)
                        ? (1'b0)
                        : (tcnt >= t_write_rec_r ? wrdat_r : 1'b1);
            READ:
                ow_o[ow_addr_r] <= (tcnt >= t_ow_read_l) ? 1'b0 : 1'b1;
            default:
                ow_o[ow_addr_r] <= 1'b1;
        endcase

    // -----------------------------------------------
    // Read data from bus
    // -----------------------------------------------

    logic [16:0] t_ow_read_ena;
    logic [16:0] t_ow_check_presence;

    always_ff @(posedge clk_i)
        if (start_i && state == IDLE) begin
            t_ow_read_ena       <= t_read_slot_r + t_read_rec_r - t_read_read_r;
            t_ow_check_presence <= t_reset_l_r - t_reset_pd_r;
        end

    wire read_ena = (state == READ) && clkena && (tcnt == t_ow_read_ena);

    always_ff @(posedge clk_i)
        if (read_ena)
            rddat_o <= ow_i[ow_addr_r];

    wire check_presence_ena = (state == RESET)
        && (tcnt == t_ow_check_presence) && clkena;

    always_ff @(posedge clk_i)
        if (start_i && state == IDLE)
            presence_o <= 1'b0;
        else if (check_presence_ena)
            presence_o <= ~ow_i[ow_addr_r];

    // -----------------------------------------------

    assign ready_o = (state == IDLE);

endmodule


//
// Test 1-wire master core with Avalon-MM interface
// using Avalon-MM master BMF
//

module owm_qsys_tb #(
    parameter SEED = 0
);
    timeunit 1ns;
    timeprecision 1ns;

    const time T_clk = 100ns;

    logic clock   = 1'b0;
    logic reset_n = 1'b0;

    always  #(T_clk / 2) clock = ~clock;
    initial #(5 * T_clk) reset_n = 1'b1;

    // ----------------------------------------------------
    // UUT
    // ----------------------------------------------------

    localparam OW_BUS_NUM = 4;

    wire [OW_BUS_NUM-1:0] ow_i, ow_o;

    owm_test_sys u0 (
        .clk_clk       ( clock   ),
        .reset_reset_n ( reset_n ),
        .owm_i         ( ow_i    ),
        .owm_o         ( ow_o    )
    );

    // ----------------------------------------------------
    // 1-wire buses with pullup to VCC
    // ----------------------------------------------------

    tri1  [OW_BUS_NUM - 1:0] owr;

    logic [OW_BUS_NUM - 1:0] ows_dat_r ;
    wire  [OW_BUS_NUM - 1:0] ows_dat_w ;
    logic [OW_BUS_NUM - 1:0] ows_ena   ;

    generate
        genvar i;
        for (i = 0; i < OW_BUS_NUM; ++i) begin : g
            assign owr[i]  = ow_o[i] ? 1'bz : 1'b0;
            assign ow_i[i] = owr[i];

            onewire_slave_model #(
                .TS (55.0)
            ) ows_inst (
                .ena   ( ows_ena[i]   ),
                .ovd   ( 1'b0         ),
                .dat_r ( ows_dat_r[i] ),
                .dat_w ( ows_dat_w[i] ),
                .owr   ( owr[i]       )
            );
        end
    endgenerate

    // ----------------------------------------------------
    // Test programm
    // ----------------------------------------------------

    owm_qsys_test_programm #(.SEED(SEED), .OWM_BUS_NUM(OW_BUS_NUM)) tp();

endmodule


//
// 1-wire master core with Avalon-MM Slave Interface
//

module owm_avalon_slave #(
    parameter OW_BUS_NUM = 4
)(
    input  logic clk_i ,
    input  logic rst_i ,

    // Avalon-MM Slave
    input  logic  [3:0] addr_i   ,
    input  logic        write_i  ,
    input  logic        read_i   ,
    input  logic [31:0] wrdata_i ,
    output logic [31:0] rddata_o ,
    output logic        irq_o    ,

    // 1-wire bus
    input  logic [OW_BUS_NUM-1:0] ow_i ,
    output logic [OW_BUS_NUM-1:0] ow_o
);

    localparam OW_ADDR_W = (OW_BUS_NUM == 1) ? 1 : $clog2(OW_BUS_NUM);

    logic        start        ;
    logic  [2:0] cmd          ;
    logic        wrdat        ;
    logic        ready        ;
    logic        presence     ;
    logic        rddat        ;
    logic [15:0] clk_prcl;
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
    logic [15:0] avs_ow_addr  ;

    owm_avalon_slave_interface avs_inst (
        .clk_i    ,
        .rst_i    ,
        .addr_i   ,
        .write_i  ,
        .read_i   ,
        .wrdata_i ,
        .rddata_o ,
        .irq_o    ,

        .owm_cmd_o         ( cmd          ),
        .owm_start_o       ( start        ),
        .owm_wrdat_o       ( wrdat        ),
        .owm_ready_i       ( ready        ),
        .owm_presence_i    ( presence     ),
        .owm_rddat_i       ( rddat        ),

        .owm_clk_prcl_o    ( clk_prcl     ),
        .owm_t_reset_l_o   ( t_reset_l    ),
        .owm_t_reset_h_o   ( t_reset_h    ),
        .owm_t_reset_pd_o  ( t_reset_pd   ),
        .owm_t_write_slot_o( t_write_slot ),
        .owm_t_write_l_o   ( t_write_l    ),
        .owm_t_write_rec_o ( t_write_rec  ),
        .owm_t_read_slot_o ( t_read_slot  ),
        .owm_t_read_l_o    ( t_read_l     ),
        .owm_t_read_read_o ( t_read_read  ),
        .owm_t_read_rec_o  ( t_read_rec   ),

        .owm_ow_addr_o     ( avs_ow_addr  )
    );

    wire [OW_ADDR_W - 1:0] ow_addr;
    generate
        if (OW_ADDR_W < 'd16)
            assign ow_addr = avs_ow_addr[OW_ADDR_W - 1:0];
        else
            assign ow_addr = {'0, avs_ow_addr};
    endgenerate

    owm #(
        .USE_INPUT_REGS ( 0          ),
        .OW_BUS_NUM     ( OW_BUS_NUM )
    ) owm_inst (
        .clk_i ,
        .rst_i ,

        .start_i        ( start    ),
        .cmd_i          ( cmd      ),
        .ow_addr_i      ( ow_addr  ),
        .wrdat_i        ( wrdat    ),
        .rddat_o        ( rddat    ),
        .presence_o     ( presence ),
        .ready_o        ( ready    ),

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

endmodule

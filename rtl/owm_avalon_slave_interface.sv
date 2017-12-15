
//
// Avalon-MM Slave interface for 1-wire master
//

module owm_avalon_slave_interface (
    input  logic clk_i           ,
    input  logic rst_i           ,

    // Avalon-MM Slave
    input  logic  [3:0] addr_i   ,
    input  logic        write_i  ,
    input  logic        read_i   ,
    input  logic [31:0] wrdata_i ,
    output logic [31:0] rddata_o ,

    output logic        irq_o    ,

    // 1-wire master core
    output logic  [2:0] owm_cmd_o          ,
    output logic        owm_start_o        ,
    output logic        owm_wrdat_o        ,
    input  logic        owm_ready_i        ,
    input  logic        owm_presence_i     ,
    input  logic        owm_rddat_i        ,
    output logic [15:0] owm_clk_prcl_o     ,
    output logic [15:0] owm_t_reset_l_o    ,
    output logic [15:0] owm_t_reset_h_o    ,
    output logic [15:0] owm_t_reset_pd_o   ,
    output logic [15:0] owm_t_write_slot_o ,
    output logic [15:0] owm_t_write_l_o    ,
    output logic [15:0] owm_t_write_rec_o  ,
    output logic [15:0] owm_t_read_slot_o  ,
    output logic [15:0] owm_t_read_l_o     ,
    output logic [15:0] owm_t_read_read_o  ,
    output logic [15:0] owm_t_read_rec_o   ,
    output logic [15:0] owm_ow_addr_o
);

    // Avalon-MM registers
    // 0    - clock prescaler
    // 1-10 - 1-wire timings
    // 11   - control
    // 12   - status
    // 13   - interrupt enable
    // 14   - 1-wire bus address

    typedef struct packed {
        logic rd_req  ;   // 3
        logic wr_data ;   // 2
        logic wr_req  ;   // 1
        logic rst_req ;   // 0
    } ctrl_reg_t;

    typedef struct packed {
        logic ready    ;  // 3 - clear to 0 after read
        logic idle     ;  // 2
        logic rd_data  ;  // 1
        logic presence ;  // 0
    } status_reg_t;

    logic [15:0] clk_prcl     ;  // 0
    logic [15:0] t_reset_l    ;  // 1
    logic [15:0] t_reset_h    ;  // 2
    logic [15:0] t_reset_pd   ;  // 3
    logic [15:0] t_write_slot ;  // 4
    logic [15:0] t_write_l    ;  // 5
    logic [15:0] t_write_rec  ;  // 6
    logic [15:0] t_read_slot  ;  // 7
    logic [15:0] t_read_l     ;  // 8
    logic [15:0] t_read_read  ;  // 9
    logic [15:0] t_read_rec   ;  // 10
    ctrl_reg_t   control      ;  // 11
    status_reg_t status       ;  // 12 - read only!
    logic        ie           ;  // 13
    logic [15:0] ow_addr      ;  // 14


    // -----------------------------------------------
    // Avalon-MM read
    // -----------------------------------------------

    always_ff @(posedge clk_i)
        case (addr_i)
            4'd0   : rddata_o <= {'0, clk_prcl    };
            4'd1   : rddata_o <= {'0, t_reset_l   };
            4'd2   : rddata_o <= {'0, t_reset_h   };
            4'd3   : rddata_o <= {'0, t_reset_pd  };
            4'd4   : rddata_o <= {'0, t_write_slot};
            4'd5   : rddata_o <= {'0, t_write_l   };
            4'd6   : rddata_o <= {'0, t_write_rec };
            4'd7   : rddata_o <= {'0, t_read_slot };
            4'd8   : rddata_o <= {'0, t_read_l    };
            4'd9   : rddata_o <= {'0, t_read_read };
            4'd10  : rddata_o <= {'0, t_read_rec  };
            4'd11  : rddata_o <= {'0, control     };
            4'd12  : rddata_o <= {'0, status      };
            4'd13  : rddata_o <= {'0, ie          };
            default: rddata_o <= {'0, ow_addr     };
        endcase

    // -----------------------------------------------
    // Avalon-MM write
    // -----------------------------------------------

    always_ff @(posedge clk_i)
        if (write_i) begin
            case (addr_i)
                0 : clk_prcl     <= wrdata_i[15:0];
                1 : t_reset_l    <= wrdata_i[15:0];
                2 : t_reset_h    <= wrdata_i[15:0];
                3 : t_reset_pd   <= wrdata_i[15:0];
                4 : t_write_slot <= wrdata_i[15:0];
                5 : t_write_l    <= wrdata_i[15:0];
                6 : t_write_rec  <= wrdata_i[15:0];
                7 : t_read_slot  <= wrdata_i[15:0];
                8 : t_read_l     <= wrdata_i[15:0];
                9 : t_read_read  <= wrdata_i[15:0];
                10: t_read_rec   <= wrdata_i[15:0];
                11: control      <= wrdata_i[3:0] ;
                13: ie           <= wrdata_i[0]   ;
                14: ow_addr      <= wrdata_i[15:0];
            endcase
        end else
            control <= control & 4'b0100;

    // -----------------------------------------------
    // Status register read logic
    // -----------------------------------------------

    logic read_r;
    always_ff @(posedge clk_i)
        read_r <= read_i;

    always_ff @(posedge clk_i or posedge rst_i)
        if (rst_i)
            status <= 4'b0100;
        else begin
            status.idle     <= owm_ready_i && !owm_start_o;
            status.rd_data  <= owm_rddat_i;
            status.presence <= owm_presence_i;

            if (!status.idle && owm_ready_i)
                status.ready <= 1'b1;
            else if (addr_i == 4'd12 && (read_i && !read_r))
                status.ready <= 1'b0;
        end

    assign irq_o = ie & status.ready;

    // -----------------------------------------------
    // 1-wire master signals
    // -----------------------------------------------

    assign owm_start_o = control.rst_req || control.wr_req || control.rd_req;
    assign owm_cmd_o   = {control.rd_req, control.wr_req, control.rst_req};
    assign owm_wrdat_o = control.wr_data;

    assign owm_clk_prcl_o     = clk_prcl     ;
    assign owm_t_reset_l_o    = t_reset_l    ;
    assign owm_t_reset_h_o    = t_reset_h    ;
    assign owm_t_reset_pd_o   = t_reset_pd   ;
    assign owm_t_write_slot_o = t_write_slot ;
    assign owm_t_write_l_o    = t_write_l    ;
    assign owm_t_write_rec_o  = t_write_rec  ;
    assign owm_t_read_slot_o  = t_read_slot  ;
    assign owm_t_read_l_o     = t_read_l     ;
    assign owm_t_read_read_o  = t_read_read  ;
    assign owm_t_read_rec_o   = t_read_rec   ;
    assign owm_ow_addr_o      = ow_addr      ;

endmodule

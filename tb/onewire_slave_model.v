//////////////////////////////////////////////////////////////////////////////
//                                                                          //
//  1-wire (owr) slave model                                                //
//                                                                          //
//  Copyright (C) 2010  Iztok Jeras                                         //
//                                                                          //
//////////////////////////////////////////////////////////////////////////////
//                                                                          //
//  This HDL is free hardware: you can redistribute it and/or modify        //
//  it under the terms of the GNU Lesser General Public License             //
//  as published by the Free Software Foundation, either                    //
//  version 3 of the License, or (at your option) any later version.        //
//                                                                          //
//  This RTL is distributed in the hope that it will be useful,             //
//  but WITHOUT ANY WARRANTY; without even the implied warranty of          //
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the           //
//  GNU General Public License for more details.                            //
//                                                                          //
//  You should have received a copy of the GNU General Public License       //
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.   //
//                                                                          //
//////////////////////////////////////////////////////////////////////////////

`timescale 1us / 1us

module onewire_slave_model #(
    // timeslot (min=15.0, typ=30.0, max=60.0)
    parameter TS = 60.0
)(
    input ena,
    input ovd,

    input  dat_r,
    output dat_w,

    inout owr
);
    reg pul = 1'b0;
    reg dat;
    event sample_dat;
    event sample_rst;

    assign owr = (pul & ena) ? 1'b0 : 1'bz;
    assign dat_w = dat;

    always @(negedge owr)
        if (ena)
            transfer(ovd, dat_r, dat);

    task automatic transfer (
        input ovd,
        input dat_r,
        output dat_w
    ); begin

        pul = ~dat_r;
        wait_timeslot(1);
        dat_w = owr;
        ->sample_dat;
        pul = 1'b0;

        fork
            begin : transfer_dat
                if (~owr)
                    @(posedge owr);
                #(0);
                disable transfer_rst;
            end

            begin : transfer_rst
                if (ovd)  #(7*TS/8);
                else      #(7*TS);
                ->sample_rst;
                if (~owr)
                    disable transfer_dat;
                @(posedge owr)
                wait_timeslot(1);
                pul = 1'b1;
                wait_timeslot(4);
                pul = 1'b0;
            end
        join
    end endtask

    task automatic wait_timeslot(input integer ts_num);
    begin
        if (ovd)
            #(ts_num*TS/8);
        else
            #(ts_num*TS);
    end endtask

endmodule

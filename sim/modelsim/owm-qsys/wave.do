onerror {resume}
quietly virtual function -install /owm_qsys_tb/u0/master -env /owm_qsys_tb { &{/owm_qsys_tb/u0/master/avm_address[31], /owm_qsys_tb/u0/master/avm_address[30], /owm_qsys_tb/u0/master/avm_address[29], /owm_qsys_tb/u0/master/avm_address[28], /owm_qsys_tb/u0/master/avm_address[27], /owm_qsys_tb/u0/master/avm_address[26], /owm_qsys_tb/u0/master/avm_address[25], /owm_qsys_tb/u0/master/avm_address[24], /owm_qsys_tb/u0/master/avm_address[23], /owm_qsys_tb/u0/master/avm_address[22], /owm_qsys_tb/u0/master/avm_address[21], /owm_qsys_tb/u0/master/avm_address[20], /owm_qsys_tb/u0/master/avm_address[19], /owm_qsys_tb/u0/master/avm_address[18], /owm_qsys_tb/u0/master/avm_address[17], /owm_qsys_tb/u0/master/avm_address[16], /owm_qsys_tb/u0/master/avm_address[15], /owm_qsys_tb/u0/master/avm_address[14], /owm_qsys_tb/u0/master/avm_address[13], /owm_qsys_tb/u0/master/avm_address[12], /owm_qsys_tb/u0/master/avm_address[11], /owm_qsys_tb/u0/master/avm_address[10], /owm_qsys_tb/u0/master/avm_address[9], /owm_qsys_tb/u0/master/avm_address[8], /owm_qsys_tb/u0/master/avm_address[7], /owm_qsys_tb/u0/master/avm_address[6], /owm_qsys_tb/u0/master/avm_address[5], /owm_qsys_tb/u0/master/avm_address[4], /owm_qsys_tb/u0/master/avm_address[3], /owm_qsys_tb/u0/master/avm_address[2] }} addr
quietly WaveActivateNextPane {} 0
add wave -noupdate -group {Master BFM} /owm_qsys_tb/u0/master/clk
add wave -noupdate -group {Master BFM} /owm_qsys_tb/u0/master/reset
add wave -noupdate -group {Master BFM} /owm_qsys_tb/u0/master/avm_waitrequest
add wave -noupdate -group {Master BFM} -radix unsigned -childformat {{(29) -radix hexadecimal} {(28) -radix hexadecimal} {(27) -radix hexadecimal} {(26) -radix hexadecimal} {(25) -radix hexadecimal} {(24) -radix hexadecimal} {(23) -radix hexadecimal} {(22) -radix hexadecimal} {(21) -radix hexadecimal} {(20) -radix hexadecimal} {(19) -radix hexadecimal} {(18) -radix hexadecimal} {(17) -radix hexadecimal} {(16) -radix hexadecimal} {(15) -radix hexadecimal} {(14) -radix hexadecimal} {(13) -radix hexadecimal} {(12) -radix hexadecimal} {(11) -radix hexadecimal} {(10) -radix hexadecimal} {(9) -radix hexadecimal} {(8) -radix hexadecimal} {(7) -radix hexadecimal} {(6) -radix hexadecimal} {(5) -radix hexadecimal} {(4) -radix hexadecimal} {(3) -radix hexadecimal} {(2) -radix hexadecimal} {(1) -radix hexadecimal} {(0) -radix hexadecimal}} -subitemconfig {{/owm_qsys_tb/u0/master/avm_address[31]} {-radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[30]} {-radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[29]} {-radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[28]} {-radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[27]} {-radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[26]} {-radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[25]} {-radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[24]} {-radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[23]} {-radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[22]} {-radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[21]} {-radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[20]} {-radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[19]} {-radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[18]} {-radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[17]} {-radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[16]} {-radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[15]} {-radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[14]} {-radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[13]} {-radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[12]} {-radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[11]} {-radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[10]} {-radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[9]} {-radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[8]} {-radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[7]} {-radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[6]} {-radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[5]} {-radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[4]} {-radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[3]} {-radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[2]} {-radix hexadecimal}} /owm_qsys_tb/u0/master/addr
add wave -noupdate -group {Master BFM} /owm_qsys_tb/u0/master/avm_write
add wave -noupdate -group {Master BFM} -radix hexadecimal /owm_qsys_tb/u0/master/avm_writedata
add wave -noupdate -group {Master BFM} /owm_qsys_tb/u0/master/avm_read
add wave -noupdate -group {Master BFM} -radix hexadecimal -childformat {{{/owm_qsys_tb/u0/master/avm_readdata[31]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_readdata[30]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_readdata[29]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_readdata[28]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_readdata[27]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_readdata[26]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_readdata[25]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_readdata[24]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_readdata[23]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_readdata[22]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_readdata[21]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_readdata[20]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_readdata[19]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_readdata[18]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_readdata[17]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_readdata[16]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_readdata[15]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_readdata[14]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_readdata[13]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_readdata[12]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_readdata[11]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_readdata[10]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_readdata[9]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_readdata[8]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_readdata[7]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_readdata[6]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_readdata[5]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_readdata[4]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_readdata[3]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_readdata[2]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_readdata[1]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_readdata[0]} -radix hexadecimal}} -subitemconfig {{/owm_qsys_tb/u0/master/avm_readdata[31]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_readdata[30]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_readdata[29]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_readdata[28]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_readdata[27]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_readdata[26]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_readdata[25]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_readdata[24]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_readdata[23]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_readdata[22]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_readdata[21]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_readdata[20]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_readdata[19]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_readdata[18]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_readdata[17]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_readdata[16]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_readdata[15]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_readdata[14]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_readdata[13]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_readdata[12]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_readdata[11]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_readdata[10]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_readdata[9]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_readdata[8]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_readdata[7]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_readdata[6]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_readdata[5]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_readdata[4]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_readdata[3]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_readdata[2]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_readdata[1]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_readdata[0]} {-height 15 -radix hexadecimal}} /owm_qsys_tb/u0/master/avm_readdata
add wave -noupdate -group {Master BFM} /owm_qsys_tb/u0/master/avm_readdatavalid
add wave -noupdate -group {Master BFM} -radix hexadecimal -childformat {{{/owm_qsys_tb/u0/master/avm_address[31]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_address[30]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_address[29]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_address[28]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_address[27]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_address[26]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_address[25]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_address[24]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_address[23]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_address[22]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_address[21]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_address[20]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_address[19]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_address[18]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_address[17]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_address[16]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_address[15]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_address[14]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_address[13]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_address[12]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_address[11]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_address[10]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_address[9]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_address[8]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_address[7]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_address[6]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_address[5]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_address[4]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_address[3]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_address[2]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_address[1]} -radix hexadecimal} {{/owm_qsys_tb/u0/master/avm_address[0]} -radix hexadecimal}} -subitemconfig {{/owm_qsys_tb/u0/master/avm_address[31]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[30]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[29]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[28]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[27]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[26]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[25]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[24]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[23]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[22]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[21]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[20]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[19]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[18]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[17]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[16]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[15]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[14]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[13]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[12]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[11]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[10]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[9]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[8]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[7]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[6]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[5]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[4]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[3]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[2]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[1]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/master/avm_address[0]} {-height 15 -radix hexadecimal}} /owm_qsys_tb/u0/master/avm_address
add wave -noupdate -group {OWM AVS} /owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/clk_i
add wave -noupdate -group {OWM AVS} /owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rst_i
add wave -noupdate -group {OWM AVS} -divider <NULL>
add wave -noupdate -group {OWM AVS} -radix hexadecimal /owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/addr_i
add wave -noupdate -group {OWM AVS} /owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/write_i
add wave -noupdate -group {OWM AVS} /owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/read_i
add wave -noupdate -group {OWM AVS} /owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/wrdata_i
add wave -noupdate -group {OWM AVS} -radix hexadecimal -childformat {{{/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[31]} -radix hexadecimal} {{/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[30]} -radix hexadecimal} {{/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[29]} -radix hexadecimal} {{/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[28]} -radix hexadecimal} {{/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[27]} -radix hexadecimal} {{/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[26]} -radix hexadecimal} {{/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[25]} -radix hexadecimal} {{/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[24]} -radix hexadecimal} {{/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[23]} -radix hexadecimal} {{/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[22]} -radix hexadecimal} {{/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[21]} -radix hexadecimal} {{/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[20]} -radix hexadecimal} {{/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[19]} -radix hexadecimal} {{/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[18]} -radix hexadecimal} {{/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[17]} -radix hexadecimal} {{/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[16]} -radix hexadecimal} {{/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[15]} -radix hexadecimal} {{/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[14]} -radix hexadecimal} {{/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[13]} -radix hexadecimal} {{/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[12]} -radix hexadecimal} {{/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[11]} -radix hexadecimal} {{/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[10]} -radix hexadecimal} {{/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[9]} -radix hexadecimal} {{/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[8]} -radix hexadecimal} {{/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[7]} -radix hexadecimal} {{/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[6]} -radix hexadecimal} {{/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[5]} -radix hexadecimal} {{/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[4]} -radix hexadecimal} {{/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[3]} -radix hexadecimal} {{/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[2]} -radix hexadecimal} {{/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[1]} -radix hexadecimal} {{/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[0]} -radix hexadecimal}} -subitemconfig {{/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[31]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[30]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[29]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[28]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[27]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[26]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[25]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[24]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[23]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[22]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[21]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[20]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[19]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[18]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[17]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[16]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[15]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[14]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[13]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[12]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[11]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[10]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[9]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[8]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[7]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[6]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[5]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[4]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[3]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[2]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[1]} {-height 15 -radix hexadecimal} {/owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o[0]} {-height 15 -radix hexadecimal}} /owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/rddata_o
add wave -noupdate -group {OWM AVS} /owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/irq_o
add wave -noupdate -group {OWM AVS} -divider <NULL>
add wave -noupdate -group {OWM AVS} /owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/control
add wave -noupdate -group {OWM AVS} /owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/status
add wave -noupdate -group {OWM AVS} /owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/ie
add wave -noupdate -group {OWM AVS} /owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/read_r
add wave -noupdate -group {OWM AVS} -divider <NULL>
add wave -noupdate -group {OWM AVS} /owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/owm_cmd_o
add wave -noupdate -group {OWM AVS} /owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/owm_start_o
add wave -noupdate -group {OWM AVS} /owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/owm_wrdat_o
add wave -noupdate -group {OWM AVS} /owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/owm_ready_i
add wave -noupdate -group {OWM AVS} /owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/owm_presence_i
add wave -noupdate -group {OWM AVS} /owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/owm_rddat_i
add wave -noupdate -group {OWM AVS} /owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/owm_ow_addr_o
add wave -noupdate -group {OWM AVS} -divider <NULL>
add wave -noupdate -group {OWM AVS} -radix unsigned /owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/owm_clk_prcl_o
add wave -noupdate -group {OWM AVS} -radix unsigned /owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/owm_t_reset_l_o
add wave -noupdate -group {OWM AVS} -radix unsigned /owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/owm_t_reset_h_o
add wave -noupdate -group {OWM AVS} -radix unsigned /owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/owm_t_reset_pd_o
add wave -noupdate -group {OWM AVS} -radix unsigned /owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/owm_t_write_slot_o
add wave -noupdate -group {OWM AVS} -radix unsigned /owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/owm_t_write_l_o
add wave -noupdate -group {OWM AVS} -radix unsigned /owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/owm_t_write_rec_o
add wave -noupdate -group {OWM AVS} -radix unsigned /owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/owm_t_read_slot_o
add wave -noupdate -group {OWM AVS} -radix unsigned /owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/owm_t_read_l_o
add wave -noupdate -group {OWM AVS} -radix unsigned /owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/owm_t_read_read_o
add wave -noupdate -group {OWM AVS} -radix unsigned /owm_qsys_tb/u0/owm_avalon_slave_0/avs_inst/owm_t_read_rec_o
add wave -noupdate -group OWM /owm_qsys_tb/u0/owm_avalon_slave_0/owm_inst/clk_i
add wave -noupdate -group OWM /owm_qsys_tb/u0/owm_avalon_slave_0/owm_inst/rst_i
add wave -noupdate -group OWM /owm_qsys_tb/u0/owm_avalon_slave_0/owm_inst/start_i
add wave -noupdate -group OWM /owm_qsys_tb/u0/owm_avalon_slave_0/owm_inst/cmd_i
add wave -noupdate -group OWM /owm_qsys_tb/u0/owm_avalon_slave_0/owm_inst/ow_addr_i
add wave -noupdate -group OWM /owm_qsys_tb/u0/owm_avalon_slave_0/owm_inst/wrdat_i
add wave -noupdate -group OWM /owm_qsys_tb/u0/owm_avalon_slave_0/owm_inst/rddat_o
add wave -noupdate -group OWM /owm_qsys_tb/u0/owm_avalon_slave_0/owm_inst/presence_o
add wave -noupdate -group OWM /owm_qsys_tb/u0/owm_avalon_slave_0/owm_inst/ready_o
add wave -noupdate -group OWM /owm_qsys_tb/u0/owm_avalon_slave_0/owm_inst/ow_i
add wave -noupdate -group OWM /owm_qsys_tb/u0/owm_avalon_slave_0/owm_inst/ow_o
add wave -noupdate -group OWM /owm_qsys_tb/u0/owm_avalon_slave_0/owm_inst/state
add wave -noupdate -group OWM /owm_qsys_tb/u0/owm_avalon_slave_0/owm_inst/ow_addr_r
add wave -noupdate -group OWM /owm_qsys_tb/u0/owm_avalon_slave_0/owm_inst/wrdat_r
add wave -noupdate -group OWM /owm_qsys_tb/u0/owm_avalon_slave_0/owm_inst/clkcnt
add wave -noupdate -group OWM /owm_qsys_tb/u0/owm_avalon_slave_0/owm_inst/clkena
add wave -noupdate -group OWM /owm_qsys_tb/u0/owm_avalon_slave_0/owm_inst/cmd_is_done
add wave -noupdate -group OWM -radix unsigned /owm_qsys_tb/u0/owm_avalon_slave_0/owm_inst/tcnt
add wave -noupdate -group OWM /owm_qsys_tb/u0/owm_avalon_slave_0/owm_inst/t_ow_write_l
add wave -noupdate -group OWM /owm_qsys_tb/u0/owm_avalon_slave_0/owm_inst/t_ow_read_l
add wave -noupdate -group OWM /owm_qsys_tb/u0/owm_avalon_slave_0/owm_inst/t_ow_read_ena
add wave -noupdate -group OWM /owm_qsys_tb/u0/owm_avalon_slave_0/owm_inst/t_ow_check_presence
add wave -noupdate -group OWM /owm_qsys_tb/u0/owm_avalon_slave_0/owm_inst/read_ena
add wave -noupdate -group OWM /owm_qsys_tb/u0/owm_avalon_slave_0/owm_inst/check_presence_ena
add wave -noupdate -expand -group OWS {/owm_qsys_tb/g[0]/ows_inst/TS}
add wave -noupdate -expand -group OWS {/owm_qsys_tb/g[0]/ows_inst/ena}
add wave -noupdate -expand -group OWS {/owm_qsys_tb/g[0]/ows_inst/ovd}
add wave -noupdate -expand -group OWS {/owm_qsys_tb/g[0]/ows_inst/dat_r}
add wave -noupdate -expand -group OWS {/owm_qsys_tb/g[0]/ows_inst/dat_w}
add wave -noupdate -expand -group OWS {/owm_qsys_tb/g[0]/ows_inst/owr}
add wave -noupdate -expand -group OWS {/owm_qsys_tb/g[0]/ows_inst/pul}
add wave -noupdate -expand -group OWS {/owm_qsys_tb/g[0]/ows_inst/dat}
add wave -noupdate -expand -group OWS {/owm_qsys_tb/g[0]/ows_inst/sample_dat}
add wave -noupdate -expand -group OWS {/owm_qsys_tb/g[0]/ows_inst/sample_rst}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {11341089962 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 415
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {10616867125 ps} {12913059625 ps}

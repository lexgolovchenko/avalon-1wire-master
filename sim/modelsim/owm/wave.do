onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group uut /owm_tb/uut/clk_i
add wave -noupdate -expand -group uut /owm_tb/uut/rst_i
add wave -noupdate -expand -group uut -divider <NULL>
add wave -noupdate -expand -group uut /owm_tb/uut/start_i
add wave -noupdate -expand -group uut /owm_tb/uut/cmd_i
add wave -noupdate -expand -group uut /owm_tb/uut/ow_addr_i
add wave -noupdate -expand -group uut /owm_tb/uut/wrdat_i
add wave -noupdate -expand -group uut /owm_tb/uut/rddat_o
add wave -noupdate -expand -group uut /owm_tb/uut/presence_o
add wave -noupdate -expand -group uut /owm_tb/uut/ready_o
add wave -noupdate -expand -group uut /owm_tb/uut/state
add wave -noupdate -expand -group uut -divider <NULL>
add wave -noupdate -expand -group uut -expand -group timings -radix unsigned /owm_tb/uut/clk_prcl_r
add wave -noupdate -expand -group uut -expand -group timings -radix decimal /owm_tb/uut/t_reset_l_r
add wave -noupdate -expand -group uut -expand -group timings -radix decimal /owm_tb/uut/t_reset_h_r
add wave -noupdate -expand -group uut -expand -group timings -radix decimal /owm_tb/uut/t_reset_pd_r
add wave -noupdate -expand -group uut -expand -group timings -radix decimal /owm_tb/uut/t_write_slot_r
add wave -noupdate -expand -group uut -expand -group timings -radix decimal /owm_tb/uut/t_write_l_r
add wave -noupdate -expand -group uut -expand -group timings -radix decimal /owm_tb/uut/t_write_rec_r
add wave -noupdate -expand -group uut -expand -group timings -radix decimal /owm_tb/uut/t_read_slot_r
add wave -noupdate -expand -group uut -expand -group timings -radix decimal /owm_tb/uut/t_read_l_r
add wave -noupdate -expand -group uut -expand -group timings -radix decimal /owm_tb/uut/t_read_read_r
add wave -noupdate -expand -group uut -expand -group timings -radix decimal /owm_tb/uut/t_read_rec_r
add wave -noupdate -expand -group uut -expand -group timings -divider <NULL>
add wave -noupdate -expand -group uut -expand -group timings -radix unsigned /owm_tb/uut/t_ow_write_l
add wave -noupdate -expand -group uut -expand -group timings -radix unsigned /owm_tb/uut/t_ow_read_l
add wave -noupdate -expand -group uut -expand -group timings -radix unsigned /owm_tb/uut/t_ow_read_ena
add wave -noupdate -expand -group uut -expand -group timings -radix unsigned /owm_tb/uut/t_ow_check_presence
add wave -noupdate -expand -group uut -divider <NULL>
add wave -noupdate -expand -group uut /owm_tb/uut/ow_addr_r
add wave -noupdate -expand -group uut /owm_tb/uut/wrdat_r
add wave -noupdate -expand -group uut -radix unsigned /owm_tb/uut/clkcnt
add wave -noupdate -expand -group uut /owm_tb/uut/clkena
add wave -noupdate -expand -group uut /owm_tb/uut/cmd_is_done
add wave -noupdate -expand -group uut /owm_tb/uut/tcnt
add wave -noupdate -expand -group uut /owm_tb/uut/read_ena
add wave -noupdate -expand -group uut /owm_tb/uut/check_presence_ena
add wave -noupdate -expand -group uut -divider <NULL>
add wave -noupdate -expand -group uut /owm_tb/uut/ow_i
add wave -noupdate -expand -group uut /owm_tb/uut/ow_o
add wave -noupdate -divider <NULL>
add wave -noupdate /owm_tb/owr
add wave -noupdate /owm_tb/dat_r
add wave -noupdate /owm_tb/dat_w
add wave -noupdate /owm_tb/ows_ena
add wave -noupdate -divider <NULL>
add wave -noupdate -group ows0 {/owm_tb/g[0]/ows_inst/ena}
add wave -noupdate -group ows0 {/owm_tb/g[0]/ows_inst/ovd}
add wave -noupdate -group ows0 {/owm_tb/g[0]/ows_inst/dat_r}
add wave -noupdate -group ows0 {/owm_tb/g[0]/ows_inst/dat_w}
add wave -noupdate -group ows0 {/owm_tb/g[0]/ows_inst/owr}
add wave -noupdate -group ows0 {/owm_tb/g[0]/ows_inst/pul}
add wave -noupdate -group ows0 {/owm_tb/g[0]/ows_inst/dat}
add wave -noupdate -group ows0 {/owm_tb/g[0]/ows_inst/sample_dat}
add wave -noupdate -group ows0 {/owm_tb/g[0]/ows_inst/sample_rst}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2686361 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 440
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {5111762 ns}

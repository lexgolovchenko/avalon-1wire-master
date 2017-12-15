
TOP_ENTITY = owm_tb

vpath %.sv ../../../rtl ../../../tb
HDL_SRC  = owm.sv owm_tb.sv owm_avalon_slave_interface.sv owm_avalon_slave.sv

vpath %.v ../../../tb
HDL_SRC += onewire_slave_model.v

include ../../../altera-makefiles/modelsim/modelsim.mk

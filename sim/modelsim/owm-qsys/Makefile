
# QUARTUS_PATH = c:/altera/15.1/quartus
# PYTHON3 = c:/Anaconda3/python

TOP_ENTITY = owm_qsys_tb

VSIM_OPT = -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver \
		   -L altera_lnsim_ver -L cycloneiv_hssi_ver \
		   -L cycloneiv_pcie_hip_ver -L cycloneiv_ver

VLOG_OPT = +define+TB=owm_qsys_tb \
		   +define+MASTER=owm_qsys_tb.u0.master

PRE_RUN_SCRIPT = presim.tcl

QSYS_LIB_PATH = ../../../rtl
vpath %.qsys ../../../tb
QSYS_SRC = owm_test_sys.qsys

vpath %.sv ../../../tb
HDL_SRC  = owm_qsys_test_programm.sv owm_qsys_tb.sv
vpath %.v ../../../tb
HDL_SRC += onewire_slave_model.v

# ---------------------------------------------------------

include ../../../altera-makefiles/modelsim/modelsim.mk

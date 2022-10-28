set  PATH_LIB "D:/fpga/xilinx/questa_simlib"
set  PATH_HDL "../../hdl"
 #Create compilation libraries
proc ensure_lib { lib } { if ![file isdirectory $lib] { vlib $lib } }
ensure_lib                work  

vmap   lib_cdc_v1_0_2	   			$PATH_LIB/lib_cdc_v1_0_2
vmap   axi_traffic_gen_v3_0_3	   	$PATH_LIB/axi_traffic_gen_v3_0_3
vmap   xpm                         	$PATH_LIB/xpm 
vmap   unisim                      	$PATH_LIB/unisim          
vmap   work                 	   	work 

alias c {
    vlog -sv -work work  $PATH_HDL/axi_lite_to_apb/axi_lite_to_apb.sv
    vlog -sv -work work  $PATH_HDL/axi_lite_to_apb/axi_lite_slave.sv
    vlog -sv -work work  $PATH_HDL/axi_lite_to_apb/cdc_axi_lite_to_apb.sv
    vlog -sv -work work  $PATH_HDL/axi_lite_to_apb/apb_ctrl.sv
    vlog -sv -work work  $PATH_HDL/axi_lite_to_apb/apb_master.sv
    
	vlog -sv -work work  $PATH_HDL/pulse_cdc.sv

	vlog -sv -work work  $PATH_HDL/ifc/axi_lite_ifc.sv
	vlog -sv -work work  $PATH_HDL/ifc/apb_ifc.sv

	vlog -sv -work work  ../../ip/axi_traffic_gen_ip/synth/axi_traffic_gen_ip.v
	vlog -sv -work work  ../axi_traffic_gen_ip_wrapper.sv

	vlog -sv -work work   tb_axi_lite_to_apb.sv
}
alias c_tb {
	vlog -sv -work work   tb_axi_lite_to_apb.sv
}
alias s {
	vsim  -t 1ps -voptargs="+acc" -L work work.tb_axi_lite_to_apb -L unisim -L xpm -L lib_cdc_v1_0_2 -L axi_traffic_gen_v3_0_3
	do ./wave.do 
	run -all
}

alias rs {
	restart -f
	run -all
}	
proc qs {}  {quit -sim}






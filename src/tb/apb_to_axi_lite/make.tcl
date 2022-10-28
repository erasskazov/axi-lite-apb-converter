set  PATH_LIB "D:/fpga/xilinx/questa_simlib"
set  PATH_HDL "../../hdl"
 #Create compilation libraries
proc ensure_lib { lib } { if ![file isdirectory $lib] { vlib $lib } }
ensure_lib                work  

vmap   axi_traffic_gen_v3_0_3	   	$PATH_LIB/axi_traffic_gen_v3_0_3
vmap   lib_cdc_v1_0_2	   			$PATH_LIB/lib_cdc_v1_0_2
vmap   lib_pkg_v1_0_2	   			$PATH_LIB/lib_pkg_v1_0_2
vmap   blk_mem_gen_v8_4_1	   		$PATH_LIB/blk_mem_gen_v8_4_1
vmap   xpm                         	$PATH_LIB/xpm 
vmap   unisim                      	$PATH_LIB/unisim          
vmap   work                 	   	work 

alias c {
    vlog -sv -work work  $PATH_HDL/apb_to_axi_lite/apb_to_axi_lite.sv
    vlog -sv -work work  $PATH_HDL/apb_to_axi_lite/axi_lite_master.sv
    vlog -sv -work work  $PATH_HDL/apb_to_axi_lite/cdc_apb_to_axi_lite.sv
    vlog -sv -work work  $PATH_HDL/apb_to_axi_lite/axi_lite_ctrl.sv
    vlog -sv -work work  $PATH_HDL/apb_to_axi_lite/apb_slave.sv
    
	vlog -sv -work work  $PATH_HDL/pulse_cdc.sv

	vlog -sv -work work  $PATH_HDL/ifc/axi_lite_ifc.sv
	vlog -sv -work work  $PATH_HDL/ifc/apb_ifc.sv

	vlog -sv -work work  	 	../../ip/axi_traffic_gen_ip/synth/axi_traffic_gen_ip.v
	vcom -work work -64 -93		../../ip/blk_mem_gen_ip/synth/blk_mem_gen_ip.vhd

	vlog -sv -work work	  ../axi_traffic_gen_ip_wrapper.sv
	vlog -sv -work work	  ../blk_mem_gen_ip_wrapper.sv

	vlog -sv -work work   tb_apb_to_axi_lite.sv
}
alias c_tb {
	vlog -sv -work work   tb_apb_to_axi_lite.sv
}
alias s {
	vsim  -t 1ps -voptargs="+acc" -L work work.tb_apb_to_axi_lite -L unisim -L xpm -L lib_cdc_v1_0_2 -L axi_traffic_gen_v3_0_3 -L lib_pkg_v1_0_2 -L blk_mem_gen_v8_4_1 -L lib_cdc_v1_0_2
	do ./wave.do 
	run -all
}

alias rs {
	restart -f
	run -all
}	
proc qs {}  {quit -sim}






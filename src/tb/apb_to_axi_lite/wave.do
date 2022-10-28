onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group {apb to axi lite} /tb_apb_to_axi_lite/dut/axi_clk
add wave -noupdate -group {apb to axi lite} /tb_apb_to_axi_lite/dut/apb_clk
add wave -noupdate -group {apb to axi lite} /tb_apb_to_axi_lite/dut/sys_aresetn
add wave -noupdate -group {apb to axi lite} /tb_apb_to_axi_lite/dut/apb_cd_start_write
add wave -noupdate -group {apb to axi lite} /tb_apb_to_axi_lite/dut/apb_cd_start_read
add wave -noupdate -group {apb to axi lite} /tb_apb_to_axi_lite/dut/apb_cd_read_data_valid
add wave -noupdate -group {apb to axi lite} /tb_apb_to_axi_lite/dut/apb_cd_done_write
add wave -noupdate -group {apb to axi lite} /tb_apb_to_axi_lite/dut/axi_cd_start_write
add wave -noupdate -group {apb to axi lite} /tb_apb_to_axi_lite/dut/axi_cd_start_read
add wave -noupdate -group {apb to axi lite} /tb_apb_to_axi_lite/dut/axi_cd_read_data_valid
add wave -noupdate -group {apb to axi lite} /tb_apb_to_axi_lite/dut/axi_cd_done_write
add wave -noupdate -group {apb to axi lite} /tb_apb_to_axi_lite/dut/address
add wave -noupdate -group {apb to axi lite} /tb_apb_to_axi_lite/dut/write_data
add wave -noupdate -group {apb to axi lite} /tb_apb_to_axi_lite/dut/read_data
add wave -noupdate -group {apb to axi lite} /tb_apb_to_axi_lite/dut/be
add wave -noupdate -group {apb to axi lite} /tb_apb_to_axi_lite/dut/prot
add wave -noupdate -group {apb to axi lite} /tb_apb_to_axi_lite/dut/resp
add wave -noupdate -group {blk mem ip} /tb_apb_to_axi_lite/blk_mem_gen_ip_wrapper_inst/blk_mem_ip_inst/rsta_busy
add wave -noupdate -group {blk mem ip} /tb_apb_to_axi_lite/blk_mem_gen_ip_wrapper_inst/blk_mem_ip_inst/rstb_busy
add wave -noupdate -group {blk mem ip} /tb_apb_to_axi_lite/blk_mem_gen_ip_wrapper_inst/blk_mem_ip_inst/s_aclk
add wave -noupdate -group {blk mem ip} /tb_apb_to_axi_lite/blk_mem_gen_ip_wrapper_inst/blk_mem_ip_inst/s_aresetn
add wave -noupdate -group {blk mem ip} /tb_apb_to_axi_lite/blk_mem_gen_ip_wrapper_inst/blk_mem_ip_inst/s_axi_araddr
add wave -noupdate -group {blk mem ip} /tb_apb_to_axi_lite/blk_mem_gen_ip_wrapper_inst/blk_mem_ip_inst/s_axi_arready
add wave -noupdate -group {blk mem ip} /tb_apb_to_axi_lite/blk_mem_gen_ip_wrapper_inst/blk_mem_ip_inst/s_axi_arvalid
add wave -noupdate -group {blk mem ip} /tb_apb_to_axi_lite/blk_mem_gen_ip_wrapper_inst/blk_mem_ip_inst/s_axi_awaddr
add wave -noupdate -group {blk mem ip} /tb_apb_to_axi_lite/blk_mem_gen_ip_wrapper_inst/blk_mem_ip_inst/s_axi_awready
add wave -noupdate -group {blk mem ip} /tb_apb_to_axi_lite/blk_mem_gen_ip_wrapper_inst/blk_mem_ip_inst/s_axi_awvalid
add wave -noupdate -group {blk mem ip} /tb_apb_to_axi_lite/blk_mem_gen_ip_wrapper_inst/blk_mem_ip_inst/s_axi_bready
add wave -noupdate -group {blk mem ip} /tb_apb_to_axi_lite/blk_mem_gen_ip_wrapper_inst/blk_mem_ip_inst/s_axi_bresp
add wave -noupdate -group {blk mem ip} /tb_apb_to_axi_lite/blk_mem_gen_ip_wrapper_inst/blk_mem_ip_inst/s_axi_bvalid
add wave -noupdate -group {blk mem ip} /tb_apb_to_axi_lite/blk_mem_gen_ip_wrapper_inst/blk_mem_ip_inst/s_axi_rdata
add wave -noupdate -group {blk mem ip} /tb_apb_to_axi_lite/blk_mem_gen_ip_wrapper_inst/blk_mem_ip_inst/s_axi_rready
add wave -noupdate -group {blk mem ip} /tb_apb_to_axi_lite/blk_mem_gen_ip_wrapper_inst/blk_mem_ip_inst/s_axi_rresp
add wave -noupdate -group {blk mem ip} /tb_apb_to_axi_lite/blk_mem_gen_ip_wrapper_inst/blk_mem_ip_inst/s_axi_rvalid
add wave -noupdate -group {blk mem ip} /tb_apb_to_axi_lite/blk_mem_gen_ip_wrapper_inst/blk_mem_ip_inst/s_axi_wdata
add wave -noupdate -group {blk mem ip} /tb_apb_to_axi_lite/blk_mem_gen_ip_wrapper_inst/blk_mem_ip_inst/s_axi_wready
add wave -noupdate -group {blk mem ip} /tb_apb_to_axi_lite/blk_mem_gen_ip_wrapper_inst/blk_mem_ip_inst/s_axi_wstrb
add wave -noupdate -group {blk mem ip} /tb_apb_to_axi_lite/blk_mem_gen_ip_wrapper_inst/blk_mem_ip_inst/s_axi_wvalid
add wave -noupdate -group {apb slave} /tb_apb_to_axi_lite/dut/apb_slave_inst/address
add wave -noupdate -group {apb slave} /tb_apb_to_axi_lite/dut/apb_slave_inst/apb_clk
add wave -noupdate -group {apb slave} /tb_apb_to_axi_lite/dut/apb_slave_inst/apb_prdata
add wave -noupdate -group {apb slave} /tb_apb_to_axi_lite/dut/apb_slave_inst/apb_pready
add wave -noupdate -group {apb slave} /tb_apb_to_axi_lite/dut/apb_slave_inst/apb_pslverr
add wave -noupdate -group {apb slave} /tb_apb_to_axi_lite/dut/apb_slave_inst/AW_APB
add wave -noupdate -group {apb slave} /tb_apb_to_axi_lite/dut/apb_slave_inst/be
add wave -noupdate -group {apb slave} /tb_apb_to_axi_lite/dut/apb_slave_inst/done
add wave -noupdate -group {apb slave} /tb_apb_to_axi_lite/dut/apb_slave_inst/done_write
add wave -noupdate -group {apb slave} /tb_apb_to_axi_lite/dut/apb_slave_inst/DW_APB
add wave -noupdate -group {apb slave} /tb_apb_to_axi_lite/dut/apb_slave_inst/prot
add wave -noupdate -group {apb slave} /tb_apb_to_axi_lite/dut/apb_slave_inst/read_data
add wave -noupdate -group {apb slave} /tb_apb_to_axi_lite/dut/apb_slave_inst/read_data_valid
add wave -noupdate -group {apb slave} /tb_apb_to_axi_lite/dut/apb_slave_inst/resp
add wave -noupdate -group {apb slave} /tb_apb_to_axi_lite/dut/apb_slave_inst/start_read
add wave -noupdate -group {apb slave} /tb_apb_to_axi_lite/dut/apb_slave_inst/start_write
add wave -noupdate -group {apb slave} /tb_apb_to_axi_lite/dut/apb_slave_inst/state
add wave -noupdate -group {apb slave} /tb_apb_to_axi_lite/dut/apb_slave_inst/sys_aresetn
add wave -noupdate -group {apb slave} /tb_apb_to_axi_lite/dut/apb_slave_inst/write_data
add wave -noupdate -group cdc /tb_apb_to_axi_lite/dut/cdc_apb_to_axi_lite_inst/apb_cd_done_write
add wave -noupdate -group cdc /tb_apb_to_axi_lite/dut/cdc_apb_to_axi_lite_inst/apb_cd_read_data_valid
add wave -noupdate -group cdc /tb_apb_to_axi_lite/dut/cdc_apb_to_axi_lite_inst/apb_cd_start_read
add wave -noupdate -group cdc /tb_apb_to_axi_lite/dut/cdc_apb_to_axi_lite_inst/apb_cd_start_write
add wave -noupdate -group cdc /tb_apb_to_axi_lite/dut/cdc_apb_to_axi_lite_inst/apb_clk
add wave -noupdate -group cdc /tb_apb_to_axi_lite/dut/cdc_apb_to_axi_lite_inst/axi_cd_done_write
add wave -noupdate -group cdc /tb_apb_to_axi_lite/dut/cdc_apb_to_axi_lite_inst/axi_cd_read_data_valid
add wave -noupdate -group cdc /tb_apb_to_axi_lite/dut/cdc_apb_to_axi_lite_inst/axi_cd_start_read
add wave -noupdate -group cdc /tb_apb_to_axi_lite/dut/cdc_apb_to_axi_lite_inst/axi_cd_start_write
add wave -noupdate -group cdc /tb_apb_to_axi_lite/dut/cdc_apb_to_axi_lite_inst/axi_clk
add wave -noupdate -group cdc /tb_apb_to_axi_lite/dut/cdc_apb_to_axi_lite_inst/sys_aresetn
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/address
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/address_axi
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/ADDRESS_BIT_OFFSET
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/ADDRESS_OFFSET
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/address_reg
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/AW_APB
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/AW_AXI
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/axi_clk
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/AXI_WORD_COUNT
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/be
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/be_axi
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/be_reg
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/be_sh_reg
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/DIF_AW_AXI_APB
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/DIF_DW_AXI_APB
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/DIF_WSTRB_AXI_APB
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/done_write
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/done_write_axi
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/DW_APB
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/DW_AXI
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/EXPAND
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/EXPAND_ADDRESS
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/MULTIPLE_TRANSACTIONS
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/next_address
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/prot
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/prot_axi
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/prot_reg
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/read_data
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/read_data_axi
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/read_data_valid
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/read_data_valid_axi
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/read_word_count
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/resp
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/resp_axi
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/start
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/start_read
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/start_read_axi
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/start_read_reg
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/start_write
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/start_write_axi
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/start_write_reg
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/state
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/sys_aresetn
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/write_data
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/write_data_axi
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/write_data_reg
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/write_data_sh_reg
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/write_word_count
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/WSTRB_APB
add wave -noupdate -group {axi lite ctrl} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/WSTRB_AXI
add wave -noupdate -group {axi lite master} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/axi_lite_master_inst/address
add wave -noupdate -group {axi lite master} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/axi_lite_master_inst/AW_AXI
add wave -noupdate -group {axi lite master} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/axi_lite_master_inst/axi_araddr
add wave -noupdate -group {axi lite master} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/axi_lite_master_inst/axi_arprot
add wave -noupdate -group {axi lite master} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/axi_lite_master_inst/axi_arvalid
add wave -noupdate -group {axi lite master} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/axi_lite_master_inst/axi_awaddr
add wave -noupdate -group {axi lite master} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/axi_lite_master_inst/axi_awprot
add wave -noupdate -group {axi lite master} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/axi_lite_master_inst/axi_awvalid
add wave -noupdate -group {axi lite master} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/axi_lite_master_inst/axi_bready
add wave -noupdate -group {axi lite master} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/axi_lite_master_inst/axi_clk
add wave -noupdate -group {axi lite master} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/axi_lite_master_inst/axi_rready
add wave -noupdate -group {axi lite master} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/axi_lite_master_inst/axi_wdata
add wave -noupdate -group {axi lite master} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/axi_lite_master_inst/axi_wstrb
add wave -noupdate -group {axi lite master} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/axi_lite_master_inst/axi_wvalid
add wave -noupdate -group {axi lite master} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/axi_lite_master_inst/be
add wave -noupdate -group {axi lite master} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/axi_lite_master_inst/done_write
add wave -noupdate -group {axi lite master} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/axi_lite_master_inst/DW_AXI
add wave -noupdate -group {axi lite master} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/axi_lite_master_inst/prot
add wave -noupdate -group {axi lite master} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/axi_lite_master_inst/read_data
add wave -noupdate -group {axi lite master} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/axi_lite_master_inst/read_data_valid
add wave -noupdate -group {axi lite master} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/axi_lite_master_inst/resp
add wave -noupdate -group {axi lite master} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/axi_lite_master_inst/start_read
add wave -noupdate -group {axi lite master} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/axi_lite_master_inst/start_write
add wave -noupdate -group {axi lite master} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/axi_lite_master_inst/sys_aresetn
add wave -noupdate -group {axi lite master} /tb_apb_to_axi_lite/dut/axi_lite_ctrl_inst/axi_lite_master_inst/write_data
add wave -noupdate -group {ifc axi blk mem} /tb_apb_to_axi_lite/axi_my_converter2blk_mem/awaddr
add wave -noupdate -group {ifc axi blk mem} /tb_apb_to_axi_lite/axi_my_converter2blk_mem/awprot
add wave -noupdate -group {ifc axi blk mem} /tb_apb_to_axi_lite/axi_my_converter2blk_mem/awvalid
add wave -noupdate -group {ifc axi blk mem} /tb_apb_to_axi_lite/axi_my_converter2blk_mem/awready
add wave -noupdate -group {ifc axi blk mem} /tb_apb_to_axi_lite/axi_my_converter2blk_mem/wdata
add wave -noupdate -group {ifc axi blk mem} /tb_apb_to_axi_lite/axi_my_converter2blk_mem/wstrb
add wave -noupdate -group {ifc axi blk mem} /tb_apb_to_axi_lite/axi_my_converter2blk_mem/wvalid
add wave -noupdate -group {ifc axi blk mem} /tb_apb_to_axi_lite/axi_my_converter2blk_mem/wready
add wave -noupdate -group {ifc axi blk mem} /tb_apb_to_axi_lite/axi_my_converter2blk_mem/bresp
add wave -noupdate -group {ifc axi blk mem} /tb_apb_to_axi_lite/axi_my_converter2blk_mem/bvalid
add wave -noupdate -group {ifc axi blk mem} /tb_apb_to_axi_lite/axi_my_converter2blk_mem/bready
add wave -noupdate -group {ifc axi blk mem} /tb_apb_to_axi_lite/axi_my_converter2blk_mem/araddr
add wave -noupdate -group {ifc axi blk mem} /tb_apb_to_axi_lite/axi_my_converter2blk_mem/arprot
add wave -noupdate -group {ifc axi blk mem} /tb_apb_to_axi_lite/axi_my_converter2blk_mem/arvalid
add wave -noupdate -group {ifc axi blk mem} /tb_apb_to_axi_lite/axi_my_converter2blk_mem/arready
add wave -noupdate -group {ifc axi blk mem} /tb_apb_to_axi_lite/axi_my_converter2blk_mem/rdata
add wave -noupdate -group {ifc axi blk mem} /tb_apb_to_axi_lite/axi_my_converter2blk_mem/rresp
add wave -noupdate -group {ifc axi blk mem} /tb_apb_to_axi_lite/axi_my_converter2blk_mem/rvalid
add wave -noupdate -group {ifc axi blk mem} /tb_apb_to_axi_lite/axi_my_converter2blk_mem/rready
add wave -noupdate -expand -group apb /tb_apb_to_axi_lite/m_apb/paddr
add wave -noupdate -expand -group apb /tb_apb_to_axi_lite/m_apb/psel
add wave -noupdate -expand -group apb /tb_apb_to_axi_lite/m_apb/penable
add wave -noupdate -expand -group apb /tb_apb_to_axi_lite/m_apb/pwrite
add wave -noupdate -expand -group apb /tb_apb_to_axi_lite/m_apb/pwdata
add wave -noupdate -expand -group apb /tb_apb_to_axi_lite/m_apb/pready
add wave -noupdate -expand -group apb /tb_apb_to_axi_lite/m_apb/prdata
add wave -noupdate -expand -group apb /tb_apb_to_axi_lite/m_apb/pslverr
add wave -noupdate -expand -group apb /tb_apb_to_axi_lite/m_apb/pprot
add wave -noupdate -expand -group apb /tb_apb_to_axi_lite/m_apb/pstrb
add wave -noupdate /tb_apb_to_axi_lite/apb_clk
add wave -noupdate /tb_apb_to_axi_lite/axi_clk
add wave -noupdate /tb_apb_to_axi_lite/sys_aresetn
add wave -noupdate /tb_apb_to_axi_lite/apb_write_addr_mem
add wave -noupdate /tb_apb_to_axi_lite/apb_write_data_mem
add wave -noupdate /tb_apb_to_axi_lite/apb_read_data_mem
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {4442357 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 497
configure wave -valuecolwidth 153
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {0 ps} {18249 ns}

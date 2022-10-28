onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group {s axi} /tb_axi_lite_to_apb/s_axi_lite/awaddr
add wave -noupdate -expand -group {s axi} /tb_axi_lite_to_apb/s_axi_lite/awprot
add wave -noupdate -expand -group {s axi} /tb_axi_lite_to_apb/s_axi_lite/awvalid
add wave -noupdate -expand -group {s axi} /tb_axi_lite_to_apb/s_axi_lite/awready
add wave -noupdate -expand -group {s axi} /tb_axi_lite_to_apb/s_axi_lite/wdata
add wave -noupdate -expand -group {s axi} /tb_axi_lite_to_apb/s_axi_lite/wstrb
add wave -noupdate -expand -group {s axi} /tb_axi_lite_to_apb/s_axi_lite/wvalid
add wave -noupdate -expand -group {s axi} /tb_axi_lite_to_apb/s_axi_lite/wready
add wave -noupdate -expand -group {s axi} /tb_axi_lite_to_apb/s_axi_lite/bresp
add wave -noupdate -expand -group {s axi} /tb_axi_lite_to_apb/s_axi_lite/bvalid
add wave -noupdate -expand -group {s axi} /tb_axi_lite_to_apb/s_axi_lite/bready
add wave -noupdate -expand -group {s axi} /tb_axi_lite_to_apb/s_axi_lite/araddr
add wave -noupdate -expand -group {s axi} /tb_axi_lite_to_apb/s_axi_lite/arprot
add wave -noupdate -expand -group {s axi} /tb_axi_lite_to_apb/s_axi_lite/arvalid
add wave -noupdate -expand -group {s axi} /tb_axi_lite_to_apb/s_axi_lite/arready
add wave -noupdate -expand -group {s axi} /tb_axi_lite_to_apb/s_axi_lite/rdata
add wave -noupdate -expand -group {s axi} /tb_axi_lite_to_apb/s_axi_lite/rresp
add wave -noupdate -expand -group {s axi} /tb_axi_lite_to_apb/s_axi_lite/rvalid
add wave -noupdate -expand -group {s axi} /tb_axi_lite_to_apb/s_axi_lite/rready
add wave -noupdate -group {m apb} /tb_axi_lite_to_apb/m_apb/paddr
add wave -noupdate -group {m apb} /tb_axi_lite_to_apb/m_apb/psel
add wave -noupdate -group {m apb} /tb_axi_lite_to_apb/m_apb/penable
add wave -noupdate -group {m apb} /tb_axi_lite_to_apb/m_apb/pwrite
add wave -noupdate -group {m apb} /tb_axi_lite_to_apb/m_apb/pwdata
add wave -noupdate -group {m apb} /tb_axi_lite_to_apb/m_apb/pready
add wave -noupdate -group {m apb} /tb_axi_lite_to_apb/m_apb/prdata
add wave -noupdate -group {m apb} /tb_axi_lite_to_apb/m_apb/pslverr
add wave -noupdate -group {m apb} /tb_axi_lite_to_apb/m_apb/pprot
add wave -noupdate -group {m apb} /tb_axi_lite_to_apb/m_apb/pstrb
add wave -noupdate -group {axi lite slave} /tb_axi_lite_to_apb/dut/axi_lite_slave_inst/AW_AXI
add wave -noupdate -group {axi lite slave} /tb_axi_lite_to_apb/dut/axi_lite_slave_inst/aw_en
add wave -noupdate -group {axi lite slave} /tb_axi_lite_to_apb/dut/axi_lite_slave_inst/axi_araddr
add wave -noupdate -group {axi lite slave} /tb_axi_lite_to_apb/dut/axi_lite_slave_inst/axi_arready
add wave -noupdate -group {axi lite slave} /tb_axi_lite_to_apb/dut/axi_lite_slave_inst/axi_awready
add wave -noupdate -group {axi lite slave} /tb_axi_lite_to_apb/dut/axi_lite_slave_inst/axi_bresp
add wave -noupdate -group {axi lite slave} /tb_axi_lite_to_apb/dut/axi_lite_slave_inst/axi_bvalid
add wave -noupdate -group {axi lite slave} /tb_axi_lite_to_apb/dut/axi_lite_slave_inst/axi_clk
add wave -noupdate -group {axi lite slave} /tb_axi_lite_to_apb/dut/axi_lite_slave_inst/axi_rdata
add wave -noupdate -group {axi lite slave} /tb_axi_lite_to_apb/dut/axi_lite_slave_inst/axi_rresp
add wave -noupdate -group {axi lite slave} /tb_axi_lite_to_apb/dut/axi_lite_slave_inst/axi_rvalid
add wave -noupdate -group {axi lite slave} /tb_axi_lite_to_apb/dut/axi_lite_slave_inst/axi_wready
add wave -noupdate -group {axi lite slave} /tb_axi_lite_to_apb/dut/axi_lite_slave_inst/be
add wave -noupdate -group {axi lite slave} /tb_axi_lite_to_apb/dut/axi_lite_slave_inst/done_write
add wave -noupdate -group {axi lite slave} /tb_axi_lite_to_apb/dut/axi_lite_slave_inst/DW_AXI
add wave -noupdate -group {axi lite slave} /tb_axi_lite_to_apb/dut/axi_lite_slave_inst/read_address
add wave -noupdate -group {axi lite slave} /tb_axi_lite_to_apb/dut/axi_lite_slave_inst/read_data
add wave -noupdate -group {axi lite slave} /tb_axi_lite_to_apb/dut/axi_lite_slave_inst/read_data_accepted
add wave -noupdate -group {axi lite slave} /tb_axi_lite_to_apb/dut/axi_lite_slave_inst/read_data_reg
add wave -noupdate -group {axi lite slave} /tb_axi_lite_to_apb/dut/axi_lite_slave_inst/read_data_valid
add wave -noupdate -group {axi lite slave} /tb_axi_lite_to_apb/dut/axi_lite_slave_inst/read_data_valid_reg
add wave -noupdate -group {axi lite slave} /tb_axi_lite_to_apb/dut/axi_lite_slave_inst/rprot
add wave -noupdate -group {axi lite slave} /tb_axi_lite_to_apb/dut/axi_lite_slave_inst/slv_err
add wave -noupdate -group {axi lite slave} /tb_axi_lite_to_apb/dut/axi_lite_slave_inst/slv_rden
add wave -noupdate -group {axi lite slave} /tb_axi_lite_to_apb/dut/axi_lite_slave_inst/slv_wren
add wave -noupdate -group {axi lite slave} /tb_axi_lite_to_apb/dut/axi_lite_slave_inst/start_read
add wave -noupdate -group {axi lite slave} /tb_axi_lite_to_apb/dut/axi_lite_slave_inst/start_write
add wave -noupdate -group {axi lite slave} /tb_axi_lite_to_apb/dut/axi_lite_slave_inst/sys_aresetn
add wave -noupdate -group {axi lite slave} /tb_axi_lite_to_apb/dut/axi_lite_slave_inst/wprot
add wave -noupdate -group {axi lite slave} /tb_axi_lite_to_apb/dut/axi_lite_slave_inst/write_address
add wave -noupdate -group {axi lite slave} /tb_axi_lite_to_apb/dut/axi_lite_slave_inst/write_data
add wave -noupdate -group {cdc } /tb_axi_lite_to_apb/dut/cdc_axi_lite_to_apb_inst/axi_clk
add wave -noupdate -group {cdc } /tb_axi_lite_to_apb/dut/cdc_axi_lite_to_apb_inst/apb_clk
add wave -noupdate -group {cdc } /tb_axi_lite_to_apb/dut/cdc_axi_lite_to_apb_inst/sys_aresetn
add wave -noupdate -group {cdc } /tb_axi_lite_to_apb/dut/cdc_axi_lite_to_apb_inst/axi_cd_start_read
add wave -noupdate -group {cdc } /tb_axi_lite_to_apb/dut/cdc_axi_lite_to_apb_inst/axi_cd_start_write
add wave -noupdate -group {cdc } /tb_axi_lite_to_apb/dut/cdc_axi_lite_to_apb_inst/apb_cd_read_data_valid
add wave -noupdate -group {cdc } /tb_axi_lite_to_apb/dut/cdc_axi_lite_to_apb_inst/apb_cd_done_write
add wave -noupdate -group {cdc } /tb_axi_lite_to_apb/dut/cdc_axi_lite_to_apb_inst/axi_cd_read_data_valid
add wave -noupdate -group {cdc } /tb_axi_lite_to_apb/dut/cdc_axi_lite_to_apb_inst/axi_cd_done_write
add wave -noupdate -group {cdc } /tb_axi_lite_to_apb/dut/cdc_axi_lite_to_apb_inst/apb_cd_start_read
add wave -noupdate -group {cdc } /tb_axi_lite_to_apb/dut/cdc_axi_lite_to_apb_inst/apb_cd_start_write
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/ADDRESS_BIT_OFFSET
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/ADDRESS_OFFSET
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/apb_clk
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/APB_WORD_COUNT
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/AW_APB
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/AW_AXI
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/be
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/be_apb
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/be_reg
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/be_sh_reg
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/DIF_AW_AXI_APB
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/DIF_DW_AXI_APB
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/DIF_WSTRB_AXI_APB
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/done_write
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/done_write_apb
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/DW_APB
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/DW_AXI
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/EXPAND
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/EXPAND_ADDRESS
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/MULTIPLE_TRANSACTIONS
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/next_address
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/read_address
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/read_address_apb
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/read_address_reg
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/read_data
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/read_data_apb
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/read_data_valid
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/read_data_valid_apb
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/read_word_count
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/rprot
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/rprot_apb
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/rprot_reg
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/slv_err
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/slv_err_apb
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/start
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/start_read
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/start_read_apb
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/start_read_reg
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/start_write
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/start_write_apb
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/start_write_reg
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/state
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/sys_aresetn
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/wprot
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/wprot_apb
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/wprot_reg
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/write_address
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/write_address_apb
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/write_address_reg
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/write_data
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/write_data_apb
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/write_data_reg
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/write_data_sh_reg
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/write_word_count
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/WSTRB_APB
add wave -noupdate -group {apb ctrl} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/WSTRB_AXI
add wave -noupdate -expand -group {apb master} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/apb_master_inst/apb_clk
add wave -noupdate -expand -group {apb master} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/apb_master_inst/apb_paddr
add wave -noupdate -expand -group {apb master} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/apb_master_inst/apb_penable
add wave -noupdate -expand -group {apb master} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/apb_master_inst/apb_pprot
add wave -noupdate -expand -group {apb master} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/apb_master_inst/apb_psel
add wave -noupdate -expand -group {apb master} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/apb_master_inst/apb_pstrb
add wave -noupdate -expand -group {apb master} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/apb_master_inst/apb_pwdata
add wave -noupdate -expand -group {apb master} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/apb_master_inst/apb_pwrite
add wave -noupdate -expand -group {apb master} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/apb_master_inst/AW_APB
add wave -noupdate -expand -group {apb master} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/apb_master_inst/be
add wave -noupdate -expand -group {apb master} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/apb_master_inst/done_write
add wave -noupdate -expand -group {apb master} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/apb_master_inst/DW_APB
add wave -noupdate -expand -group {apb master} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/apb_master_inst/read_address
add wave -noupdate -expand -group {apb master} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/apb_master_inst/read_data
add wave -noupdate -expand -group {apb master} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/apb_master_inst/read_data_valid
add wave -noupdate -expand -group {apb master} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/apb_master_inst/rprot
add wave -noupdate -expand -group {apb master} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/apb_master_inst/slv_err
add wave -noupdate -expand -group {apb master} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/apb_master_inst/start
add wave -noupdate -expand -group {apb master} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/apb_master_inst/start_read
add wave -noupdate -expand -group {apb master} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/apb_master_inst/start_write
add wave -noupdate -expand -group {apb master} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/apb_master_inst/state
add wave -noupdate -expand -group {apb master} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/apb_master_inst/sys_aresetn
add wave -noupdate -expand -group {apb master} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/apb_master_inst/wprot
add wave -noupdate -expand -group {apb master} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/apb_master_inst/write_address
add wave -noupdate -expand -group {apb master} /tb_axi_lite_to_apb/dut/apb_ctrl_inst/apb_master_inst/write_data
add wave -noupdate -group {traffic gen} /tb_axi_lite_to_apb/axi_traffic_gen_ip_wrapper_inst/traffic_gen_inst/done
add wave -noupdate -group {traffic gen} /tb_axi_lite_to_apb/axi_traffic_gen_ip_wrapper_inst/traffic_gen_inst/m_axi_lite_ch1_araddr
add wave -noupdate -group {traffic gen} /tb_axi_lite_to_apb/axi_traffic_gen_ip_wrapper_inst/traffic_gen_inst/m_axi_lite_ch1_arready
add wave -noupdate -group {traffic gen} /tb_axi_lite_to_apb/axi_traffic_gen_ip_wrapper_inst/traffic_gen_inst/m_axi_lite_ch1_arvalid
add wave -noupdate -group {traffic gen} /tb_axi_lite_to_apb/axi_traffic_gen_ip_wrapper_inst/traffic_gen_inst/m_axi_lite_ch1_awaddr
add wave -noupdate -group {traffic gen} /tb_axi_lite_to_apb/axi_traffic_gen_ip_wrapper_inst/traffic_gen_inst/m_axi_lite_ch1_awprot
add wave -noupdate -group {traffic gen} /tb_axi_lite_to_apb/axi_traffic_gen_ip_wrapper_inst/traffic_gen_inst/m_axi_lite_ch1_awready
add wave -noupdate -group {traffic gen} /tb_axi_lite_to_apb/axi_traffic_gen_ip_wrapper_inst/traffic_gen_inst/m_axi_lite_ch1_awvalid
add wave -noupdate -group {traffic gen} /tb_axi_lite_to_apb/axi_traffic_gen_ip_wrapper_inst/traffic_gen_inst/m_axi_lite_ch1_bready
add wave -noupdate -group {traffic gen} /tb_axi_lite_to_apb/axi_traffic_gen_ip_wrapper_inst/traffic_gen_inst/m_axi_lite_ch1_bresp
add wave -noupdate -group {traffic gen} /tb_axi_lite_to_apb/axi_traffic_gen_ip_wrapper_inst/traffic_gen_inst/m_axi_lite_ch1_bvalid
add wave -noupdate -group {traffic gen} /tb_axi_lite_to_apb/axi_traffic_gen_ip_wrapper_inst/traffic_gen_inst/m_axi_lite_ch1_rdata
add wave -noupdate -group {traffic gen} /tb_axi_lite_to_apb/axi_traffic_gen_ip_wrapper_inst/traffic_gen_inst/m_axi_lite_ch1_rready
add wave -noupdate -group {traffic gen} /tb_axi_lite_to_apb/axi_traffic_gen_ip_wrapper_inst/traffic_gen_inst/m_axi_lite_ch1_rresp
add wave -noupdate -group {traffic gen} /tb_axi_lite_to_apb/axi_traffic_gen_ip_wrapper_inst/traffic_gen_inst/m_axi_lite_ch1_rvalid
add wave -noupdate -group {traffic gen} /tb_axi_lite_to_apb/axi_traffic_gen_ip_wrapper_inst/traffic_gen_inst/m_axi_lite_ch1_wdata
add wave -noupdate -group {traffic gen} /tb_axi_lite_to_apb/axi_traffic_gen_ip_wrapper_inst/traffic_gen_inst/m_axi_lite_ch1_wready
add wave -noupdate -group {traffic gen} /tb_axi_lite_to_apb/axi_traffic_gen_ip_wrapper_inst/traffic_gen_inst/m_axi_lite_ch1_wstrb
add wave -noupdate -group {traffic gen} /tb_axi_lite_to_apb/axi_traffic_gen_ip_wrapper_inst/traffic_gen_inst/m_axi_lite_ch1_wvalid
add wave -noupdate -group {traffic gen} /tb_axi_lite_to_apb/axi_traffic_gen_ip_wrapper_inst/traffic_gen_inst/s_axi_aclk
add wave -noupdate -group {traffic gen} /tb_axi_lite_to_apb/axi_traffic_gen_ip_wrapper_inst/traffic_gen_inst/s_axi_aresetn
add wave -noupdate -group {traffic gen} /tb_axi_lite_to_apb/axi_traffic_gen_ip_wrapper_inst/traffic_gen_inst/status
add wave -noupdate /tb_axi_lite_to_apb/apb_clk
add wave -noupdate /tb_axi_lite_to_apb/axi_clk
add wave -noupdate /tb_axi_lite_to_apb/sys_aresetn
add wave -noupdate /tb_axi_lite_to_apb/traffic_done
add wave -noupdate /tb_axi_lite_to_apb/traffic_status
add wave -noupdate /tb_axi_lite_to_apb/apb_slave_mem
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1759277 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 406
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ps} {23110500 ps}

module axi_traffic_gen_ip_wrapper
(
    input  logic                clk             ,
    input  logic                aresetn         ,

    axi_lite_ifc.master         m_axi_lite      ,

    output logic                done            ,
    output logic [31 : 0]       status
);

axi_traffic_gen_ip      traffic_gen_inst
(
    .s_axi_aclk                 ( clk                           ),
    .s_axi_aresetn              ( aresetn                       ),
    .m_axi_lite_ch1_awaddr      ( m_axi_lite.awaddr             ),
    .m_axi_lite_ch1_awprot      ( m_axi_lite.awprot             ),
    .m_axi_lite_ch1_awvalid     ( m_axi_lite.awvalid            ),
    .m_axi_lite_ch1_awready     ( m_axi_lite.awready            ),
    .m_axi_lite_ch1_wdata       ( m_axi_lite.wdata              ),
    .m_axi_lite_ch1_wstrb       ( m_axi_lite.wstrb              ),
    .m_axi_lite_ch1_wvalid      ( m_axi_lite.wvalid             ),
    .m_axi_lite_ch1_wready      ( m_axi_lite.wready             ),
    .m_axi_lite_ch1_bresp       ( m_axi_lite.bresp              ),
    .m_axi_lite_ch1_bvalid      ( m_axi_lite.bvalid             ),
    .m_axi_lite_ch1_bready      ( m_axi_lite.bready             ),
    .m_axi_lite_ch1_araddr      ( m_axi_lite.araddr             ),
    .m_axi_lite_ch1_arvalid     ( m_axi_lite.arvalid            ),
    .m_axi_lite_ch1_arready     ( m_axi_lite.arready            ),
    .m_axi_lite_ch1_rdata       ( m_axi_lite.rdata              ),
    .m_axi_lite_ch1_rvalid      ( m_axi_lite.rvalid             ),
    .m_axi_lite_ch1_rresp       ( m_axi_lite.rresp              ),
    .m_axi_lite_ch1_rready      ( m_axi_lite.rready             ),
    .done                       ( done                          ),
    .status                     ( status                        )
);

assign m_axi_lite.arprot = '0;

endmodule
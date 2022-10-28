module blk_mem_gen_ip_wrapper
(
    input  logic                clk         ,
    input  logic                aresetn     ,

    axi_lite_ifc.slave          s_axi_lite  ,

    output logic                rsta_busy   ,
    output logic                rstb_busy
);

blk_mem_gen_ip      blk_mem_ip_inst
(
    .rsta_busy       ( rsta_busy           ),
    .rstb_busy       ( rstb_busy           ),
    .s_aclk          ( clk                 ),
    .s_aresetn       ( aresetn             ),
    .s_axi_awaddr    ( s_axi_lite.awaddr   ),
    .s_axi_awvalid   ( s_axi_lite.awvalid  ),
    .s_axi_awready   ( s_axi_lite.awready  ),
    .s_axi_wdata     ( s_axi_lite.wdata    ),
    .s_axi_wstrb     ( s_axi_lite.wstrb    ),
    .s_axi_wvalid    ( s_axi_lite.wvalid   ),
    .s_axi_wready    ( s_axi_lite.wready   ),
    .s_axi_bresp     ( s_axi_lite.bresp    ),
    .s_axi_bvalid    ( s_axi_lite.bvalid   ),
    .s_axi_bready    ( s_axi_lite.bready   ),
    .s_axi_araddr    ( s_axi_lite.araddr   ),
    .s_axi_arvalid   ( s_axi_lite.arvalid  ),
    .s_axi_arready   ( s_axi_lite.arready  ),
    .s_axi_rdata     ( s_axi_lite.rdata    ),
    .s_axi_rresp     ( s_axi_lite.rresp    ),
    .s_axi_rvalid    ( s_axi_lite.rvalid   ),
    .s_axi_rready    ( s_axi_lite.rready   )
);

endmodule
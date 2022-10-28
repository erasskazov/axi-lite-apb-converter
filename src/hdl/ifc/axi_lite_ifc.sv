interface axi_lite_ifc #(
    parameter AW_AXI = 32,
    parameter DW_AXI = 32
);
    logic      [AW_AXI-1 : 0]           awaddr  ;
    logic      [2       : 0]            awprot   ;
    logic                               awvalid  ;
    logic                               awready  ;
    logic      [DW_AXI-1:0]             wdata    ;
    logic      [(DW_AXI / 8)-1 : 0]     wstrb    ;
    logic                               wvalid   ;
    logic                               wready   ;
    logic      [1       :0]             bresp    ;
    logic                               bvalid   ;
    logic                               bready   ;
    logic      [AW_AXI-1 : 0]           araddr   ;
    logic      [2       : 0]            arprot   ;
    logic                               arvalid  ;
    logic                               arready  ;
    logic      [DW_AXI-1 : 0]           rdata    ;
    logic      [1       : 0]            rresp    ;
    logic                               rvalid   ;
    logic                               rready   ;

    modport slave
    (
        input           awaddr    ,
        input           awprot    ,
        input           awvalid   ,
        output          awready   ,
        input           wdata     ,
        input           wstrb     ,
        input           wvalid    ,
        output          wready    ,
        output          bresp     ,
        output          bvalid    ,
        input           bready    ,
        input           araddr    ,
        input           arprot    ,
        input           arvalid   ,
        output          arready   ,
        output          rdata     ,
        output          rresp     ,
        output          rvalid    ,
        input           rready
    );

    modport master
    (
        output          awaddr    ,
        output          awprot    ,
        output          awvalid   ,
        input           awready   ,
        output          wdata     ,
        output          wstrb     ,
        output          wvalid    ,
        input           wready    ,
        input           bresp     ,
        input           bvalid    ,
        output          bready    ,
        output          araddr    ,
        output          arprot    ,
        output          arvalid   ,
        input           arready   ,
        input           rdata     ,
        input           rresp     ,
        input           rvalid    ,
        output          rready
    );

endinterface
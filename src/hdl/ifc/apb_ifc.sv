interface apb_ifc #(
    parameter AW_APB = 32,
    parameter DW_APB = 32
);
    logic       [AW_APB-1:0]        paddr   ;
    logic                           psel    ;
    logic                           penable ;
    logic                           pwrite  ;
    logic       [DW_APB-1:0]        pwdata  ;
    logic                           pready  ;
    logic       [DW_APB-1:0]        prdata  ;
    logic                           pslverr ;
    logic       [2       :0]        pprot   ;
    logic       [(DW_APB/8)-1:0]    pstrb   ;

    modport master
    (
        output          paddr   ,
        output          psel    ,
        output          penable ,
        output          pwrite  ,
        output          pwdata  ,
        input           pready  ,
        input           prdata  ,
        input           pslverr ,
        output          pprot   ,
        output          pstrb  
    );

    modport slave
    (
        input           paddr   ,
        input           psel    ,
        input           penable ,
        input           pwrite  ,
        input           pwdata  ,
        output          pready  ,
        output          prdata  ,
        output          pslverr ,
        input           pprot   ,
        input           pstrb          
    );

endinterface
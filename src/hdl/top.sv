`include "axilite_to_apb_define.svh"
module top #(
    parameter AW_AXI = `AW_AXI,
    parameter DW_AXI = `DW_AXI,
    parameter AW_APB = `AW_APB,
    parameter DW_APB = `DW_APB
)
(
    input  logic                    axi_clk             ,
    input  logic                    apb_clk             ,
    input  logic                    sys_aresetn         ,
    // axi lite -> apb
    axi_lite_ifc.slave              s_axi_lite          ,
    apb_ifc.master                  m_apb               ,
    // apb -> axi lite
    apb_ifc.slave                   s_apb               ,
    axi_lite_ifc.master             m_axi_lite 
);


// axi lite to apb converter
axi_lite_to_apb #(
    .AW_AXI                     ( AW_AXI ),
    .DW_AXI                     ( DW_AXI ),
    .AW_APB                     ( AW_APB ),
    .DW_APB                     ( DW_APB )
) axi_lite_to_apb_inst (
    .axi_clk                    ( axi_clk      ), // i
    .apb_clk                    ( apb_clk      ), // i
    .sys_aresetn                ( sys_aresetn  ), // i
    .s_axi_lite                 ( s_axi_lite   ), // ifc
    .m_apb                      ( m_apb        )  // ifc
);

// apb to axi lite converter
apb_to_axi_lite #(
    .AW_AXI                     ( AW_AXI ),
    .DW_AXI                     ( DW_AXI ),
    .AW_APB                     ( AW_APB ),
    .DW_APB                     ( DW_APB )    
) apb_to_axi_lite_inst (
    .axi_clk                    ( axi_clk     ), // i
    .apb_clk                    ( apb_clk     ), // i
    .sys_aresetn                ( sys_aresetn ), // i
    .s_apb                      ( s_apb       ), // ifc
    .m_axi_lite                 ( m_axi_lite  )  // ifc
);


endmodule
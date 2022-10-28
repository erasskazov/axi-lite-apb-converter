`include "axilite_to_apb_define.svh"
module axilite_to_apb(
                          input                axi_clk
                         ,input                apb_clk
                         ,input                sys_aresetn 

//------------------------------------->axilite-slave
                         ,input  [AW_AXI-1:0]  s_axi_awaddr
                         ,input  [2       :0]  s_axi_awprot
                         ,input                s_axi_awvalid 
                         ,output               s_axi_awready 
                         ,input  [DW_AXI-1:0]  s_axi_wdata  
                         ,input  [3       :0]  s_axi_wstrb   
                         ,input                s_axi_wvalid    
                         ,output               s_axi_wready 
                         ,output [1       :0]  s_axi_bresp 
                         ,output               s_axi_bvalid 
                         ,input                s_axi_bready 
                         ,input  [AW_AXI-1:0]  s_axi_araddr     
                         ,input  [2       :0]  s_axi_arprot 
                         ,input                s_axi_arvalid 
                         ,output               s_axi_arready 
                         ,output [DW_AXI-1:0]  s_axi_rdata 
                         ,output [1       :0]  s_axi_rresp 
                         ,output               s_axi_rvalid     
                         ,input                s_axi_rready 
//<-------------------------------------axilite-slave

//------------------------------------->axilite-master
                         ,output [AW_AXI-1:0]  m_axi_awaddr
                         ,output [2       :0]  m_axi_awprot
                         ,output               m_axi_awvalid 
                         ,input                m_axi_awready 
                         ,output [DW_AXI-1:0]  m_axi_wdata  
                         ,output [3       :0]  m_axi_wstrb   
                         ,output               m_axi_wvalid    
                         ,input                m_axi_wready 
                         ,input  [1       :0]  m_axi_bresp 
                         ,input                m_axi_bvalid 
                         ,output               m_axi_bready 
                         ,output [AW_AXI-1:0]  m_axi_araddr     
                         ,output [2       :0]  m_axi_arprot 
                         ,output               m_axi_arvalid 
                         ,output               m_axi_arready 
                         ,input  [DW_AXI-1:0]  m_axi_rdata 
                         ,input  [1       :0]  m_axi_rresp 
                         ,input                m_axi_rvalid     
                         ,output               m_axi_rready 

//<------------------------------------>axilite-master

//------------------------------------->apb-master
                         ,output [AW_APB-1:0]  m_apb_paddr 
                         ,output               m_apb_psel 
                         ,output               m_apb_penable 
                         ,output               m_apb_pwrite 
                         ,output [DW_APB-1:0]  m_apb_pwdata 
                         ,input                m_apb_pready 
                         ,input  [DW_APB-1:0]  m_apb_prdata 
                         ,input                m_apb_pslverr 
                         ,output [2       :0]  m_apb_pprot
                         ,output [3       :0]  m_apb_pstrb 
//<-------------------------------------apb-master

//------------------------------------->apb-slave
                         ,input  [AW_APB-1:0]  s_apb_paddr 
                         ,input                s_apb_psel 
                         ,input                s_apb_penable 
                         ,input                s_apb_pwrite 
                         ,input  [DW_APB-1:0]  s_apb_pwdata 
                         ,output               s_apb_pready 
                         ,output [DW_APB-1:0]  s_apb_prdata 
                         ,output               s_apb_pslverr 
                         ,input  [2       :0]  s_apb_pprot
                         ,input  [3       :0]  s_apb_pstrb 

//<-------------------------------------apb-slave
  );
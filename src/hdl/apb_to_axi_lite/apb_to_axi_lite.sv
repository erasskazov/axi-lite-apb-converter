`include "../axilite_to_apb_define.svh"
module apb_to_axi_lite #(
    parameter AW_AXI = `AW_AXI,
    parameter DW_AXI = `DW_AXI,
    parameter AW_APB = `AW_APB,
    parameter DW_APB = `DW_APB
)
(
    input  logic                    axi_clk         ,
    input  logic                    apb_clk         ,
    input  logic                    sys_aresetn     ,

    apb_ifc.slave                   s_apb           ,
    axi_lite_ifc.master             m_axi_lite      
    
);

logic                           apb_cd_start_write;
logic                           apb_cd_start_read;
logic                           apb_cd_read_data_valid;
logic                           apb_cd_done_write;

logic                           axi_cd_start_write;
logic                           axi_cd_start_read;
logic                           axi_cd_read_data_valid;
logic                           axi_cd_done_write;

logic   [AW_APB-1 : 0]          address;

logic   [DW_APB-1 : 0]          write_data;
logic   [DW_APB-1 : 0]          read_data;

logic   [(DW_APB/8)-1 : 0]      be;

logic   [2 : 0]                 prot;

logic   [1 : 0]                 resp;



apb_slave #(
    .AW_APB                     ( AW_APB ),
    .DW_APB                     ( DW_APB )
) apb_slave_inst (
    .apb_clk                    ( apb_clk                   ), // i
    .sys_aresetn                ( sys_aresetn               ), // i
    .s_apb                      ( s_apb                     ), // ifc
    .start_write                ( apb_cd_start_write        ), // o
    .start_read                 ( apb_cd_start_read         ), // o
    .address                    ( address                   ), // o
    .write_data                 ( write_data                ), // o
    .be                         ( be                        ), // o
    .prot                       ( prot                      ), // o
    .read_data                  ( read_data                 ), // i
    .read_data_valid            ( apb_cd_read_data_valid    ), // i
    .resp                       ( resp                      ), // i
    .done_write                 ( axi_cd_done_write         )  // i
);


cdc_apb_to_axi_lite         cdc_apb_to_axi_lite_inst
(
    .axi_clk                    ( axi_clk                   ), // i
    .apb_clk                    ( apb_clk                   ), // i
    .sys_aresetn                ( sys_aresetn               ), // i
    .axi_cd_start_read          ( axi_cd_start_read         ), // o
    .axi_cd_start_write         ( axi_cd_start_write        ), // o
    .apb_cd_read_data_valid     ( apb_cd_read_data_valid    ), // o
    .apb_cd_done_write          ( apb_cd_done_write         ), // o
    .axi_cd_read_data_valid     ( axi_cd_read_data_valid    ), // i
    .axi_cd_done_write          ( axi_cd_done_write         ), // i
    .apb_cd_start_read          ( apb_cd_start_read         ), // i
    .apb_cd_start_write         ( apb_cd_start_write        )  // i
);

axi_lite_ctrl#(
    .AW_AXI                     ( AW_AXI ),
    .DW_AXI                     ( DW_AXI ),
    .AW_APB                     ( AW_APB ),
    .DW_APB                     ( DW_APB ) 
) axi_lite_ctrl_inst (
    .axi_clk                    ( axi_clk                   ), // i
    .sys_aresetn                ( sys_aresetn               ), // i
    .m_axi_lite                 ( m_axi_lite                ), // ifc
    .start_write                ( axi_cd_start_write        ), // i
    .start_read                 ( axi_cd_start_read         ), // i
    .address                    ( address                   ), // i
    .write_data                 ( write_data                ), // i
    .prot                       ( prot                      ), // i
    .be                         ( be                        ), // i
    .resp                       ( resp                      ), // o
    .read_data                  ( read_data                 ), // o
    .read_data_valid            ( axi_cd_read_data_valid    ), // o
    .done_write                 ( axi_cd_done_write         )  // o
);



endmodule
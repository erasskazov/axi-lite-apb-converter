module axi_lite_to_apb #(
    parameter AW_AXI = 32,
    parameter DW_AXI = 32,
    parameter AW_APB = 32,
    parameter DW_APB = 32
)
(
    input  logic                    axi_clk         ,
    input  logic                    apb_clk         ,
    input  logic                    sys_aresetn     ,

    axi_lite_ifc.slave              s_axi_lite      ,
    apb_ifc.master                  m_apb
);

logic                           axi_cd_start_write;
logic                           axi_cd_start_read;
logic                           axi_cd_read_data_valid;
logic                           axi_cd_done_write;

logic                           apb_cd_start_write;
logic                           apb_cd_start_read;
logic                           apb_cd_read_data_valid;
logic                           apb_cd_done_write;

logic   [AW_AXI-1 : 0]          write_address;
logic   [AW_AXI-1 : 0]          read_address;

logic   [DW_AXI-1 : 0]          write_data;
logic   [DW_AXI-1 : 0]          read_data;

logic   [(DW_AXI/8)-1 : 0]      be;

logic   [2 : 0]                 wprot;
logic   [2 : 0]                 rprot;

logic                           slv_err;

logic                           start_write_apb;
logic                           start_read_apb;

logic   [(DW_APB/8)-1 : 0]      be_apb;

logic                           read_data_valid_apb;
logic                           done_write_apb;

// axi4 lite slave
axi_lite_slave  #(
    .AW_AXI                     ( AW_AXI ),
    .DW_AXI                     ( DW_AXI )
) axi_lite_slave_inst (
    .axi_clk                    ( axi_clk                   ), // i 
    .sys_aresetn                ( sys_aresetn               ), // i  
    .s_axi_lite                 ( s_axi_lite                ), //   
    .start_write                ( axi_cd_start_write        ), // o
    .start_read                 ( axi_cd_start_read         ), // o  
    .write_address              ( write_address             ), // o  
    .read_address               ( read_address              ), // o  
    .write_data                 ( write_data                ), // o  
    .be                         ( be                        ), // o  
    .wprot                      ( wprot                     ), // o  
    .read_data                  ( read_data                 ), // i  
    .read_data_valid            ( axi_cd_read_data_valid    ), // i  
    .rprot                      ( rprot                     ), // o  
    .done_write                 ( axi_cd_done_write         ), // i  
    .slv_err                    ( slv_err                   )  // i
);

// clock domain crossing (axi_clk -> apb_clk)
cdc_axi_lite_to_apb         cdc_axi_lite_to_apb_inst
(
    .axi_clk                     ( axi_clk                  ), // i
    .apb_clk                     ( apb_clk                  ), // i
    .sys_aresetn                 ( sys_aresetn              ), // i
    .axi_cd_start_read           ( axi_cd_start_read        ), // i
    .axi_cd_start_write          ( axi_cd_start_write       ), // i
    .apb_cd_read_data_valid      ( apb_cd_read_data_valid   ), // i
    .apb_cd_done_write           ( apb_cd_done_write        ), // i
    .axi_cd_read_data_valid      ( axi_cd_read_data_valid   ), // o
    .axi_cd_done_write           ( axi_cd_done_write        ), // o
    .apb_cd_start_read           ( apb_cd_start_read        ), // o
    .apb_cd_start_write          ( apb_cd_start_write       )  // o
);

// apb master controller
apb_ctrl #(
    .AW_AXI                     ( AW_AXI ),
    .DW_AXI                     ( DW_AXI ),
    .AW_APB                     ( AW_APB ),
    .DW_APB                     ( DW_APB )
) apb_ctrl_inst (
    .apb_clk                    ( apb_clk                   ), // i
    .sys_aresetn                ( sys_aresetn               ), // i
    .m_apb                      ( m_apb                     ),
    .start_read                 ( apb_cd_start_read         ), // i
    .start_write                ( apb_cd_start_write        ), // i
    .write_address              ( write_address             ), // i
    .read_address               ( read_address              ), // i
    .write_data                 ( write_data                ), // i
    .be                         ( be                        ), // i
    .wprot                      ( wprot                     ), // i
    .rprot                      ( rprot                     ), // i
    .slv_err                    ( slv_err                   ), // o
    .read_data                  ( read_data                 ), // o
    .read_data_valid            ( apb_cd_read_data_valid    ), // o
    .done_write                 ( apb_cd_done_write         )  // o
);


endmodule
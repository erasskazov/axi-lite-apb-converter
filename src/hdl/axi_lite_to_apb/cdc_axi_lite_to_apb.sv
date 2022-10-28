module cdc_axi_lite_to_apb
(
    input  logic                            axi_clk                     ,
    input  logic                            apb_clk                     ,
    input  logic                            sys_aresetn                 ,

    input  logic                            axi_cd_start_read           ,
    input  logic                            axi_cd_start_write          ,
    input  logic                            apb_cd_read_data_valid      ,
    input  logic                            apb_cd_done_write           ,
    output logic                            axi_cd_read_data_valid      ,
    output logic                            axi_cd_done_write           ,

    output logic                            apb_cd_start_read           ,
    output logic                            apb_cd_start_write          
);

// start read
pulse_cdc           pulse_cdc_start_read_inst
(
    .src_clk                ( axi_clk                   ),
    .dst_clk                ( apb_clk                   ),
    .aresetn                ( sys_aresetn               ),
    .src_impulse            ( axi_cd_start_read         ),
    .dst_impulse            ( apb_cd_start_read         )
);

// start write
pulse_cdc           pulse_cdc_start_write_inst
(
    .src_clk                ( axi_clk                   ),
    .dst_clk                ( apb_clk                   ),
    .aresetn                ( sys_aresetn               ),
    .src_impulse            ( axi_cd_start_write        ),
    .dst_impulse            ( apb_cd_start_write        )
);

// read_data_valid
pulse_cdc           pulse_cdc_read_data_valid_inst
(
    .src_clk                ( apb_clk                   ),
    .dst_clk                ( axi_clk                   ),
    .aresetn                ( sys_aresetn               ),
    .src_impulse            ( apb_cd_read_data_valid    ),
    .dst_impulse            ( axi_cd_read_data_valid    )
);

// done_write
pulse_cdc           pulse_cdc_done_write_inst
(
    .src_clk                ( apb_clk           ),
    .dst_clk                ( axi_clk           ),
    .aresetn                ( sys_aresetn       ),
    .src_impulse            ( apb_cd_done_write ),
    .dst_impulse            ( axi_cd_done_write )
);


endmodule
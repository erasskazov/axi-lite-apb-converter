`timescale 1ns / 1ns 

`include "../../hdl/axilite_to_apb_define.svh"

module tb_axi_lite_to_apb;

logic        sys_aresetn = 0;
logic        axi_clk = 1;
logic        apb_clk = 1;

logic [`DW_APB-1:0] apb_slave_mem   [0:63];

// ifc
axi_lite_ifc #(.AW_AXI(`AW_AXI), .DW_AXI(`DW_AXI)) s_axi_lite();
apb_ifc      #(.AW_APB(`AW_APB), .DW_APB(`DW_APB)) m_apb();

//
logic               traffic_done;
logic   [31:0]      traffic_status;

always #5 axi_clk = ~axi_clk;
always #10 apb_clk = ~apb_clk;

// dut
axi_lite_to_apb #(
    .AW_AXI(`AW_AXI),
    .DW_AXI(`DW_AXI),
    .AW_APB(`AW_APB),
    .DW_APB(`DW_APB)
) dut (
    .axi_clk                    ( axi_clk           ),
    .apb_clk                    ( apb_clk           ),
    .sys_aresetn                ( sys_aresetn       ),
    .s_axi_lite                 ( s_axi_lite        ),
    .m_apb                      ( m_apb             )    
);

// axi traffic generator
axi_traffic_gen_ip_wrapper      axi_traffic_gen_ip_wrapper_inst
(
    .clk                        ( axi_clk           ),
    .aresetn                    ( sys_aresetn       ),
    .m_axi_lite                 ( s_axi_lite        ),
    .done                       ( traffic_done      ),
    .status                     ( traffic_status    )
);

integer i;

// APB Slave
always_ff @(posedge apb_clk) begin
    if (~sys_aresetn) begin
        for (i = 0; i < 64; i = i + 1) begin
            apb_slave_mem[i] = 0;
        end
        m_apb.pslverr <= 1'b0;
        m_apb.pready <= 1'b0;
        m_apb.prdata <= 32'hFF;
    end else begin
        if (m_apb.psel & m_apb.penable & ~m_apb.pready) begin
            m_apb.pready <= 1'b1;
            if (m_apb.pwrite) begin
                apb_slave_mem[m_apb.paddr] = m_apb.pwdata;
            end else begin
                m_apb.prdata <= apb_slave_mem[m_apb.paddr];
            end
        end else begin
            m_apb.pready <= 1'b0;
            m_apb.prdata <= 32'hFF;
        end
    end
end

initial
begin
    #1000 sys_aresetn = 1;
    @(posedge traffic_done);
    #1000 $stop;
end




endmodule  //module_name
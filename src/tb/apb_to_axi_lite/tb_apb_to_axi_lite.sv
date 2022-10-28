`timescale 1ns / 1ns 

`include "../../hdl/axilite_to_apb_define.svh"

module tb_apb_to_axi_lite;

logic        sys_aresetn = 0;
logic        axi_clk = 1;
logic        apb_clk = 1;

integer i, j, k;

always #7  apb_clk = ~apb_clk;
always #10 axi_clk = ~axi_clk;

logic [63:0] apb_write_data_mem   [0:63];
logic [63:0] apb_write_addr_mem   [0:63];
logic [63:0] apb_read_data_mem    [0:63];

// ifc
apb_ifc      #(.AW_APB(`AW_APB), .DW_APB(`DW_APB)) m_apb();
axi_lite_ifc #(.AW_AXI(`AW_AXI), .DW_AXI(`DW_AXI)) axi_my_converter2blk_mem();

// dut
apb_to_axi_lite                 dut
(
    .axi_clk                    ( axi_clk                   ),
    .apb_clk                    ( apb_clk                   ),
    .sys_aresetn                ( sys_aresetn               ),
    .s_apb                      ( m_apb                     ), 
    .m_axi_lite                 ( axi_my_converter2blk_mem  )
);

// block memory gen ip
blk_mem_gen_ip_wrapper          blk_mem_gen_ip_wrapper_inst
(
    .clk                        ( axi_clk                   ),
    .aresetn                    ( sys_aresetn               ),
    .s_axi_lite                 ( axi_my_converter2blk_mem  ),
    .rsta_busy                  (  ),
    .rstb_busy                  (  )
);

// read files
initial
begin
    $readmemh("axi_traffic_gen_ip_addr.mem", apb_write_addr_mem);    
    $readmemh("axi_traffic_gen_ip_data.mem", apb_write_data_mem);    
end

// initialize apb signals
initial
begin
    m_apb.paddr = 0;
    m_apb.pwdata = 0;
    m_apb.psel = 0;
    m_apb.penable = 0;
    m_apb.pwrite = 0;
    m_apb.pprot = 0;
    m_apb.pstrb = 8'haf;
end

initial
begin
    #1000 sys_aresetn = 1;
    // write data to blk mem through apb_to_axi_lite
    for (i = 0; i < 16; i = i + 1)
    begin
        @(posedge apb_clk);
        m_apb.psel = 1;
        @(posedge apb_clk);
        m_apb.pwrite = 1;
        m_apb.pwdata = apb_write_data_mem[i];
        m_apb.paddr  = apb_write_addr_mem[i];
        m_apb.penable = 1;
        @(posedge m_apb.pready);
        @(posedge apb_clk);
        m_apb.penable = 0;
    end
    m_apb.psel = 0;
    #100;
    // read data from blk mem through apb_to_axi_lite
    for (i = 0; i < 16; i = i + 1)
    begin
        @(posedge apb_clk);
        m_apb.psel = 1;
        m_apb.pwrite = 0;
        @(posedge apb_clk);
        m_apb.paddr  = apb_write_addr_mem[i];
        m_apb.penable = 1;
        @(posedge m_apb.pready);
        @(posedge apb_clk);
        m_apb.penable = 0;
    end
    #1000;
    $stop;
end

// APB read
always_ff @(posedge apb_clk) begin
    if (~sys_aresetn) begin
        for (j = 0; j < 64; j = j + 1) begin
            apb_read_data_mem[j] = 0;
        end
        k <= 0;
    end else begin
        if (m_apb.psel & m_apb.penable & m_apb.pready) begin
            apb_read_data_mem[k] <= m_apb.prdata;
            k <= k + 1;
        end
    end
end

endmodule  //module_name
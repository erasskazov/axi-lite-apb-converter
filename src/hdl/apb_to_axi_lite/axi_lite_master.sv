module axi_lite_master #(
    parameter AW_AXI = 32,
    parameter DW_AXI = 32    
)
(
    input  logic                            axi_clk             ,
    input  logic                            sys_aresetn         ,

    axi_lite_ifc.master                     m_axi_lite          ,

    input  logic                            start_write         ,
    input  logic                            start_read          ,
    input  logic    [AW_AXI-1 : 0]          address             ,
    input  logic    [DW_AXI-1 : 0]          write_data          ,      
    input  logic    [2 : 0]                 prot                ,
    input  logic    [(DW_AXI/8)-1 : 0]      be                  ,

    output logic    [1 : 0]                 resp                ,
    output logic    [DW_AXI-1 : 0]          read_data           ,
    output logic                            read_data_valid     ,
    output logic                            done_write            
);


logic                       axi_awvalid;
logic [2 : 0]               axi_awprot;
logic [(DW_AXI/8)-1 : 0]    axi_wstrb;
logic                       axi_wvalid;
logic [2 : 0]               axi_arprot;
logic                       axi_arvalid;
logic                       axi_rready;
logic                       axi_bready;

logic [AW_AXI-1 : 0]        axi_awaddr;
logic [DW_AXI-1 : 0]        axi_wdata;
logic [AW_AXI-1 : 0]        axi_araddr;

assign      m_axi_lite.awvalid   = axi_awvalid;
assign      m_axi_lite.wvalid    = axi_wvalid;
assign      m_axi_lite.awprot    = axi_awprot;
assign      m_axi_lite.wstrb     = axi_wstrb;
assign      m_axi_lite.arprot    = axi_arprot;
assign      m_axi_lite.arvalid   = axi_arvalid;
assign      m_axi_lite.rready    = axi_rready;
assign      m_axi_lite.bready    = axi_bready;
assign      m_axi_lite.awaddr    = axi_awaddr;
assign      m_axi_lite.wdata     = axi_wdata;
assign      m_axi_lite.araddr    = axi_araddr;

// write address channel
always_ff @(posedge axi_clk)
begin
    if (~sys_aresetn) begin
        axi_awvalid <= '0;
        axi_awaddr  <= '0;
        axi_awprot  <= '0;
    end else begin
        if (start_write) begin
            axi_awvalid <= '1;
            axi_awaddr  <= address;
            axi_awprot  <= prot;
        end else if (m_axi_lite.awready && axi_awvalid) begin
            axi_awvalid <= '0;
        end
    end
end

// write data channel
always_ff @(posedge axi_clk) begin
    if (~sys_aresetn) begin
        axi_wvalid <= '0;
        axi_wdata  <= '0;
        axi_wstrb  <= '0;
    end else begin
        if (start_write) begin
            axi_wvalid  <= '1;
            axi_wstrb   <= be;
            axi_wdata   <= write_data;
        end else if (m_axi_lite.wready && axi_wvalid) begin
            axi_wvalid <= '0;
        end
    end
end


// write response channel
always_ff @(posedge axi_clk)
begin
    if (~sys_aresetn) begin
        axi_bready <= '0;
        done_write <= '0;
    end else begin
        if (m_axi_lite.bvalid && ~axi_bready) begin
            done_write <= '0;
            axi_bready <= '1;
        end else if (m_axi_lite.bvalid && axi_bready) begin
            done_write <= '1; 
            axi_bready <= '0;
        end else begin
            done_write <= '0; 
            axi_bready <= axi_bready;
        end
    end
end

// read address channel
always_ff @(posedge axi_clk)
begin
    if (~sys_aresetn) begin
        axi_arvalid <= '0;
        axi_araddr  <= '0;
        axi_arprot  <= '0;
    end else begin
        if (start_read) begin
            axi_arvalid <= '1;
            axi_arprot  <= prot;
            axi_araddr  <= address;
        end else if (m_axi_lite.arready && axi_arvalid) begin
            axi_arvalid <= '0;
        end
    end
end

// read data cahannel
always_ff @(posedge axi_clk)
begin
    if (~sys_aresetn) begin
        axi_rready      <= '0;
        read_data       <= '0;
        read_data_valid <= '0;
    end else begin
        if (m_axi_lite.rvalid && ~axi_rready) begin
            axi_rready <= '1;
            read_data_valid <= '0;
        end else if (m_axi_lite.rvalid && axi_rready) begin
            axi_rready <= '0;
            read_data_valid <= '1;
            read_data       <= m_axi_lite.rdata;
        end else begin
            read_data_valid <= '0;
        end
    end
end

// read and write response
always_ff @(posedge axi_clk)
begin
    if (~sys_aresetn) begin
        resp <= '0;
    end else begin
        if (m_axi_lite.rvalid && axi_rready) begin
            resp <= m_axi_lite.bresp;
        end else if (m_axi_lite.bvalid && axi_bready) begin
            resp <= m_axi_lite.rresp;
        end
    end
end


endmodule
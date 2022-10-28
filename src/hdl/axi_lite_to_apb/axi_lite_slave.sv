module axi_lite_slave #(
    parameter AW_AXI = 32,
    parameter DW_AXI = 32
)
(
    input  logic                            axi_clk                 ,
    input  logic                            sys_aresetn             ,

    axi_lite_ifc.slave                      s_axi_lite              ,

// ------- to apb converter
    output logic                            start_write             ,
    output logic                            start_read              ,
    output logic    [AW_AXI-1 : 0]          write_address           ,
    output logic    [AW_AXI-1 : 0]          read_address            ,
    output logic    [DW_AXI-1 : 0]          write_data              ,
    output logic    [(DW_AXI/8)-1 : 0]      be                      ,
    output logic    [2 : 0]                 wprot                   ,
    input  logic    [DW_AXI-1 : 0]          read_data               ,
    input  logic                            read_data_valid         ,
    output logic    [2 : 0]                 rprot                   ,
    input  logic                            done_write              ,
    input  logic                            slv_err
// -------
);

// AXI4LITE signals

logic                       axi_awready;
logic                       axi_wready;
logic [1 : 0]               axi_bresp;
logic                       axi_bvalid;
logic [AW_AXI-1 : 0]        axi_araddr;
logic                       axi_arready;
logic [DW_AXI-1 : 0]        axi_rdata;
logic [1 : 0]               axi_rresp;
logic                       axi_rvalid;

logic                       aw_en;

logic                       slv_wren;
logic                       slv_rden;

logic                       read_data_valid_reg;
logic [DW_AXI-1 : 0]        read_data_reg;   

logic                       read_data_accepted;

// I/O Connections assignments
assign s_axi_lite.awready   = axi_awready;
assign s_axi_lite.wready    = axi_wready;
assign s_axi_lite.bresp     = axi_bresp;
assign s_axi_lite.bvalid    = axi_bvalid;
assign s_axi_lite.arready   = axi_arready;
assign s_axi_lite.rdata     = axi_rdata;
assign s_axi_lite.rresp     = axi_rresp;
assign s_axi_lite.rvalid    = axi_rvalid;

assign slv_wren = axi_wready && s_axi_lite.wvalid && axi_awready && s_axi_lite.awvalid;
assign slv_rden = axi_arready && s_axi_lite.arvalid && ~axi_rvalid;

assign read_data_accepted = axi_rvalid && s_axi_lite.rready;

// latching read_data from apb
always_ff @(posedge axi_clk)
begin
    if (~sys_aresetn) begin
        read_data_valid_reg <= '0;
        read_data_reg <= '0;
    end else begin
        if (read_data_valid) begin
            read_data_valid_reg <= '1;
            read_data_reg <= read_data;
        end else if (read_data_accepted) begin
            read_data_valid_reg <= '0;
        end
    end
end

// latching write address and data
always_ff @(posedge axi_clk)
begin
    if (~sys_aresetn) begin
        start_write     <= '0;
        write_address   <= '0;
        write_data      <= '0;
        wprot           <= '0;
        be              <= '0;
    end else begin
        if (slv_wren) begin
            start_write     <= '1;
            be              <= s_axi_lite.wstrb;
            wprot           <= s_axi_lite.awprot;
            write_address   <= s_axi_lite.awaddr;
            write_data      <= s_axi_lite.wdata;
        end else begin
            start_write <= '0;
        end
    end
end

// latching read data
always_ff @(posedge axi_clk)
begin
    if (~sys_aresetn) begin
        start_read      <= '0;
        read_address    <= '0;
        rprot           <= '0;
    end else begin
        if (slv_rden) begin
            start_read      <= '1;
            read_address    <= s_axi_lite.araddr;
            rprot           <= s_axi_lite.arprot;
        end else begin
            start_read      <= '0;
        end
    end
end

// axi_awready
always_ff @(posedge axi_clk)
begin
    if (~sys_aresetn) begin
        axi_awready <= '0;
        aw_en <= '1;
    end else begin
        if (~axi_awready && s_axi_lite.awvalid && s_axi_lite.wvalid && aw_en) begin
            axi_awready <= '1;
            aw_en <= '0;
        end else if (s_axi_lite.bready && axi_bvalid) begin
            aw_en <= '1;
            axi_awready <= '0;
        end else begin
            axi_awready <= '0;
        end
    end
end

// axi_wready generation
always_ff @(posedge axi_clk)
begin
    if (~sys_aresetn) begin
        axi_wready <= '0;
    end else begin
        if (~axi_wready && s_axi_lite.wvalid && s_axi_lite.awvalid && aw_en) begin
            axi_wready <= '1;
        end else begin
            axi_wready <= '0;
        end
    end
end

// write response
always_ff @(posedge axi_clk)
begin
    if (~sys_aresetn) begin
        axi_bvalid <= '0;
        axi_bresp <= '0;
    end else begin
        if (~axi_bresp && done_write) begin
            axi_bvalid <= '1;
            axi_bresp  <= {slv_err, 1'b0};
        end else begin
            if (s_axi_lite.bready && axi_bvalid) begin
                axi_bvalid <= '0;
            end
        end
    end
end

// axi_arready
always_ff @(posedge axi_clk)
begin
    if (~sys_aresetn) begin
        axi_arready <= '0;
        axi_araddr <= '0;
    end else begin
        if (~axi_arready && s_axi_lite.arvalid) begin
            axi_arready <= '1;
            axi_araddr <= s_axi_lite.araddr;
        end else begin
            axi_arready <= '0;
        end
    end
end

// axi_arvalid
always_ff @(posedge axi_clk)
begin
    if (~sys_aresetn) begin
        axi_rvalid <= '0;
        axi_rresp <= '0;
        axi_rdata <= '0;
    end else begin
        if (read_data_valid_reg && ~axi_rvalid) begin
            axi_rvalid <= '1;
            axi_rresp <= {slv_err, 1'b0};
            axi_rdata <= read_data_reg;
        end else if (axi_rvalid && s_axi_lite.rready) begin
            axi_rvalid <= '0;
        end
    end
end


endmodule
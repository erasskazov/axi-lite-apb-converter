module axi_lite_ctrl #(
    parameter AW_AXI = 32,
    parameter DW_AXI = 32,
    parameter AW_APB = 32,
    parameter DW_APB = 32
)
(
    input  logic                            axi_clk             ,
    input  logic                            sys_aresetn         ,

    axi_lite_ifc.master                     m_axi_lite          ,

    input  logic                            start_write         ,
    input  logic                            start_read          ,
    input  logic    [AW_APB-1 : 0]          address             ,
    input  logic    [DW_APB-1 : 0]          write_data          ,      
    input  logic    [2 : 0]                 prot                ,
    input  logic    [(DW_APB/8)-1 : 0]      be                  ,

    output logic    [1 : 0]                 resp                ,
    output logic    [DW_APB-1 : 0]          read_data           ,
    output logic                            read_data_valid     ,
    output logic                            done_write              
);

localparam      MULTIPLE_TRANSACTIONS   = DW_APB > DW_AXI;
localparam      EXPAND                  = DW_APB < DW_AXI;
localparam      EXPAND_ADDRESS          = AW_APB < AW_AXI;
localparam      AXI_WORD_COUNT          = DW_APB / DW_AXI;  
localparam      ADDRESS_OFFSET          = DW_AXI / 8;
localparam      ADDRESS_BIT_OFFSET      = DW_APB;

localparam      WSTRB_AXI               = DW_AXI / 8;
localparam      WSTRB_APB               = DW_APB / 8;

localparam      DIF_WSTRB_AXI_APB       = EXPAND         ? (WSTRB_AXI - WSTRB_APB) : 0;
localparam      DIF_DW_AXI_APB          = EXPAND         ? (DW_AXI - DW_APB) : 0;
localparam      DIF_AW_AXI_APB          = EXPAND_ADDRESS ? (AW_AXI - AW_APB) : 0;


logic                               start_read_axi;
logic                               start_write_axi;

logic   [AW_AXI - 1 : 0]            address_axi;
logic   [DW_AXI - 1 : 0]            write_data_axi;

logic   [(DW_AXI/8)-1 : 0]          be_axi;
logic   [2 : 0]                     prot_axi;

logic    [DW_AXI-1 : 0]             read_data_axi;
logic                               read_data_valid_axi;
logic                               done_write_axi;

logic   [1 : 0]                     resp_axi;

logic                               start_read_reg;
logic                               start_write_reg;

logic   [AW_APB-1 : 0]              address_reg;

logic   [DW_APB-1 : 0]              write_data_reg;
logic   [DW_APB-1 : 0]              write_data_sh_reg;

logic   [(DW_APB/8)-1 : 0]          be_reg;
logic   [(DW_APB/8)-1 : 0]          be_sh_reg;
logic   [2 : 0]                     prot_reg;

logic   [7:0]                       read_word_count;
logic   [7:0]                       write_word_count;

logic   [AW_APB-1 : 0]              next_address;
logic                               start;

assign start = (start_read_reg | start_write_reg) & ~read_data_valid & ~done_write;


// write address, data regs
always_ff @(posedge axi_clk)
begin
    if (~sys_aresetn) begin
        start_write_reg     <= '0;
        write_data_reg      <= '0;
        be_reg              <= '0;
    end else begin
        if (start_write) begin
            start_write_reg     <= '1;
            be_reg              <= be;
            write_data_reg      <= write_data;
        end else begin
            start_write_reg <= '0;
        end
    end
end

// read address reg
always_ff @(posedge axi_clk)
begin
    if (~sys_aresetn) begin
        start_read_reg      <= '0;
    end else begin
        if (start_read) begin
            start_read_reg      <= '1;
        end else begin
            start_read_reg      <= '0;
        end
    end
end


// signals axi -> axi
// always_ff @(posedge axi_clk)
// begin
//     if (~sys_aresetn) begin
//         read_data           <= '0;
//         read_data_valid     <= '0;
//         done_write          <= '0;
//     end else begin 
//         if (read_data_valid) begin
//             resp                <= resp_axi;
//             read_data_valid     <= '1;
//             read_data           <= read_data_axi;
//         end else if (done_write) begin
//             resp                <= resp_axi;
//             done_write          <= '1;
//         end else begin
//             done_write          <= '0;
//             read_data_valid     <= '0;
//         end
//     end
// end

// addr and prot regs
always_ff @(posedge axi_clk)
begin
    if (~sys_aresetn) begin
        prot_reg    <= '0;
        address_reg <= '0;
    end else begin
        if (start_read | start_write) begin
            prot_reg    <= prot;
            address_reg <= address;
        end
    end
end


typedef enum logic[2:0] { 
    IDLE,
    SETUP_READ,
    START_READ,
    WAIT_READ,
    SETUP_WRITE,
    START_WRITE,
    WAIT_WRITE
} state_t;

state_t     state;


always_ff @(posedge axi_clk)
begin
    if (~sys_aresetn) begin
        resp                <= '0;
        done_write          <= '0;
        read_data           <= '0;
        read_data_valid     <= '0;
        read_word_count     <= '0;
        write_word_count    <= '0;
        next_address        <= '0;
        prot_axi            <= '0;
        address_axi         <= '0;
        start_read_axi      <= '0;
        start_write_axi     <= '0;
        be_sh_reg           <= '0;
        be_axi              <= '0;
        write_data_axi      <= '0;
        write_data_sh_reg   <= '0;
        state <= IDLE;
    end else begin
        case (state)
            IDLE: begin
                resp            <= '0;
                done_write      <= '0;
                read_data_valid <= '0;
                if (start) begin
                    if (start_read_reg) begin
                        state <= SETUP_READ;
                    end else if (start_write_reg) begin
                        state <= SETUP_WRITE;
                    end
                end
            end

            SETUP_READ: begin
                next_address    <= {{DIF_AW_AXI_APB{1'b0}}, address}[AW_AXI-1:0];
                prot_axi        <= prot_reg;
                state           <= START_READ;
            end

            START_READ: begin
                address_axi <= next_address;
                start_read_axi <= '1;
                state <= WAIT_READ;
            end

            WAIT_READ: begin
                start_read_axi <= '0;
                if (read_data_valid_axi) begin
                    if (|resp_axi) begin
                        resp            <= resp;
                        read_data_valid <= '1;
                        state           <= IDLE;
                    end else begin
                        if (~MULTIPLE_TRANSACTIONS) begin
                            read_data       <= {{DIF_DW_AXI_APB{1'b0}}, read_data_axi}[DW_APB-1:0];
                            read_data_valid <= '1;
                            state           <= IDLE;
                        end else begin
                            read_data = {read_data_axi, read_data[DW_APB-1:DW_APB-DW_AXI]};
                            if (read_word_count < (AXI_WORD_COUNT-1)) begin
                                read_word_count <= read_word_count + 1'b1;
                                next_address    <= address_axi + ADDRESS_OFFSET;
                                state           <= START_READ;
                            end else begin
                                read_word_count <= '0;
                                read_data_valid <= '1;
                                state           <= IDLE;
                            end
                        end
                    end
                end else begin
                    state <= WAIT_READ;
                end
            end

            SETUP_WRITE: begin
                next_address        <= {{DIF_AW_AXI_APB{1'b0}}, address}[AW_AXI-1:0];
                write_data_sh_reg   <= write_data;
                be_sh_reg           <= be_reg;
                prot_axi            <= prot_reg;
                state               <= START_WRITE;
            end

            START_WRITE: begin
                address_axi         <= next_address;
                write_data_axi      <= {{DIF_DW_AXI_APB{1'b0}}, write_data_sh_reg}[DW_AXI-1:0];
                be_axi              <= {{DIF_WSTRB_AXI_APB{1'b0}}, be_sh_reg}[WSTRB_AXI-1:0];
                start_write_axi     <= '1;
                state               <= WAIT_WRITE;
            end

            WAIT_WRITE: begin
                start_write_axi <= '0;
                if (done_write_axi) begin
                    if (|resp_axi) begin
                        resp        <= resp_axi;
                        done_write  <= '1;
                        state       <= IDLE;
                    end else begin
                        if (~MULTIPLE_TRANSACTIONS) begin
                            done_write  <= '1;
                            state <= IDLE;
                        end else begin
                            if (write_word_count < (AXI_WORD_COUNT-1)) begin
                                write_word_count    <= write_word_count + 1'b1;
                                write_data_sh_reg   <= {{DIF_DW_AXI_APB{1'b0}}, write_data_sh_reg[DW_APB-1:DW_APB-DW_AXI]};
                                be_sh_reg           <= {{DIF_WSTRB_AXI_APB{1'b0}}, be_sh_reg[WSTRB_APB-1:WSTRB_APB-WSTRB_AXI]};
                                next_address        <= address_axi + ADDRESS_OFFSET;
                                state               <= START_WRITE;
                            end else begin
                                write_word_count    <= '0;
                                done_write          <= '1;
                                state               <= IDLE;
                            end
                        end
                    end
                end else begin
                    state <= WAIT_WRITE;
                end
            end

        endcase
    end
end


axi_lite_master #(
    .AW_AXI                     ( AW_AXI ),
    .DW_AXI                     ( DW_AXI )
) axi_lite_master_inst (
    .axi_clk                    ( axi_clk               ), // i
    .sys_aresetn                ( sys_aresetn           ), // i
    .m_axi_lite                 ( m_axi_lite            ), // 
    .start_write                ( start_write_axi       ), // i
    .start_read                 ( start_read_axi        ), // i
    .address                    ( address_axi           ), // i
    .write_data                 ( write_data_axi        ), // i
    .prot                       ( prot_axi              ), // i
    .be                         ( be_axi                ), // i
    .resp                       ( resp_axi              ), // o
    .read_data                  ( read_data_axi         ), // o
    .read_data_valid            ( read_data_valid_axi   ), // o
    .done_write                 ( done_write_axi        )  // o
);
      


endmodule
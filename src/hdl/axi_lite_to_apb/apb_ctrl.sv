module apb_ctrl #(
    parameter AW_AXI = 32,
    parameter DW_AXI = 32,
    parameter AW_APB = 32,
    parameter DW_APB = 32
)
(
    input  logic                            apb_clk             ,
    input  logic                            sys_aresetn         ,

    apb_ifc.master                          m_apb               ,

    input  logic                            start_read          ,
    input  logic                            start_write         ,
    input  logic    [AW_AXI-1 : 0]          write_address       ,
    input  logic    [AW_AXI-1 : 0]          read_address        ,  
    input  logic    [DW_AXI-1 : 0]          write_data          ,

    input  logic    [(DW_AXI/8)-1 : 0]      be                  ,
    input  logic    [2 : 0]                 wprot               ,
    input  logic    [2 : 0]                 rprot               ,

    output logic                            slv_err             ,
    output logic    [DW_AXI-1 : 0]          read_data           ,
    output logic                            read_data_valid     ,
    output logic                            done_write          
);

localparam      MULTIPLE_TRANSACTIONS   = DW_AXI > DW_APB;
localparam      EXPAND                  = DW_AXI < DW_APB;
localparam      EXPAND_ADDRESS          = AW_AXI < AW_APB;
localparam      APB_WORD_COUNT          = DW_AXI / DW_APB;  
localparam      ADDRESS_OFFSET          = DW_APB / 8;
localparam      ADDRESS_BIT_OFFSET      = DW_AXI;

localparam      WSTRB_AXI               = DW_AXI / 8;
localparam      WSTRB_APB               = DW_APB / 8;

localparam      DIF_WSTRB_AXI_APB       = EXPAND         ? (WSTRB_APB - WSTRB_AXI) : 0;
localparam      DIF_DW_AXI_APB          = EXPAND         ? (DW_APB - DW_AXI) : 0;
localparam      DIF_AW_AXI_APB          = EXPAND_ADDRESS ? (AW_APB - AW_AXI) : 0;

logic                               start_read_apb;
logic                               start_write_apb;

logic   [AW_APB-1 : 0]              write_address_apb;
logic   [DW_APB-1 : 0]              write_data_apb;

logic   [AW_APB-1 : 0]              read_address_apb;

logic   [(DW_APB/8)-1 : 0]          be_apb;
logic   [2 : 0]                     wprot_apb;
logic   [2 : 0]                     rprot_apb;

logic                               slv_err_apb;

logic    [DW_APB-1 : 0]             read_data_apb;
logic                               read_data_valid_apb;
logic                               done_write_apb;


logic                               start_read_reg;
logic                               start_write_reg;

logic   [AW_AXI-1 : 0]              write_address_reg;
logic   [AW_AXI-1 : 0]              read_address_reg;

logic   [DW_AXI-1 : 0]              write_data_reg;
logic   [DW_AXI-1 : 0]              write_data_sh_reg;

logic   [(DW_AXI/8)-1 : 0]          be_reg;
logic   [(DW_AXI/8)-1 : 0]          be_sh_reg;
logic   [2 : 0]                     wprot_reg;
logic   [2 : 0]                     rprot_reg;

logic   [7:0]                       read_word_count;
logic   [7:0]                       write_word_count;

logic   [AW_APB-1 : 0]              next_address;
logic                               start;

assign start = (start_read_reg | start_write_reg) & ~read_data_valid & ~done_write;

// regs for write address, data
always_ff @(posedge apb_clk)
begin
    if (sys_aresetn == 1'b0) begin
        start_write_reg     <= '0;
        write_address_reg   <= '0;
        write_data_reg      <= '0;
        be_reg              <= '0;
        wprot_reg           <= '0;  
    end else begin
        if (start_write) begin
            start_write_reg     <= '1;
            be_reg              <= be;
            wprot_reg           <= wprot;
            write_address_reg   <= write_address;
            write_data_reg      <= write_data;
        end else if (done_write) begin
            start_write_reg <= '0;
        end
    end
end

// regs for read address
always_ff @(posedge apb_clk)
begin
    if (sys_aresetn == 1'b0) begin
        start_read_reg      <= '0;
        read_address_reg    <= '0;
        rprot_reg           <= '0;
    end else begin
        if (start_read) begin
            start_read_reg      <= '1;
            rprot_reg           <= rprot;
            read_address_reg    <= read_address;
        end else if (read_data_valid) begin
            start_read_reg      <= '0;
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

always_ff @(posedge apb_clk)
begin
    if (~sys_aresetn) begin
        start_read_apb    <= '0;
        start_write_apb   <= '0;
        next_address      <= '0;
        read_address_apb  <= '0;
        read_word_count   <= '0;
        write_word_count  <= '0;
        write_address_apb <= '0;
        rprot_apb         <= '0;
        wprot_apb         <= '0;
        be_apb            <= '0;
        be_sh_reg         <= '0;
        done_write        <= '0;
        write_data_apb    <= '0;
        write_data_sh_reg <= '0;
        read_data_valid   <= '0;
        read_data         <= '0;
        slv_err           <= '0;
        state             <= IDLE;
    end else begin
        case (state)

            IDLE: begin
                slv_err         <= '0;
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
                next_address    <= {{DIF_AW_AXI_APB{1'b0}}, read_address_reg}[AW_APB-1:0];
                rprot_apb       <= rprot_reg;
                state           <= START_READ;
            end

            START_READ: begin
                read_address_apb <= next_address;
                start_read_apb <= '1;
                state <= WAIT_READ;
            end

            WAIT_READ: begin
                start_read_apb <= '0;
                if (read_data_valid_apb) begin
                    if (slv_err_apb) begin
                        slv_err         <= slv_err_apb;
                        read_data_valid <= '1;
                        state           <= IDLE;
                    end else begin
                        if (~MULTIPLE_TRANSACTIONS) begin
                            read_data       <= {{DIF_DW_AXI_APB{1'b0}}, read_data_apb}[DW_AXI-1:0];
                            read_data_valid <= '1;
                            state           <= IDLE;
                        end else begin
                            read_data = {read_data_apb, read_data[DW_AXI-1:DW_AXI-DW_APB]};
                            if (read_word_count < (APB_WORD_COUNT-1)) begin
                                read_word_count <= read_word_count + 1'b1;
                                next_address    <= read_address_apb + ADDRESS_OFFSET;
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
                next_address        <= {{DIF_AW_AXI_APB{1'b0}}, write_address_reg}[AW_APB-1:0];
                write_data_sh_reg   <= write_data;
                be_sh_reg           <= be_reg;
                wprot_apb           <= wprot_reg;
                state               <= START_WRITE;
            end

            START_WRITE: begin
                write_address_apb   <= next_address;
                write_data_apb      <= {{DIF_DW_AXI_APB{1'b0}}, write_data_sh_reg}[DW_APB-1:0];
                be_apb              <= {{DIF_WSTRB_AXI_APB{1'b0}}, be_sh_reg}[WSTRB_APB-1:0];
                start_write_apb     <= '1;
                state               <= WAIT_WRITE;
            end

            WAIT_WRITE: begin
                start_write_apb <= '0;
                if (done_write_apb) begin
                    if (slv_err_apb) begin
                        slv_err     <= slv_err_apb;
                        done_write  <= '1;
                        state       <= IDLE;
                    end else begin
                        if (~MULTIPLE_TRANSACTIONS) begin
                            done_write  <= '1;
                            state <= IDLE;
                        end else begin
                            if (write_word_count < (APB_WORD_COUNT-1)) begin
                                write_word_count    <= write_word_count + 1'b1;
                                write_data_sh_reg   <= {{DIF_DW_AXI_APB{1'b0}}, write_data_sh_reg[DW_AXI-1:DW_AXI-DW_APB]};
                                next_address        <= write_address_apb + ADDRESS_OFFSET;
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


// apb master
apb_master #(
    .AW_APB                     ( AW_APB ),
    .DW_APB                     ( DW_APB )
) apb_master_inst (
    .apb_clk                    ( apb_clk                   ), // i
    .sys_aresetn                ( sys_aresetn               ), // i
    .m_apb                      ( m_apb                     ),
    .start_read                 ( start_read_apb            ), // i
    .start_write                ( start_write_apb           ), // i
    .write_address              ( write_address_apb         ), // i
    .read_address               ( read_address_apb          ), // i
    .write_data                 ( write_data_apb            ), // i
    .be                         ( be_apb                    ), // i
    .wprot                      ( wprot_apb                 ), // i
    .read_data                  ( read_data_apb             ), // o
    .read_data_valid            ( read_data_valid_apb       ), // o
    .rprot                      ( rprot_apb                 ), // i
    .done_write                 ( done_write_apb            ), // o
    .slv_err                    ( slv_err_apb               )
);

endmodule
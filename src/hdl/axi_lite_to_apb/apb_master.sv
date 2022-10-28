module apb_master #(
    parameter AW_APB = 32,
    parameter DW_APB = 32
)
(
    input  logic                            apb_clk         ,
    input  logic                            sys_aresetn     ,

    apb_ifc.master                          m_apb           ,

    input  logic                            start_read      ,
    input  logic                            start_write     ,
    input  logic    [AW_APB-1 : 0]          write_address   ,
    input  logic    [AW_APB-1 : 0]          read_address    ,  
    input  logic    [DW_APB-1 : 0]          write_data      ,
    input  logic    [(DW_APB/8)-1 : 0]      be              ,   //byte enable
    input  logic    [2 : 0]                 wprot           ,
    output logic    [DW_APB-1 : 0]          read_data       ,
    output logic                            read_data_valid ,
    input  logic    [2 : 0]                 rprot           ,        
    output logic                            done_write      ,
    output logic                            slv_err
);

logic    [AW_APB-1:0]           apb_paddr   ;
logic                           apb_psel    ;
logic                           apb_penable ;
logic                           apb_pwrite  ;
logic    [DW_APB-1:0]           apb_pwdata  ;
logic    [2       :0]           apb_pprot   ;
logic    [(DW_APB/8)-1 : 0]     apb_pstrb   ;

logic start;
logic sh_start_read;
logic sh_start_write;

assign start = (start_read | start_write) & ~done_write & ~read_data_valid;

assign m_apb.paddr      = apb_paddr;
assign m_apb.psel       = apb_psel;
assign m_apb.penable    = apb_penable;
assign m_apb.pwrite     = apb_pwrite;
assign m_apb.pwdata     = apb_pwdata;
assign m_apb.pprot      = apb_pprot;
assign m_apb.pstrb      = apb_pstrb;

assign slv_err          = m_apb.pslverr;

assign read_data_valid  = apb_psel && apb_penable && m_apb.pready && ~apb_pwrite;
assign read_data        = m_apb.prdata;

assign done_write       = apb_psel && apb_penable && m_apb.pready && apb_pwrite;

always_ff @(posedge apb_clk)
begin
    if (~sys_aresetn) begin
        sh_start_read   <= '0;
        sh_start_write  <= '0;
    end else begin
        sh_start_read   <= start_read;
        sh_start_write  <= start_write;
    end
end

// FSM states of apb master
typedef enum logic [2:0] {
    IDLE        ,
    SETUP       ,
    ACCESS      
} state_t;

state_t     state;

// APB Master FSM
always_ff @(posedge apb_clk) 
begin
    if (~sys_aresetn) begin
        apb_paddr   <= '0;
        apb_psel    <= '0;
        apb_penable <= '0;
        apb_pwdata  <= '0;
        apb_pprot   <= '0;
        apb_pstrb   <= '0;
        apb_pwrite  <= '0;
        state  <= IDLE;
    end else begin
        case (state)
            IDLE: begin
                if (start) begin
                    state <= SETUP;
                end else begin
                    state <= IDLE;
                end
            end

            SETUP: begin
                apb_psel    <= '1;
                if (sh_start_read) begin
                    apb_paddr  <= read_address;
                    apb_pprot  <= rprot;
                    apb_pwrite <= '0;
                end else if (sh_start_write) begin
                    apb_paddr  <= write_address;
                    apb_pwdata <= write_data;
                    apb_pprot  <= wprot;
                    apb_pstrb  <= be;
                    apb_pwrite <= '1;            
                end
                state <= ACCESS;
            end

            ACCESS: begin
                if (apb_penable && m_apb.pready) begin
                    apb_penable <= '0;
                    apb_psel    <= '0;
                    state  <= IDLE;
                end else begin
                    apb_penable <= '1;
                    state <= ACCESS;
                end
            end

            default: state <= IDLE;
        endcase 
    end
end

endmodule
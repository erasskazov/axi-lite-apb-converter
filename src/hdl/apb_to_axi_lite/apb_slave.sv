module apb_slave #(
    parameter AW_APB = 32,
    parameter DW_APB = 32
)
(
    input  logic                            apb_clk             ,
    input  logic                            sys_aresetn         ,

    apb_ifc.slave                           s_apb               ,

    output logic                            start_write         ,
    output logic                            start_read          ,

    output logic    [AW_APB-1 : 0]          address             ,
    output logic    [DW_APB-1 : 0]          write_data          ,
    output logic    [(DW_APB/8)-1 : 0]      be                  ,
    output logic    [2 : 0]                 prot                ,
    input  logic    [DW_APB-1 : 0]          read_data           ,
    input  logic                            read_data_valid     ,
    input  logic    [1 : 0]                 resp                ,
    input  logic                            done_write          


);

logic   [DW_APB-1:0]    apb_prdata;
logic                   apb_pready;
logic                   apb_pslverr;

logic                   done;

assign      s_apb.prdata    = apb_prdata;
assign      s_apb.pready    = apb_pready;
assign      s_apb.pslverr   = apb_pslverr;

assign      done      = read_data_valid | done_write;

// FSM states of apb slave
typedef enum logic [2:0] {
    IDLE        ,
    SETUP       ,
    ACCESS      
} state_t;

state_t     state;


always_ff @(posedge apb_clk)
begin
    if (~sys_aresetn) begin
        apb_pslverr <= '0;
        apb_prdata  <= '0;
        apb_pready  <= '0;
        prot        <= '0;
        be          <= '0;
        start_write <= '0;
        start_read  <= '0;
        write_data  <= '0;
        address     <= '0;
        state       <= IDLE;
    end else begin
        case (state)
            IDLE: begin
                apb_pready <= '0;
                if (s_apb.psel & ~apb_pready) begin
                    state <= SETUP;
                end else begin
                    state <= IDLE;
                end
            end

            SETUP: begin
                if (s_apb.penable) begin
                    address = s_apb.paddr;
                    prot = s_apb.pprot;
                    if (s_apb.pwrite) begin
                        start_write <= '1;
                        be          <= s_apb.pstrb;
                        write_data  <= s_apb.pwdata;
                    end else begin
                        start_read <= '1;
                    end
                    state <= ACCESS;
                end else begin
                    state <= SETUP;
                end
            end

            ACCESS: begin
                start_read  <= '0;
                start_write <= '0;
                if (s_apb.psel && s_apb.penable && done) begin
                    if (~s_apb.pwrite) begin
                        apb_prdata <= read_data;
                    end
                    apb_pslverr <= resp[1];
                    apb_pready <= '1;
                    state <= IDLE;
                end else begin
                    state <= ACCESS;
                end
            end

            default: state <= IDLE;
        endcase
    end
end


endmodule
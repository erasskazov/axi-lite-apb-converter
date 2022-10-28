module pulse_cdc
(
    input  logic                    src_clk         ,
    input  logic                    dst_clk         ,
    input  logic                    aresetn         ,

    input  logic                    src_impulse     ,
    output logic                    dst_impulse
);

logic           src_signal;
logic           dst_signal;

logic           sh_src_signal0, sh_src_signal1;

logic           sh_dst_signal;

// generation src_signal
always_ff @(posedge src_clk)
begin
    if (!aresetn) begin
        src_signal <= '0;
    end else if (src_impulse) begin
        src_signal <= ~src_signal;
    end
end

// synchronization src_signal at dst_clk
always_ff @(posedge dst_clk)
begin
    if (!aresetn) begin
        sh_src_signal0 <= '0;
        sh_src_signal1 <= '0;
        dst_signal <= '0;
    end else begin
        sh_src_signal0 <= src_signal;
        sh_src_signal1 <= sh_src_signal0;
        dst_signal <= sh_src_signal1;
    end
end

// shift synch_src_signal
always_ff @(posedge dst_clk)
begin
    if (!aresetn) begin
        sh_dst_signal <= '0;
    end else begin
        sh_dst_signal <= dst_signal;
    end
end

// synch_src_signal detection
assign dst_impulse = sh_dst_signal ^ dst_signal;


endmodule
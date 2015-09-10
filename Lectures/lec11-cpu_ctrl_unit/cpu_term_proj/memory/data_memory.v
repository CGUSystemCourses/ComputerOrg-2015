module data_memory 
#(parameter ADDRESS_WIDTH=8, DATA_WIDTH=8, MEMORY_SIZE=256)
(
    input                          clean,
    input                          clk,
    input                          mw,
    input   [DATA_WIDTH-1: 0]      mw_data,
    input   [ADDRESS_WIDTH-1: 0]   addr,
    output  [DATA_WIDTH-1: 0]      data
);

reg [DATA_WIDTH-1: 0] memory[0: MEMORY_SIZE-1];

initial begin
//    $readmemh("data.mem", memory, 0, MEMORY_SIZE);
    $readmemh("data.mem", memory);
end

assign data = memory[addr];

always @(posedge clk) begin
    if(clean == 1'b1) begin

    end
    else begin
        if(mw == 1'b1) begin
            memory[addr] <= mw_data; 
        end
    end
end

endmodule

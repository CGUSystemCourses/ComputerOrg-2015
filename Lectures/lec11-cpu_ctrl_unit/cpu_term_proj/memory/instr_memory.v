module instr_memory
#(parameter ADDRESS_WIDTH=8, DATA_WIDTH=16, MEMORY_SIZE=256)
(
    input   [ADDRESS_WIDTH-1: 0] add,
    output  [DATA_WIDTH-1: 0] instr 
);

reg [DATA_WIDTH-1: 0] memory[0: MEMORY_SIZE-1];
initial begin
    $readmemb("instr.mem", memory);
end

assign instr = memory[add];

endmodule

module cpu_with_memory
#(parameter I_ADDRESS=8, I_WIDTH=16,
            R_ADDRESS=3, R_WIDTH=8,
            M_ADDRESS=8, M_WIDTH=8)
(
    input                    clean,
    input                    clk
);

wire [I_WIDTH-1: 0] instr;
wire [I_ADDRESS-1: 0] pc;


wire [M_WIDTH-1: 0]    dm_datain;
wire                   dm_mw;
wire [M_ADDRESS-1: 0]  dm_address;
wire [M_WIDTH-1: 0]    dm_dataout;

cpu cpu8(
    .clean(clean),
    .clk(clk),
    .instr(instr),
    .dm_datain(dm_datain),
    .dm_mw(dm_mw),
    .dm_address(dm_address),
    .dm_dataout(dm_dataout),
    .pc(pc)
);

instr_memory id8_256(
    .add(pc),
    .instr(instr)
);

data_memory dm8_256(
    .clean(clean),
    .clk(clk),
    .addr(dm_address),
    .mw(dm_mw),
    .mw_data(dm_dataout),
    .data(dm_datain)
);

endmodule

module adder
#(parameter WIDTH=8)
(
    input               carry_in,
    input  [WIDTH-1: 0] a,
    input  [WIDTH-1: 0] b,
    output [WIDTH-1: 0] sum,
    output              carry_out
);

    assign {carry_out, sum} = a + b + carry_in;

endmodule

module mux_2
#(parameter WIDTH=8)
(
    input  [WIDTH-1: 0]  d_0,
    input  [WIDTH-1: 0]  d_1,
    input                d,
    output [WIDTH-1: 0]  dout
);

assign dout = (d==1'b1)? d_1: d_0;

endmodule

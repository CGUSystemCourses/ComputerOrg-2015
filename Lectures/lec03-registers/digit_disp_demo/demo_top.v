module demo_top (segdisp, en, reset, clk);

output	[7:0]	segdisp;
output	[3:0]	en;
input			reset;
input			clk;

seven_dis_4 u_senven_dis (
	.clean (reset),
	.clk (clk),
	.twinkle_select (4'b0000),
	.num1 (4'h1),
	.num2 (4'h2),
	.num3 (4'h3),
	.num4 (4'h4),
	.light_select (en),
	.light (segdisp)
);

endmodule



















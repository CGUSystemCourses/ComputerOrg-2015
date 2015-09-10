module abs_diff (A, B, R, start, reset, clk);

	input	[7:0]	A;
	input	[7:0]	B;
	output	[7:0]	R;
	input			start;
	input			reset;
	input			clk;

	wire			L, S;

	control_unit u_control (
		.start (start),
		.R7 (R[7]),
		.L (L),
		.S (S),
		.reset (reset),
		.clk (clk)
	);

	data_path u_data_path (
		.A (A),
		.B (B),
		.L (L),
		.S (S),
		.R (R),
		.reset (reset),
		.clk (clk)
	);
endmodule



















module class_demo(A, X, Y, R, G, B, reset, clk);
	input	A;
	input	X;
	input	Y;
	output	R;
	output	G;
	output	B;
	input	reset;
	input	clk;

	wire	A_pulse;

	button_buffer u_btn (
		.clean (reset),
		.clk (clk),
		.button (A),
		.signal (A_pulse)
	);

	seq_ckt u_seq_ckt (
		.A (A_pulse),
		.reset (reset),
		.B (B),
		.clk (clk)
	);

	comb_ckt u_comb_ckt (
		.X (X),
		.Y (Y),
		.R (R),
		.G (G)
	);
endmodule













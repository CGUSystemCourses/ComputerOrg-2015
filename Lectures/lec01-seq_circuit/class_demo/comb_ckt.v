module comb_ckt (X, Y, R, G);
	input	X;
	input	Y;
	output	R;
	output	G;

	assign R = X|Y;
	assign G = X&Y;
endmodule
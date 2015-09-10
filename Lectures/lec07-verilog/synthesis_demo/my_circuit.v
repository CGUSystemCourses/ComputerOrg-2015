module my_circuit (A, B, C, Q, clock);

	input	A;
	input	B;
	input	C;
	output	Q;
	input	clock;
	
	wire	D;
	
	assign	D = (A&B)|C;
	
	reg		Q;
	
	always @(posedge clock)
		Q <= D;

endmodule
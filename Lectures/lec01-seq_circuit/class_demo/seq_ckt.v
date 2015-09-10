module seq_ckt (A, reset, B, clk);
	input	A;
	input	reset;
	output	B;
	input	clk;

	reg		B;

	always @(posedge clk) begin
		if (reset)
			B <= 1'b0;
		else
			B <= B^A;
	end
endmodule
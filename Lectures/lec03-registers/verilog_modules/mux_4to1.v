module mux_4to1 (in3, in2, in1, in0, sel, out);
	input	[3:0]	in3;
	input	[3:0]	in2;
	input	[3:0]	in1;
	input	[3:0]	in0;
	input	[1:0]	sel;
	output	[3:0]	out;

	reg		[3:0]	out;

	always @(*) begin
		case (sel)
			2'b00:	out = in0;
			2'b01:	out = in1;
			2'b10:	out = in2;
			2'b11:	out = in3;
		endcase
	end
endmodule
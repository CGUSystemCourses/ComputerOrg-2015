/*******************************************************************************
 *
 * the data path to compute R=|A-B|
 *
 ******************************************************************************/

module data_path (A, B, L, S, R, reset, clk);
	input	[7:0]	A, B;
	input			L, S;
	output	[7:0]	R;
	input			reset;
	input			clk;

	wire	[7:0]	X = (S)? A: 7'h0;
	wire	[7:0]	Y = (S)? B: R;
	wire	[7:0]	D = X + (~Y) + 1'b1;

	reg		[7:0]	R;
	always @(posedge clk) begin
		if (reset)
			R <= 7'h0;
		else
			R <= (L)? D: R;
	end
endmodule



















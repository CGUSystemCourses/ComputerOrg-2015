module adder (in1, in0, cin, cout, out);
	input	[15:0]	in1;
	input	[15:0]	in0;
	input			cin;
	output	[15:0]	out;
	output			cout;

	assign	{carry, out} = in1 + in0 + cin;
endmodule
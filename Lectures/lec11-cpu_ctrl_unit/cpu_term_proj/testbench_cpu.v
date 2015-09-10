module main;

reg                clk;
reg       [31:0]   sim_cycle;

initial clk = 0;
initial sim_cycle = 0;

// Set clock and sim_cycle
always  #5 clk = ~clk;
always @(posedge clk)  sim_cycle <= sim_cycle + 1;


reg clean;

cpu_with_memory cm88(
    .clean (clean),
    .clk (clk)
);


//to feed test vectors
always @(posedge clk) begin
    case (sim_cycle)
        0: begin clean = 1'b1; end 
        default: begin clean = 1'b0; end
    endcase
end

reg		[31:0]	i;

initial begin
	//generate the simulation waveform
	$vcdplusfile ("cpu.vpd");
	$vcdpluson;

	while (sim_cycle<`SIM_CYCLE) begin
		@(posedge clk);
    end

	$display ("address\t\tmemory content");
	$display ("-----------------------------------");
	for (i=0;i<`DUMP_MEM_SIZE;i=i+1) begin
		$display (" %02h\t\t%02h", i, cm88.dm8_256.memory[i]);
	end

	$finish(0);
end

endmodule

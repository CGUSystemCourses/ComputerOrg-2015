module button_buffer
#(parameter CLOCK=99)
(
    input        clean,
    input        clk,
    input        button,
    output reg   signal 
);

reg [10:0] counter;

always @(posedge clk) begin
    if(clean == 1'b1) begin
        counter <= 10'b0;
    end
    else begin
        if(button == 1'b1)
            counter <= CLOCK;
        else
           if(counter != 0)
               counter <= counter - 1;
		   else
			   counter <= counter;
    end
end


always @(*) begin
    if(counter == 10'h001) begin
        signal = 1'b1;
    end
    else 
        signal = 1'b0;
end

endmodule

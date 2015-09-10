module seven_display
(
    output reg  [7:0]  display,
    input       [3:0]  num,
    input              enable
);

always @(*) begin
    if(enable == 1'b1) begin
        case (num)
            4'b0000: display = 8'b11111100;
            4'b0001: display = 8'b01100000;
            4'b0010: display = 8'b11011010;
            4'b0011: display = 8'b11110010;
            4'b0100: display = 8'b01100110;
            4'b0101: display = 8'b10110110;
            4'b0110: display = 8'b10111110;
            4'b0111: display = 8'b11100100;
            4'b1000: display = 8'b11111110;
            4'b1001: display = 8'b11110110;
            4'b1010: display = 8'b11101110;
            4'b1011: display = 8'b00111110;
            4'b1100: display = 8'b10011100;
            4'b1101: display = 8'b01111010;
            4'b1110: display = 8'b11011110;
            4'b1111: display = 8'b10001110;
        endcase
    end
    else
        display = 7'b0;
end

endmodule

module seven_dis_4
#(parameter FREQ=1000, INPUT_WIDTH=4, OUTPUT_WIDTH=7)
(
    input                            clean,
    input                            clk,
    input       [3:0]                twinkle_select,
    input       [INPUT_WIDTH-1: 0]   num1,
    input       [INPUT_WIDTH-1: 0]   num2,
    input       [INPUT_WIDTH-1: 0]   num3,
    input       [INPUT_WIDTH-1: 0]   num4,
    
    output      [3:0]                light_select,
    output      [OUTPUT_WIDTH-1: 0]  light
);

/**
 *  Twinkle Counter   
 *
 */
reg twinkle;
reg [9:0] twinkle_count;

always @(posedge clk) begin
    if(clean == 1'b1) begin 
        twinkle_count = 10'b0;
        twinkle = 1'b0;
    end
    else begin
        if(twinkle_count == FREQ) begin
            twinkle_count = 10'b0;
            twinkle = ~twinkle;
        end
        else
            twinkle_count = twinkle_count + 1;
    end
end

/**
 *   Product Scanning Seven Segement Light 
 *
 * */
reg  [3:0]  shift_select;
reg  [INPUT_WIDTH-1: 0] show_num;
wire [OUTPUT_WIDTH-1: 0] output_show_num;

always @(posedge clk) begin
    if(clean == 1'b1) begin
        shift_select = 4'b1000;
    end
    else 
        shift_select = {shift_select[0], shift_select[3:1]};
end

reg light_enable;

always @(*) begin
    case (shift_select)
        4'b0001: show_num = num1;
        4'b0010: show_num = num2;
        4'b0100: show_num = num3;
        4'b1000: show_num = num4;
        default: show_num = num1;
    endcase

    case (shift_select)
        4'b0001: light_enable = (twinkle_select[0]== 1'b1)? twinkle: 1'b1; 
        4'b0010: light_enable = (twinkle_select[1]== 1'b1)? twinkle: 1'b1;
        4'b0100: light_enable = (twinkle_select[2]== 1'b1)? twinkle: 1'b1;
        4'b1000: light_enable = (twinkle_select[3]== 1'b1)? twinkle: 1'b1;
        default: light_enable = (twinkle_select[0]== 1'b1)? twinkle: 1'b1;
    endcase
end


/**
 *    Output Assign
 *
 * */
seven_display sd(.display(output_show_num),
                 .num(show_num),
                 .enable(light_enable));
assign light_select = shift_select;
assign light = output_show_num;


endmodule

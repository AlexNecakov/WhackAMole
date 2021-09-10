`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: EC311
// Engineer: Tony Faller
// 
// Create Date: 11/12/2019 10:58:23 AM
// Design Name: 
// Module Name: display_control
// Project Name: Lab 2
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module display_control(
    input refresh_clock, reset, 
    input[11:0] score,
    input[5:0] game_clock,
    output reg [7:0]AN, 
    output reg [3:0]dig_out
    );
    
    /*Describe internal 3-bit counter*/
    reg[2:0] count_int;
    always@(posedge refresh_clock, posedge reset) begin
        if(reset) begin
            count_int <= 0;
        end
        else begin
            count_int <= count_int +1'b1;
        end
    end
    
    /*Describe internal MUX*/
    always@(posedge refresh_clock, posedge reset) begin
        if(reset) begin
            AN <= 8'b01110000;
            dig_out <= 4'b1000;
        end
        else begin
            case(count_int)
                3'b000: begin
                    AN <= 8'b11111110;
                    dig_out <= score[3:0];
                end
                3'b001: begin
                    AN <= 8'b11111101;
                    dig_out <= score[7:4];
                end
                3'b010: begin
                    AN <= 8'b11111011;
                    dig_out <= score[11:8];
                end
                3'b011: begin
                    AN <= 8'b11110111;
                    dig_out <= 4'b0000;
                end
                3'b100: begin
                    AN <= 8'b11111111;
                    dig_out <= 4'b1011; // B
                end
                3'b101: begin
                    AN <= 8'b11111111;
                    dig_out <= 4'b1010; // A
                end
                3'b110: begin
                    AN <= 8'b11111111;
                    dig_out <= game_clock[3:0];
                end
                3'b111: begin
                    AN <= 8'b01111111;
                    dig_out <= {2'b00, game_clock[5:4]};
                end
            endcase
        end
    end
    
    
endmodule

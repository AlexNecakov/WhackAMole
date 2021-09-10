`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2019 12:55:23 PM
// Design Name: 
// Module Name: rngGen
// Project Name: 
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


module rngGen(
    input clkGlobal, clkLevel,
    input [5:0] en,
    input reset,
    input sample,
    output reg [2:0] outIn,
    output reg [4:0] outLed
    );
    
    reg [2:0] c =0;
    
    //rng counter resets on reset but runs on global clock
    always@(posedge clkGlobal, posedge reset) begin
        c <= (reset||c==3'b100)?(c + 1'b1):3'b0;
    end
    
    always@(posedge clkLevel,posedge reset)begin
        if (reset)begin  
                outIn <= 3'bzzz;
                outLed <= 5'b0;
        end
        else begin
            if(en < 6'b011110)begin
                    outIn <= c;
                    case(c)
                        3'b000:
                           outLed <= 5'b00001;
                        3'b001:
                           outLed <= 5'b00010;
                        3'b010:
                           outLed <= 5'b00100;
                        3'b011:
                           outLed <= 5'b01000;
                        3'b100:
                           outLed <= 5'b10000;
                        default:
                           outLed <= 5'b0;  
                    endcase
            end
            else begin
                outIn <= 3'bzzz;
                outLed <= 5'b0;
            end
        end
    end
    
    always@(posedge sample,posedge reset)begin
        if (reset)begin  
                outIn <= 3'bzzz;
                outLed <= 5'b0;
        end
        
        else begin
            if(en < 6'b011110)begin
                    outIn <= c;
                    case(c)
                        3'b000:
                           outLed <= 5'b00001;
                        3'b001:
                           outLed <= 5'b00010;
                        3'b010:
                           outLed <= 5'b00100;
                        3'b011:
                           outLed <= 5'b01000;
                        3'b100:
                           outLed <= 5'b10000;
                        default:
                           outLed <= 5'b0;  
                    endcase
            end
            else begin
                outIn <= 3'bzzz;
                outLed <= 5'b0;
            end
        end
    end
endmodule

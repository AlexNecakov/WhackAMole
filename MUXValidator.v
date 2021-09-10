`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2019 05:05:05 PM
// Design Name: 
// Module Name: MUXValidator
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


module MUXValidator(
    input clk,    
    input [4:0]buttons,
    input [2:0]selector,
    output reg pulse
    );
    
    always@(posedge clk) begin
        case (selector)
        
        3'b000: pulse = buttons[0];
        
        3'b001: pulse = buttons[1];
        
        3'b010: pulse = buttons[2];
        
        3'b011: pulse = buttons[3];
        
        3'b100: pulse = buttons[4];
        
        default: pulse = 1'b0;
        
        endcase
    end//always      
    
    
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2019 04:06:18 PM
// Design Name: 
// Module Name: counter
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


module counter8bit(
    input clock,
    input reset,
    input increment,
    output reg [7:0]counter
    );
    
    always @(posedge clock)
    begin
        if (reset)
            counter <= 8'b00000000;
        else if (increment)
            counter <= counter + 1'b1;
    end        
    
endmodule

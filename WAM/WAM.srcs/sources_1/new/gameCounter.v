`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Alex Necakov
// 
// Create Date: 12/04/2019 01:11:50 PM
// Design Name: 
// Module Name: gameCounter
// Project Name: WAM
// Target Devices: 
// Tool Versions: 
// Description: game counter to act as state director for project
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module gameCounter(
    input clock, reset,
    output reg[5:0] count
    );
    reg enable;
    
    always @ (reset) begin
        count <= 6'b100011;
        enable <= reset?1'b0:1'b1;
    end
    
    always @ (posedge clock) begin
        enable = (count == 6'b0)?1'b0:enable;
        count = enable?(count - 1'b1):count;
    end
    
endmodule

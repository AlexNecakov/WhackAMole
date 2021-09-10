`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Alex Necakov
// 
// Create Date: 12/04/2019 01:39:14 PM
// Design Name: 
// Module Name: TBgameCounter
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


module TBgameCounter(
    );
    wire[5:0] count;
    reg clock, reset;
    
    gameCounter test(clock, reset, count);
    
    initial begin
        reset = 1'b0;
        #10 reset = 1'b1;
        #50
        #10 reset = 1'b0;
        #750
        reset = 1'b1;
    end
    
    always begin
        clock = 1'b0;
        #10
        clock = 1'b1;
        #10;
    end
    
endmodule

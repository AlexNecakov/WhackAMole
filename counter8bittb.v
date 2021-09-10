`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2019 04:24:35 PM
// Design Name: 
// Module Name: counter_testbench
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


module counter8bittb(

    );
    
    reg clock, reset, button;
    wire [7:0]counter;
    
    counter8bit count1(clock, reset, button, counter);
    
    initial begin
        reset = 1;
        button = 1;
        clock = 0;
    end
    
    always begin
        #1000 button = button + 1'b1;
    end
    
    always
    begin
        #5 clock = clock + 1'b1;
    end
    
    always
    begin
        #800 reset = reset + 1'b1;
    end
    
endmodule

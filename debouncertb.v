`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/31/2019 03:44:03 PM
// Design Name: 
// Module Name: debouncer_testbench
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

module debouncertb(

    );
    
    reg clock, reset, button;
    wire pulse;
    
    debouncer deb1(clock, reset, button, pulse);
    
    initial begin
        clock = 0;
        reset = 0;
        button = 1;
    end
    
    always
    begin
        #1050 button = button + 1'b1;
    end
    
     always
    begin
        #5 clock = clock + 1'b1;
    end
     always
    begin
        #15000 reset = reset + 1'b1;
    end
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2019 05:31:36 PM
// Design Name: 
// Module Name: MUXValidatortb
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


module MUXValidatortb(

    );
    
    reg clock;
    reg [4:0] buttons;
    reg [2:0] selector;
    wire pulse;
    
    MUXValidator mux1(clock, buttons, selector, pulse);
    
    initial begin
        buttons = 5'b00001;
        clock = 0;
        selector = 3;
    end
    
    always begin
        #5 clock = ~clock;
    end
    
    always begin
         #30 buttons = (buttons == 5'b10000)?5'b00001 : buttons << 1;
    end
    
    always begin
        #90 selector = selector + 1'b1; 
    end
    
    
endmodule

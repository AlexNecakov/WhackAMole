`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2019 03:39:59 PM
// Design Name: 
// Module Name: debouncer
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

//Change count_max when using testbench
module debouncer #(parameter COUNT_MAX = 1000000) //Change COUNT_MAX BACK TO 1000000 later!
(
    input clock,
    input reset,
    input button,
    output reg pulse
);
    
    reg[31:0] count;
    reg allowToGrow;
    
    always@(posedge clock, posedge reset) begin
        if(reset)
            count <= 0;
        else if (button)
            count <= count + 1;
        else
            count <= 0;
    end
    
    always@(posedge clock) begin
        if (reset)
            begin
            pulse <= 1'b0;
            end
        else if (count == COUNT_MAX)        
            begin
            pulse <= 1'b1;
            end
        else
            begin
            pulse <= 1'b0;
            end
    end     
    
    
endmodule

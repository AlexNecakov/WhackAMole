`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: EC311
// Engineer: Tony Faller
// 
// Create Date: 12/04/2019 01:07:41 PM
// Design Name: 
// Module Name: BinaryBCDConverter
// Project Name: WhackAM01e
// Target Devices: 
// Tool Versions: 
// Description: This module converts an 8 bit binary input to a 12 bit BCD output.
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: This code was found at http://verilogcodes.blogspot.com/2015/10/verilog-code-for-8-bit-binary-to-bcd.html
// 
//////////////////////////////////////////////////////////////////////////////////


module BinaryBCDConverter(
    input [7:0] bin,
    output reg [11:0] bcd
    );
    reg [3:0] i;
    
    always@(bin) begin
        /*Initialize bcd to zero*/
        bcd = 0;
        
        /*8 Iterations*/
        for(i=0; i<8; i = i+1) begin
            bcd = {bcd[10:0], bin[7-i]};
            
            /*If a hex digit of bcd is more tha 4, add 3 to it*/
            if(i<7 && bcd[3:0]>4)
                bcd[3:0] = bcd[3:0] + 3;
            if(i<7 && bcd[7:4]>4)
                bcd[7:4] = bcd[7:4] + 3;
            if(i<7 && bcd[11:8]>4)
                bcd[11:8] = bcd[11:8] + 3;
        end
    end
    
    
endmodule

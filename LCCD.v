`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2019 01:19:53 PM
// Design Name: 
// Module Name: LCCD
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


module LCCD(
    input clkglobal,
    input [1:0] diff,
    input resetlocal,
    input resetglobal,
    output reg count
    );
    //clocks
    wire b = 0 ;//2hz
    wire e = 0 ;//hz
    wire m = 0;//hz/2 
    wire d = 0;//hz/4
    reg o = -1;
    clockdivider  #(100000000)(clkglobal, resetglobal,b);
    clockdivider  #(50000000)(clkglobal, resetglobal,e);
    clockdivider  #(25000000)(clkglobal, resetglobal,m);
    clockdivider  #(12500000)(clkglobal, resetglobal,d);
    
    always@(posedge clkglobal)
    begin
        case(diff)
            2'b00:
                o= b;
            2'b01:
                o= e;
            2'b10:
                o= m;
            2'b11:
                o= d;
            default:
                o= b;
        
        endcase
        count = o;
    end
    
    always@(posedge resetglobal)
    begin
        case(diff)
            2'b00:
                o= b;
            2'b01:
                o= e;
            2'b10:
                o= m;
            2'b11:
                o= d;
            default:
                o= b;
        
        endcase
        count = o;
    end
    
    always@(posedge resetlocal)
    begin
        case(diff)
            2'b00:
                o= b;
            2'b01:
                o= e;
            2'b10:
                o= m;
            2'b11:
                o= d;
            default:
                o= b;
        
        endcase
        count = o;
    end
    
endmodule

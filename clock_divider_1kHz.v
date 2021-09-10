`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: EC311
// Engineer: Tony Faller
// 
// Create Date: 11/12/2019 11:19:04 AM
// Design Name: 
// Module Name: clock_divider_1kHz
// Project Name: Lab 2
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: https://learn.digilentinc.com/Documents/262
//                      https://www.fpga4student.com/2017/08/verilog-code-for-clock-divider-on-fpga.html
// 
//////////////////////////////////////////////////////////////////////////////////


module clock_divider_1kHz(
    input clock, reset, 
    output reg op
    );
    
    /*100 000 clock cycles before op goes to 1 and returns to 0 - half this for op to toggle*/
    parameter constantNumber = 50000;
    
    /*Counter to count the external clock cycles*/
    reg[31:0] count;
    always@(posedge clock, posedge reset) begin
        if(reset) begin
            count <= 0;
        end
        else if(count >= constantNumber-1) begin
            count <= 0;
        end
        else begin
            count <= count + 1'b1;
        end
    end
    
    /*FF where enable bit is op of counter & op is divided clock*/
    always@(posedge clock, posedge reset) begin
        if(reset) begin
            op <= 0;
        end
        else if(count >= constantNumber-1) begin
            op <= ~op;
        end
        else begin
            op <= op;
        end
    end
endmodule

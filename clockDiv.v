`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2019 01:07:06 PM
// Design Name: 
// Module Name: clockDiv
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


`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/19/2019 05:15:28 AM
// Design Name: 
// Module Name: clockdivider
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


module clockdivider
     #(   parameter constantNumber = 1
       )
    (
    input clock, reset, 
    output reg op
    
    );
    
    /*100 000 000 clock cycles before op goes to 1 and returns to 0 - half this for op to toggle*/
    //parameter constantNumber = 50000000;
    // 50000000 = HRTZ
    //100000000 = 2HRTZ
    // 25000000 = HRTZ/2
    // 12500000 = HRTZ/4 
    // 50000 = KHRZ
    
    
    /*Counter to count the external clock cycles*/
    reg[31:0] count;
    always@(posedge clock, posedge reset) begin
        if(reset) begin
            count <= 0;
        end
        else if(count >= constantNumber - 1) begin
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
        else if(count == constantNumber - 1) begin
            op <= ~op;
        end
        else begin
            op <= op;
        end
    end
    
    
endmodule


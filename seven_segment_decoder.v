`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: EC311
// Engineer: Tony Faller
// 
// Create Date: 11/06/2019 05:43:56 PM
// Design Name: 
// Module Name: seven_segment_decoder
// Project Name: WhackAM01e
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments: Reference manual found at https://reference.digilentinc.com/reference/programmable-logic/nexys-a7/reference-manual
//                      This is the same as was used in Lab 2
//////////////////////////////////////////////////////////////////////////////////


module seven_segment_decoder(
    input[3:0] in,  //one digit hex number 0-F
    input clock, reset,
    output reg CA, CB, CC, CD, CE, CF, CG
    );
    
    always@(posedge clock, posedge reset) begin
        if(reset) begin
                CA <= 0;
                CB <= 0;
                CC <= 0;
                CD <= 0;
                CE <= 0;
                CF <= 0;
                CG <= 0;
        end
        else begin
            case(in)
                4'b0000: begin  //0
                    CA <= 0;
                    CB <= 0;
                    CC <= 0;
                    CD <= 0;
                    CE <= 0;
                    CF <= 0;
                    CG <= 1;
                end
                4'b0001: begin  //1
                    CA <= 1;
                    CB <= 0;
                    CC <= 0;
                    CD <= 1;
                    CE <= 1;
                    CF <= 1;
                    CG <= 1;
                end
                4'b0010: begin  //2
                    CA <= 0;
                    CB <= 0;
                    CC <= 1;
                    CD <= 0;
                    CE <= 0;
                    CF <= 1;
                    CG <= 0;
                end
                4'b0011: begin  //3
                    CA <= 0;
                    CB <= 0;
                    CC <= 0;
                    CD <= 0;
                    CE <= 1;
                    CF <= 1;
                    CG <= 0;
                end
                4'b0100: begin  //4
                    CA <= 1;
                    CB <= 0;
                    CC <= 0;
                    CD <= 1;
                    CE <= 1;
                    CF <= 0;
                    CG <= 0;
                end
                4'b0101: begin  //5
                    CA <= 0;
                    CB <= 1;
                    CC <= 0;
                    CD <= 0;
                    CE <= 1;
                    CF <= 0;
                    CG <= 0;
                end
                4'b0110: begin  //6
                    CA <= 0;
                    CB <= 1;
                    CC <= 0;
                    CD <= 0;
                    CE <= 0;
                    CF <= 0;
                    CG <= 0;
                end
                4'b0111: begin  //7
                    CA <= 0;
                    CB <= 0;
                    CC <= 0;
                    CD <= 1;
                    CE <= 1;
                    CF <= 1;
                    CG <= 1;
                end
                4'b1000: begin  //8
                    CA <= 0;
                    CB <= 0;
                    CC <= 0;
                    CD <= 0;
                    CE <= 0;
                    CF <= 0;
                    CG <= 0;
                end
                4'b1001: begin  //9
                    CA <= 0;
                    CB <= 0;
                    CC <= 0;
                    CD <= 0;
                    CE <= 1;
                    CF <= 0;
                    CG <= 0;
                end
                4'b1010: begin  //A
                    CA <= 0;
                    CB <= 0;
                    CC <= 0;
                    CD <= 1;
                    CE <= 0;
                    CF <= 0;
                    CG <= 0;
                end
                4'b1011: begin  //B
                    CA <= 0;
                    CB <= 0;
                    CC <= 0;
                    CD <= 0;
                    CE <= 0;
                    CF <= 0;
                    CG <= 0;
                end
                4'b1100: begin  //C
                    CA <= 0;
                    CB <= 1;
                    CC <= 1;
                    CD <= 0;
                    CE <= 0;
                    CF <= 0;
                    CG <= 1;
                end
                4'b1101: begin  //D
                    CA <= 0;
                    CB <= 0;
                    CC <= 0;
                    CD <= 0;
                    CE <= 0;
                    CF <= 0;
                    CG <= 1;
                end
                4'b1110: begin  //E
                    CA <= 0;
                    CB <= 1;
                    CC <= 1;
                    CD <= 0;
                    CE <= 0;
                    CF <= 0;
                    CG <= 0;
                end
                4'b1111: begin  //F
                    CA <= 0;
                    CB <= 1;
                    CC <= 1;
                    CD <= 1;
                    CE <= 0;
                    CF <= 0;
                    CG <= 0;
                end
            endcase
        end
    end
    
endmodule

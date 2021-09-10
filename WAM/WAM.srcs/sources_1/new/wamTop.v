`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Alex Necakov
// 
// Create Date: 12/04/2019 01:07:55 PM
// Design Name: 
// Module Name: wamTop
// Project Name: WAM
// Target Devices: 
// Tool Versions: 
// Description: top level module for 311 final project
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module wamTop(
    input clock, reset,
    input[1:0] level,
    input wire[4:0] butt,
    output wire[4:0] led,
    output[6:0] sevenSegment,
    output[7:0] dispSelect
    );
    
    wire hzClock, khzClock, lvlClock;
    wire validInput;
    wire[2:0] inputSelect;
    wire[7:0] gameTime;
    wire[4:0] bounceOut;
    wire[7:0] score;
    wire[23:0] bcdToDisplay;
    wire[3:0] currentDigit;
    
    clock_divider_1Hz hzClockDiv(clock, hzClock);
    clock_divider_1kHz khzClockDiv(clock, khzClock);
    LCCD lvlClockDiv (clock, level[1:0], validInput, reset, lvlClock);
    
    gameCounter masterCounter(clock, reset, gameTime[5:0]);
    
    rngGen rng(clock, lvlClock, gameTime[5:0], reset, validInput, inputSelect, led);
  
    debouncer d0(clock, reset, butt[0], bounceOut[0]);
    debouncer d1(clock, reset, butt[1], bounceOut[1]);
    debouncer d2(clock, reset, butt[2], bounceOut[2]);
    debouncer d3(clock, reset, butt[3], bounceOut[3]);
    debouncer d4(clock, reset, butt[4], bounceOut[4]);
    MUXValidator buttons(clock, bounceOut, inputSelect, validInput);
    
    counter8bit numMoles(clock, reset, validInput, score);
    
    BinaryBCDConverter bcdScoreConv(score, bcdScore);
    BinaryBCDConverter bcdTimeConv(gameTime, bcdTime);
    
    display_control dc(khzClock, reset, bcdScore, bcdTime, dispSelect, currentDigit);
    
    seven_segment_decoder sevDec(currentDigit, khzClock, reset, sevenSegment);
    
endmodule

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.03.2023 10:20:35
// Design Name: 
// Module Name: top_module_slowed_clk_tb
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


module top_module_slowed_clk_tb;
reg main_clk,PC_OUT;
reg [3:0]IR_clk;
reg reset;
reg [7:0]D_IN;
reg processing_clk;
wire [3:0]Anode_Activate;
wire [15:0]OUT_A;
wire [6:0]LED_OUT;

top_module_slowed_clk top_module_slowed_clk_tb(.PC_OUT(PC_OUT), .main_clk(main_clk), .IR_clk(IR_clk), .reset(reset), .D_IN(D_IN), .processing_clk(processing_clk), .Anode_Activate(Anode_Activate), .OUT_A(OUT_A), .LED_OUT(LED_OUT));

initial begin
main_clk=0;
forever begin
       #5 main_clk=~main_clk;
       end
   end
 // 000000_00011_00010_00000_00000_000101
 
initial begin
        reset=1'b1; #40; 
        // R type triadic
        reset=1'b0; D_IN=8'b00000000; IR_clk=4'b1000; processing_clk=1'b0; #40;
        reset=1'b0; D_IN=8'b10000011; IR_clk=4'b0100; processing_clk=1'b0; #40;
        reset=1'b0; D_IN=8'b00000000; IR_clk=4'b0010; processing_clk=1'b0; #40;
        reset=1'b0; D_IN=8'b00000001; IR_clk=4'b0001; processing_clk=1'b0; #40;
        processing_clk=1; #40; 
        // branch
        reset=1'b0; D_IN=8'b11010000; IR_clk=4'b1000; processing_clk=1'b0; #40;
        reset=1'b0; D_IN=8'b10000011; IR_clk=4'b0100; processing_clk=1'b0; #40;
        reset=1'b0; D_IN=8'b00000000; IR_clk=4'b0010; processing_clk=1'b0; #40;
        reset=1'b0; D_IN=8'b00001010; IR_clk=4'b0001; processing_clk=1'b0; #40;
        processing_clk=1; #80;
        // jmp
        reset=1'b0; D_IN=8'b11011000; IR_clk=4'b1000; processing_clk=1'b0; #40;
        reset=1'b0; D_IN=8'b10000000; IR_clk=4'b0100; processing_clk=1'b0; #40;
        reset=1'b0; D_IN=8'b00000000; IR_clk=4'b0010; processing_clk=1'b0; #40;
        reset=1'b0; D_IN=8'b00001011; IR_clk=4'b0001; processing_clk=1'b0; #40;
        processing_clk=1; #80;
        // immediate
        reset=1'b0; D_IN=8'b10000100; IR_clk=4'b1000; processing_clk=1'b0; #40;
        reset=1'b0; D_IN=8'b01100000; IR_clk=4'b0100; processing_clk=1'b0; #40;
        reset=1'b0; D_IN=8'b00000000; IR_clk=4'b0010; processing_clk=1'b0; #40;
        reset=1'b0; D_IN=8'b00101000; IR_clk=4'b0001; processing_clk=1'b0; #40;
        processing_clk=1; #40;
        // immediate
        reset=1'b0; D_IN=8'b10011100; IR_clk=4'b1000; processing_clk=1'b0; #40;
        reset=1'b0; D_IN=8'b01100000; IR_clk=4'b0100; processing_clk=1'b0; #40;
        reset=1'b0; D_IN=8'b00000000; IR_clk=4'b0010; processing_clk=1'b0; #40;
        reset=1'b0; D_IN=8'b00000001; IR_clk=4'b0001; processing_clk=1'b0; #40;
        processing_clk=1; #40;
        processing_clk=1'b0; #80;
       $finish;
      end
      
endmodule



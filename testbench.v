
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2026 02:21:12
// Design Name: 
// Module Name: testbench
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


module testbench;
        reg clk;
        reg reset;
        wire[2:0] lightA;
        wire[2:0] lightB;
        wire pedestrian;
        
        traffic_light_controller uut(
              .clk(clk),
              .reset(reset),
              .lightA(lightA),
              .lightB(lightB),
              .pedestrian(pedestrian)
        );
        
        always #5 clk = ~clk; 
        
        initial begin
              clk = 0;
              reset = 1;
              #10 reset = 0;
              #300 $finish;
        end
endmodule

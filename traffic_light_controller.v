
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.03.2026 01:58:14
// Design Name: 
// Module Name: traffic_light_controller
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


module traffic_light_controller(
        input clk,
        input reset,
        output reg pedestrian,
        output reg[2:0] lightA,
        output reg[2:0] lightB
    );
    
    // State encoding
    parameter s0 = 3'b000,
              s1 = 3'b001,
              s2 = 3'b010,
              s3 = 3'b011,
              s4 = 3'b100;
    reg[2:0] state;
    reg[3:0] count;
    
              
    // State Transition
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            state <= 0;
            count <= 0;
        end
        else begin
            case(state)
                s0 : begin   // Case 1
                    if(count == 5) begin
                        state <= s1;
                        count <= 0;
                    end else count <= count + 1;    
               end
               
                s1 : begin
                    if(count == 2) begin
                        state <= s2;
                        count <= 0;
                    end else count <= count + 1;    
               end
               
                s2 : begin
                    if(count == 5) begin
                        state <= s3;
                        count <= 0;
                    end else count <= count + 1;    
               end
               
                s3 : begin
                    if(count == 2) begin
                          state <= s4;
                          count <= 0;
                    end else count <= count + 1;    
               end
               
               s4 : begin
                    if(count == 5)begin
                        state <= s0;
                        count <= 0;
                    end else count <= count + 1;    
               end
            endcase
        end
    end            
    
    always @(posedge clk or posedge reset) begin
        if(reset) begin
            lightA = 3'b001;
            lightB = 3'b100;
            pedestrian = 0;
        end
        else begin
            case(state)
                s0 : begin
                    lightA = 3'b001;
                    lightB = 3'b100;
                    pedestrian = 0;
                end
            
                s1 : begin
                     lightA = 3'b010;
                     lightB = 3'b100;
                    pedestrian = 0;
                end
            
                s2 : begin
                     lightA = 3'b100;
                     lightB = 3'b001;
                     pedestrian = 0;
                end
            
                s3 : begin
                     lightA = 3'b100;
                     lightB = 3'b010;
                     pedestrian = 0;
                end
            
                s4 : begin
                     lightA = 3'b100;
                     lightB = 3'b100;
                     pedestrian = 1;
                end  
            endcase
        end
    end
endmodule

module bincnt(clk, LED0, LED1, LED2, LED3, LED4, LED5, LED6, LED7);
    input clk;
    output LED0, LED1, LED2, LED3, LED4, LED5, LED6, LED7;

   reg ready = 0;
   reg [23:0]     divider;
   reg [7:0]      outleds;
   
   always @(posedge clk) begin
      if (ready) 
        begin
           if (divider == 12000000) 
             begin
                divider <= 0;
                outleds <= outleds + 1;
             end
           else 
             divider <= divider + 1;
        end
      else 
        begin
           ready <= 1;
           outleds <= 8'b00000000;
           divider <= 0;
        end
   end
   
   assign LED0 = outleds[0];
   assign LED1 = outleds[1];
   assign LED2 = outleds[2];
   assign LED3 = outleds[3];
   assign LED4 = outleds[4];
   assign LED5 = outleds[5];
   assign LED6 = outleds[6];
   assign LED7 = outleds[7];
endmodule // top


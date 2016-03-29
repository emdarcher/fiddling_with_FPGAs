module top(input clk, output D2, output D3, output D4, output D5, output D6, 
    output D7, output D8, output D9);
   
   reg ready = 0;
   reg [23:0]     divider;
   reg [7:0]      rot;
   
   always @(posedge clk) begin
      if (ready) 
        begin
           if (divider == 12000000) 
             begin
                divider <= 0;
                rot <= {rot[6:0], rot[7]};
             end
           else 
             divider <= divider + 1;
        end
      else 
        begin
           ready <= 1;
           rot <= 8'b00000001;
           divider <= 0;
        end
   end
   
   assign D2 = rot[0];
   assign D3 = rot[1];
   assign D4 = rot[2];
   assign D5 = rot[3];
   assign D6 = rot[4];
   assign D7 = rot[5];
   assign D8 = rot[6];
   assign D9 = rot[7];
endmodule // top


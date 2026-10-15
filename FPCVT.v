module FPCVT (
   input wire [11:0] num,
   output reg [7:0] fp
);
   
   reg        s;
   reg [11:0] abs_num;
   integer    LZ;
   integer    i;
   reg [3:0]  f;
   integer    e;
   reg        round;
   reg [11:0] shifted_num;

   always @ (*) begin
       s = num[11];
       if (s == 1'b1) begin
           abs_num = -num;  //2s complement
       end else begin
           abs_num = num;
       end
       
       LZ = 0;
       for (i = 11; i >= 0; i = i - 1) begin
           if (abs_num[i] == 1'b1) begin
               i = -1; // break out of loop
           end
           LZ = LZ + 1; //counting leading 0s
       end
       
       if (LZ > 8) begin
           e = 0;
       end 
       
       abs_num = abs_num << LZ;
       f = abs_num[11:8];
       round = shifted_num[7];
       
       if (round == 1'b1) begin
           if (f == 4'b1111) begin
               f = 4'b1000;
               e = e + 1;
               if (e > 7) begin //Caveat/edge cases
                   e = 7;
                   f = 4'b1111;
               end
           end else begin
               f = f + 1'b1;
           end
       end
       fp = {s, e[2:0], f};
   end

endmodule
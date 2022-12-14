//iverilog仿真指令：
//iverilog -o file_write.vvp -y ./ file_write.v
//vvp file_write.vvp

module file_write;

   parameter    MAX = 100;
   parameter    MIN = 0;
   reg [31:0]   num_range;
   integer      seed = 4;
   integer      i = 0;
   integer      file_handle;

   initial
   begin
    file_handle = $fopen("file1.txt");

    for (i = 0; i <= 10; i = i+1) 
    begin
        num_range = MIN + {$random(seed)} % (MAX-MIN+1);
        $fdisplay(file_handle,"%d",$signed(num_range));
    end
    
    $fclose(file_handle);
   end

endmodule

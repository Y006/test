<!--
 * @Author: Y006 2420457716@qq.com
 * @Date: 2022-12-13 19:40:11
 * @LastEditors: Y006 2420457716@qq.com
 * @LastEditTime: 2022-12-13 19:42:42
 * @FilePath: \test\文件操作.md
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
-->
# 结构化数字设计文件操作

## 题目要求

随机产生一组数值（十个），将该组数写入一个文本文件（命名为file1.txt），同时将本人的学号和姓名也写进生成的该文件中。写出代码和调试过程，并截图生成的文件界面。

## 题目实现

1. 实现思路：

   首先使用系统任务 `$random()` 产生随机数。使用整型变量 `seed` 来确保每次运行测试时生成同样的随机数序列。使用参数 `MAX` 和 `MIN` 来限定随机数的范围。然后在工程目录创建空白文件 `file1.txt`，然后打开该文件，循环写入生成的随机数到文件中，最后写入姓名和学号。最后关闭文件。

2. 源代码：

   ```verilog
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
   ```

   

3. 实验结果：

   编译上述代码，然后在 modelsim 仿真界面使用 `run -all` 指令，然后打开工程目录下提前建立好的 `file1.txt` 文件，观察文件内容。
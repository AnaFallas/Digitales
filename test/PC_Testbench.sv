module PC_Testbench;
    parameter CLOCK_PERIOD = 10; 
    logic clk;
    logic rst;
    logic [31:0] oldpc;
    logic [31:0] newpc;
   
    PC UUT (
        .clk(clk),
        .rst(rst),
        .oldpc(oldpc),
        .newpc(newpc)
    );

    initial begin
  
        clk = 0;
        rst = 1;
        oldpc = 32'h00000000;

    
        #CLOCK_PERIOD;


        rst = 0;
        #CLOCK_PERIOD;

 
        repeat (10) begin
 
            clk = 1;
            #CLOCK_PERIOD;
            clk = 0;
            #CLOCK_PERIOD;

      
            oldpc = oldpc + 4;
        end
        $finish;
    end

    always #((CLOCK_PERIOD/2)) begin

        clk = ~clk;
    end

endmodule

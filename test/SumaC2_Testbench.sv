module SumaC2_Testbench;

   
    parameter ANCHO = 64;
    parameter CLOCK_PERIOD = 10;


    logic [ANCHO - 1 : 0] a;
    logic [ANCHO - 1 : 0] b;
    logic ci;
    logic [ANCHO - 1 : 0] s;
    logic coutfin;

    SumaC2 #(ANCHO) UUT (
        .a(a),
        .b(b),
        .ci(ci),
        .s(s),
        .coutfin(coutfin)
    );

    initial begin
        a = 'hFFFFFFFFFFFFFFFF;
        b = 'h0000000000000001;
        ci = 0;
        #CLOCK_PERIOD;
        a = 'hFFFFFFFFFFFFFFFF;
        b = 'h0000000000000001;
        ci = 0;
        #CLOCK_PERIOD;

        a = 'h0000000000000001;
        b = 'hFFFFFFFFFFFFFFFF;
        ci = 0;
        #CLOCK_PERIOD;

        a = 'h8000000000000000;
        b = 'h8000000000000000;
        ci = 0;
        #CLOCK_PERIOD;

        $finish;
    end

   
    always #((CLOCK_PERIOD/2)) begin
         clk = ~clk;

    end

endmodule

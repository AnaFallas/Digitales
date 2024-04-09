`timescale 1ns/1ns 

module Clock_tb;

    logic CLK;

    // Instancia del módulo Clock
    Clock uut (
        .CLK(CLK) 
    );

    initial begin
        $dumpfile("clock_tb.vcd"); 
        $dumpvars(0, Clock_tb); 
        CLK = 0; // Inicializamos el reloj en bajo
        #10; // Esperamos 10 unidades de tiempo
        repeat(20) begin // Repetimos 20 veces
            #100; // Esperamos 100 unidades de tiempo
            CLK = ~CLK; 
        end
        $finish; 
    end

endmodule


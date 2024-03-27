`timescale 1ns / 1ns

module Datamemory_tb;

    // Parámetros del módulo
    reg [63:0] adr, datain;
    reg w, r, clk;
    wire [63:0] dataout;

    // Instanciación del módulo bajo prueba
    Datamemory uut (
        .adr(adr),
        .datain(datain),
        .w(w),
        .r(r),
        .clk(clk),
        .dataout(dataout)
    );

    // Generación de estímulos
    initial begin
        $dumpfile("datamemory_tb.vcd");
        $dumpvars(0, Datamemory_tb);

        // Inicialización de señales
        adr = 0;
        datain = 0;
        w = 0;
        r = 0;
        clk = 0;

        // Ciclo de reloj
        forever #5 clk = ~clk;

        // Escritura en memoria (caso 1)
        w = 1;
        adr = 10;
        datain = 32'h12345678;
        #10;

        // Lectura desde memoria (caso 1)
        w = 0;
        r = 1;
        adr = 10;
        #10;

        $finish;
    end
endmodule

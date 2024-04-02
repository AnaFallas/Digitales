
`include "DataMemory.sv"
module Datamemory_tb;

    // Parámetros
    parameter CLK_PERIOD = 10; // Periodo de reloj en unidades de tiempo

    // Señales del testbench
    logic clk = 0;
    logic [63:0] adr;
    logic [63:0] datain;
    logic w;
    logic r;
    logic [63:0] dataout;

    // Instanciación del módulo bajo prueba
    DataMemory dut (
        .adr(adr),
        .datain(datain),
        .w(w),
        .r(r),
        .clk(clk),
        .dataout(dataout)
    );

    // Generación de estímulos
    initial begin
        // Inicialización de las entradas
        adr = 0;
        datain = 0;
        w = 0;
        r = 0;

        // Ciclo de reloj
        forever #CLK_PERIOD clk = ~clk;

        // Escritura de datos en la memoria
        #20;
        adr = 10;
        datain = 64'hABCDEFFEDCBA;
        w = 1;
        #10;
        w = 0;

        // Lectura de datos desde la memoria
        adr = 10;
        r = 1;
        #10;
        r = 0;

        // Terminar simulación
        #10;
        $finish;
    end

    // Monitor para visualizar las salidas
    always @(posedge clk) begin
        $display("Time = %0t, dataout = %h", $time, dataout);
    end

endmodule


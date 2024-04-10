`timescale 1ns/1ns 
`include "Clock.sv"
`default_nettype none


module Clock_tb;

    // Definición de señal de reloj
    reg CLK;

    // Instancia del módulo Clock bajo prueba
    Clock uut (
        .CLK(CLK)
    );

    // Generación de estímulos
    initial begin
        // Inicializa la simulación
        $dumpfile("Clock.vcd");
        $dumpvars(0, uut);
        #10; // Espera un pequeño tiempo para estabilizar la simulación

        // Realiza 10 ciclos de reloj
        repeat (10) begin
            #5; // Avanza 5 unidades de tiempo (medio período)
            CLK = ~CLK; // Invierte la señal de reloj
        end

        // Termina la simulación
        #10; // Espera un pequeño tiempo antes de finalizar
        $finish;
    end

endmodule


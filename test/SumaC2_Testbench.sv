module SumaC2_Testbench;

    // Parámetros de simulación
    parameter ANCHO = 64;
    parameter CLOCK_PERIOD = 10; // Periodo de reloj en unidades de tiempo

    // Definición de señales
    logic [ANCHO - 1 : 0] a;
    logic [ANCHO - 1 : 0] b;
    logic ci;
    logic [ANCHO - 1 : 0] s;
    logic coutfin;

    // Instancia del módulo bajo prueba
    SumaC2 #(ANCHO) UUT (
        .a(a),
        .b(b),
        .ci(ci),
        .s(s),
        .coutfin(coutfin)
    );

    // Generación de estímulos
    initial begin
        // Inicialización de las entradas
        a = 'hFFFFFFFFFFFFFFFF;
        b = 'h0000000000000001;
        ci = 0;

        // Espera un ciclo de reloj
        #CLOCK_PERIOD;

        // Cambia las entradas para probar diferentes casos
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

        // Finaliza la simulación
        $finish;
    end

    // Simulación del reloj
    always #((CLOCK_PERIOD/2)) begin
        // Alternar el reloj cada periodo
    end

endmodule

module PC_Testbench;

    // Parámetros de simulación
    parameter CLOCK_PERIOD = 10; // Periodo de reloj en unidades de tiempo

    // Definición de señales
    logic clk;
    logic rst;
    logic [31:0] oldpc;
    logic [31:0] newpc;

    // Instancia del módulo bajo prueba
    PC UUT (
        .clk(clk),
        .rst(rst),
        .oldpc(oldpc),
        .newpc(newpc)
    );

    // Generación de estímulos
    initial begin
        // Inicialización
        clk = 0;
        rst = 1;
        oldpc = 32'h00000000;

        // Espera un ciclo de reloj
        #CLOCK_PERIOD;

        // Desactiva el reset
        rst = 0;
        #CLOCK_PERIOD;

        // Simulación del comportamiento del contador de programa durante 10 ciclos de reloj
        repeat (10) begin
            // Genera un pulso de reloj
            clk = 1;
            #CLOCK_PERIOD;
            clk = 0;
            #CLOCK_PERIOD;

            // Aumenta el contador de programa en 4 bytes en cada ciclo de reloj
            oldpc = oldpc + 4;
        end

        // Finaliza la simulación
        $finish;
    end

    // Simulación del reloj
    always #((CLOCK_PERIOD/2)) begin
        // Alternar el reloj cada periodo
        clk = ~clk;
    end

endmodule

module Alu_Testbench;

    // Parámetros de simulación
    parameter CLOCK_PERIOD = 10; // Periodo de reloj en unidades de tiempo

    // Definición de señales
    logic [31:0] A, B;
    logic [3:0] ALU_Sel;
    logic [31:0] ALU_Out;
    logic coutfin;
    logic z;

    // Instancia del módulo bajo prueba
    Alu UUT (
        .A(A),
        .B(B),
        .ALU_Sel(ALU_Sel),
        .ALU_Out(ALU_Out),
        .coutfin(coutfin),
        .z(z)
    );

    // Generación de estímulos
    initial begin
        // Reset inicial
        A <= 32'h00000001;
        B <= 32'h00000002;
        ALU_Sel <= 4'b0000;

        // Espera un ciclo de reloj
        #CLOCK_PERIOD;

        // Realiza operación AND
        ALU_Sel <= 4'b0000;
        #CLOCK_PERIOD;

        // Realiza operación OR
        ALU_Sel <= 4'b0001;
        #CLOCK_PERIOD;

        // Realiza operación de suma
        ALU_Sel <= 4'b0010;
        #CLOCK_PERIOD;

        // Cambia A y B a valores diferentes para verificar el resultado de la suma
        A <= 32'h00000003;
        B <= 32'h00000004;
        #CLOCK_PERIOD;

        // Realiza operación de suma
        ALU_Sel <= 4'b0010;
        #CLOCK_PERIOD;

        // Realiza operación no definida (debería resultar en cero)
        ALU_Sel <= 4'b1111;
        #CLOCK_PERIOD;

        // Finaliza la simulación
        $finish;
    end

    // Simulación del reloj
    always #((CLOCK_PERIOD/2)) begin
        // Alternar el reloj cada periodo
    end

endmodule

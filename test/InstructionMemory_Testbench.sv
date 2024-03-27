module InstructionMemory_Testbench;

    // Parámetros de simulación
    parameter CLOCK_PERIOD = 10; // Periodo de reloj en unidades de tiempo
    parameter MEM_SIZE = 16; // Tamaño de la memoria de instrucciones

    // Definición de señales
    logic [63:0] adr;
    logic [31:0] Instruction;

    // Instancia del módulo bajo prueba
    InstructionMemory #(MEM_SIZE) UUT (
        .adr(adr),
        .Instruction(Instruction)
    );

    // Generación de estímulos
    initial begin
        // Realiza lecturas de instrucciones aleatorias
        repeat (50) begin
            adr = $random % MEM_SIZE; // Genera una dirección de memoria aleatoria
            #CLOCK_PERIOD; // Espera un ciclo de reloj
        end

        // Finaliza la simulación
        $finish;
    end

    // Simulación del reloj
    always #((CLOCK_PERIOD/2)) begin
        // Alternar el reloj cada periodo
    end

endmodule

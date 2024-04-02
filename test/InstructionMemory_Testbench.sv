`include "Clock.sv"
`include "pc.sv"
`include "Adder.sv"
`include "InstructionMemory.sv"
`include "ControlUnit.sv"
`include "RegisterBank.sv"
`include "Alu.sv"
`include "ShiftUnit.sv"
`include "Datamemory.sv"
`include "Multiplexor.sv"
`include "AluControl.sv"
`include "SumaC2.sv"
module InstructionMemory_Testbench;

    
    parameter CLOCK_PERIOD = 10;
    parameter MEM_SIZE = 16; 
    
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

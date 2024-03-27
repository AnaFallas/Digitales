`timescale 1ns / 1ns

module AluControl_tb;

    // Parámetros del módulo
    reg [1:0] ALUOp_in;
    reg [31:25] func7;
    reg [14:12] func3;
    wire [3:0] AluControl_out;

    // Instanciación del módulo bajo prueba
    AluControl uut (
        .ALUOp_in(ALUOp_in),
        .func7(func7),
        .func3(func3),
        .AluControl_out(AluControl_out)
    );

    // Generación de estímulos
    initial begin
        $dumpfile("alu_control_tb.vcd");
        $dumpvars(0, AluControl_tb);

        // Prueba 1: Caso 1 (12'b00_xxxxxxx_xxx)
        ALUOp_in = 2'b00;
        func7 = 8'bxxxxxxxx;
        func3 = 3'bxxx;
        #10;

        // Prueba 2: Caso 2 (12'b01_xxxxxxx_xxx)
        ALUOp_in = 2'b01;
        func7 = 8'bxxxxxxxx;
        func3 = 3'bxxx;
        #10;

        // Prueba 3: Caso 3 (12'b10_0000000_000)
        ALUOp_in = 2'b10;
        func7 = 8'b0000000;
        func3 = 3'b000;
        #10;

        // Prueba 4: Caso 4 (12'b10_0100000_000)
        ALUOp_in = 2'b10;
        func7 = 8'b0100000;
        func3 = 3'b000;
        #10;

        // Prueba 5: Caso 5 (12'b10_0000000_111)
        ALUOp_in = 2'b10;
        func7 = 8'b0000000;
        func3 = 3'b111;
        #10;

        // Prueba 6: Caso 6 (12'b10_0000000_110)
        ALUOp_in = 2'b10;
        func7 = 8'b0000000;
        func3 = 3'b110;
        #10;

        
        $finish;
    end
endmodule

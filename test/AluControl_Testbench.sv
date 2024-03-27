module AluControl_tb;

    // Parámetros
    parameter CLK_PERIOD = 10; // Periodo de reloj en unidades de tiempo

    // Señales del testbench
    logic [1:0] ALUOp_in;
    logic [31:25] func7;
    logic [14:12] func3;
    logic [3:0] AluControl_out;

    // Instanciación del módulo bajo prueba
    AluControl dut (
        .ALUOp_in(ALUOp_in),
        .func7(func7),
        .func3(func3),
        .AluControl_out(AluControl_out)
    );

    // Generación de estímulos
    initial begin
        // Inicialización de las entradas
        ALUOp_in = 2'b00;
        func7 = 7'bxxxxxxxx;
        func3 = 3'bxxx;

        // Test case 1
        #10;
        ALUOp_in = 2'b00;
        func7 = 7'b0000000;
        func3 = 3'b000;
        #10;
        $display("Case 1: AluControl_out = %b", AluControl_out);

        // Test case 2
        #10;
        ALUOp_in = 2'b10;
        func7 = 7'b0000000;
        func3 = 3'b111;
        #10;
        $display("Case 2: AluControl_out = %b", AluControl_out);

        // Test case 3
        #10;
        ALUOp_in = 2'b10;
        func7 = 7'b0000000;
        func3 = 3'b110;
        #10;
        $display("Case 3: AluControl_out = %b", AluControl_out);

        // Test case 4 (default)
        #10;
        ALUOp_in = 2'b11;
        func7 = 7'b0000000;
        func3 = 3'b000;
        #10;
        $display("Case 4 (default): AluControl_out = %b", AluControl_out);

        // Terminar simulación
        #10;
        $finish;
    end

endmodule


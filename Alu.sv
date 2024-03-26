module Alu(
    input logic [63:0] A, B,
    input logic [3:0] ALU_Sel,
    output logic [63:0] ALU_Out,
    output logic coutfin, // Carry-out de la suma
    output logic z // Salida de cero
);

    logic [63:0] ALU_Result;
    logic [63:0] Suma_Result; // Resultado de la suma

    assign ALU_Out = ALU_Result;

    // Definición de señales internas para la suma
    logic Suma_coutfin;
    logic [63:0] Suma_s;

    // Instanciación del módulo SumaC2
    SumaC2 #(
        .ANCHO(64) // Anchura de los operandos
    ) Suma_inst (
        .a(A),
        .b(B),
        .ci(1'b0), // Entrada ci para la suma (no hay carry-in)
        .s(Suma_s),
        .coutfin(Suma_coutfin)
    );

    always_comb
    begin
        // Selección de la operación en función de ALU_Sel
        case (ALU_Sel)
            4'b0000: ALU_Result = A & B;
            4'b0001: ALU_Result = A | B;
            4'b0010: ALU_Result = Suma_s; // Salida de la suma
            default: ALU_Result = 64'b0;
        endcase

        // Comprobación de si ALU_Result es cero
        if (ALU_Result == 64'b0)
            z = 1'b1;
        else
            z = 1'b0;
    end

    // Conexión de la salida coutfin con el carry-out de la suma
    assign coutfin = Suma_coutfin;

endmodule

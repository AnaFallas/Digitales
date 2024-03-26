module Control_Unit (
    input [6:0] OpCode,
    output reg Branch,
    output reg MemRead,
    output reg MemtoReg,
    output reg [1:0] Aluop,
    output reg MemWrite,
    output reg AluSrc,
    output reg RegWrite
);

    reg [8:0] outcome;

    always_comb begin
        {AluSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch} = outcome[8:2];
        Aluop = outcome[1:0];
    end

    always_ff @(OpCode) begin
        case(OpCode)
            7'b1xx0101x: outcome = 9'b000100010;
            7'b1111100: outcome = 9'b011110000;
            7'b1111100: outcome = 9'b110001000;
            7'b1011010: outcome = 9'b101000101;
            7'b0000000: outcome = 9'b000000000;
            default: outcome = 9'b0; // Default 
        endcase
    end
endmodule

module Control_Unit(OPcode,branch,Memread,MemtoReg,MemWrite, ALUScr, RegWrite, ALUOp_out);
input logic [6:0] OPcode;
output logic branch,Memread,MemtoReg,MemWrite, ALUScr; RegWrite;
output logic [1:0] ALUOp_out;

//always @(*) begin
//case(OPcode)
//R-type instruction
//7'b0110011; 
//begin
//branch <= 0;
//Memread  <= 0;
//MemtoReg  <= 0;
//MemWrite  <= 0;
//ALUScr     <= 0;
//RegWrite <=1;
//ALUOp_out  <= 2'b10;
//end
//endcase
//end
//endmodule 


always @(*) begin
    case(OPcode)
        // Instrucciones de tipo R
        7'b0110011: // R-type instruction
            begin
                branch    <= 0;
                Memread   <= 0;
                MemtoReg  <= 0;
                MemWrite  <= 0;
                ALUSrc    <= 0;
                RegWrite  <= 1;
                ALUOp_out <= 2'b10;
            end

        // Instrucciones de carga (load)
        7'b0000011: // Load instruction
            begin
                branch    <= 0;
                Memread   <= 1;
                MemtoReg  <= 1;
                MemWrite  <= 0;
                ALUSrc    <= 1;
                RegWrite  <= 1;
                ALUOp_out <= 2'b00;
            end

        // Instrucciones de almacenamiento (store)
        7'b0100011: // Store instruction
            begin
                branch    <= 0;
                Memread   <= 0;
                MemtoReg  <= 0;
                MemWrite  <= 1;
                ALUSrc    <= 1;
                RegWrite  <= 0;
                ALUOp_out <= 2'b00;
            end

        // Instrucciones de salto (branch)
        7'b1100011: // Branch instruction
            begin
                branch    <= 1;
                Memread   <= 0;
                MemtoReg  <= 0;
                MemWrite  <= 0;
                ALUSrc    <= 0;
                RegWrite  <= 0;
                ALUOp_out <= 2'b01;
            end

        default: // Por defecto, todas las señales a 0
            begin
                branch    <= 0;
                Memread   <= 0;
                MemtoReg  <= 0;
                MemWrite  <= 0;
                ALUSrc    <= 0;
                RegWrite  <= 0;
                ALUOp_out <= 2'b00;
            end
    endcase
end

endmodule
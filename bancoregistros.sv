module Register_File (clk,reset,Rs1,Rs2,Rd,Write_data,RegWrite,Read_data1,Read_data2);
input logic clk, reset, RegWrite 
input logic [19:15] Rs1;
input logic [24:20] Rs2;
input logic [11:7] Rd;

output logic [31:0] Read_data1, Read_data2;

logic [31:0] Registers [31:0];
integer k;


assing Read_data1 = Registers[Rs1];
assing Read_data2 = Registers[Rs2];

//always @ (posedge clk)
//begin 
//if (reset==1'b1)
//begin
//for (k = 0; k < 32; k= k+1)
//begin 
//Registers [k] = 31'h0
//end 
//end
//else if (RegWrite == 1'b1) Registers[Rd] = Write_data;
//end
//endmodule


///OTRA OPCIÓN CON UN RESET DIFERENTE 
always @(posedge clk or posedge reset) begin
        if (reset) begin
            // Si la señal de reinicio está activa, inicializa todos los registros a cero
            for (integer i = 0; i < 32; i = i + 1) begin
                Registers[i] <= 32'h0;
            end
        end else if (RegWrite) begin
            // Si la señal de escritura en registro está activa, escribe en el registro especificado
            Registers[Rd] <= Write_data;
        end
    end

endmodule
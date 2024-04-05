module DataMemory (
    input logic [7:0] adr,     // dirección de Memoria
    input logic [7:0] datain,  // contenido dirección de Memoria
    input logic w, r,
    input logic clk,
    output logic [7:0] dataout
);

    logic [7:0] MEMO[0:255]; // Tamaño de la memoria ajustado

    // Inicialización de la memoria
    initial begin
        integer i;
        for (i = 0; i < 256; i = i + 1) begin
            MEMO[i] = i;
        end
    end

    always_ff @(posedge clk) begin
        if (w) begin
            MEMO[adr] <= datain;
        end
    end

    assign dataout = (r) ? MEMO[adr] : 8'bz;

endmodule

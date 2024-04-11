module RegisterBank (
    input logic [4:0] register1,
    input logic [4:0] register2,
    input logic [4:0] register3,
    input logic [63:0] datain,
    input logic clk,
    input logic regwrite,
    output logic [63:0] dataout1,
    output logic [63:0] dataout2
);

    logic [63:0] Bank [0:31];
    initial begin
        for (int i = 0; i < 32; i = i + 1) begin
            Bank[i] = i;
        end
    end

    always_ff @(posedge clk) begin
        if (regwrite) begin
            Bank[register3] <= datain;
        end
    end

    assign dataout1 = Bank[register1];
    assign dataout2 = Bank[register2];

endmodule

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

   // logic [63:0] Bank [0:31];
    logic [31:0][63:0] Bank;
    /*initial begin
        for (int i = 0; i < 32; i = i + 1) begin
            Bank[i] = i;
        end
    end*/

    always_ff @(posedge clk) begin
        if (regwrite) begin
            Bank[register3] <= datain;
        end
    end

    assign dataout1 = (register1==5'd0)?64'd0:Bank[register1];
    assign dataout2 = (register2==5'd0)?64'd0:Bank[register2];

endmodule

module InstructionMemory_1(
    input logic reset,
    input logic [31:0] read_address,
    output logic [31:0] instruction_out
);

    logic [31:0] Memory [63:0];
    integer k;

    assign instruction_out = Memory[read_address];

    always_ff @(posedge reset) begin
        for (k=0; k<64; k=k+1) begin
            Memory[k] = 32'h00000000;
        end 
    end

endmodule

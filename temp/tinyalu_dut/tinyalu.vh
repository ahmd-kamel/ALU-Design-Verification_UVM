module tinyalu (
    input wire [7:0] A,
    input wire [7:0] B,
    input wire clk,
    input wire [2:0] op,
    input wire reset_n,
    input wire start,
    output reg done,
    output reg [15:0] result
);

    // Internal signals declarations
    wire done_aax;
    wire done_mult;
    wire [15:0] result_aax;
    wire [15:0] result_mult;
    reg start_single;
    reg start_mult;
    reg done_internal;

    // Instantiation of single_cycle module
    single_cycle add_and_xor (
        .A(A),
        .B(B),
        .clk(clk),
        .op(op),
        .reset_n(reset_n),
        .start(start_single),
        .done_aax(done_aax),
        .result_aax(result_aax)
    );

    // Instantiation of three_cycle multiplication module
    three_cycle mult (
        .A(A),
        .B(B),
        .clk(clk),
        .reset_n(reset_n),
        .start(start_mult),
        .done_mult(done_mult),
        .result_mult(result_mult)
    );

    // Start signal demux process
    always @(*) begin
        case (op[2])
            1'b0: begin
                start_single <= start;
                start_mult   <= 1'b0;
            end
            1'b1: begin
                start_single <= 1'b0;
                start_mult   <= start;
            end
            default: begin // edition
                start_single <= 1'b0;
                start_mult   <= 1'b0;
            end
        endcase
    end

    // Result mux process
    always @(*) begin
        case (op[2])
            1'b0: result <= result_aax;
            1'b1: result <= result_mult;
            default: result <= 16'hXXXX;
        endcase
    end

    // Done mux process
    always @(*) begin
        case (op[2])
            1'b0: done_internal <= done_aax;
            1'b1: done_internal <= done_mult;
            default: done_internal <= 1'bX;
        endcase
    end

    // Assign done
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            done <= 1'b0;
        else
            done <= done_internal;
    end

endmodule

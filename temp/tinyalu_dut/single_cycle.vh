module single_cycle (
    input wire [7:0] A,
    input wire [7:0] B,
    input wire clk,
    input wire [2:0] op,
    input wire reset_n,
    input wire start,
    output reg done_aax,
    output reg [15:0] result_aax
);

    // Internal signal declarations
    reg done_aax_int;

    // Single cycle operations
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            result_aax <= 16'h0000;
        end 
        else begin
            if (start) begin
                case (op)
                    3'b001: result_aax <= {8'b00000000, A} + {8'b00000000, B};
                    3'b010: result_aax <= {8'b00000000, A} & {8'b00000000, B};
                    3'b011: result_aax <= {8'b00000000, A} ^ {8'b00000000, B};
                    default: result_aax <= 16'h0000;
                endcase
            end
        end
    end

    // Done signal process
    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            done_aax_int <= 1'b0;
        else begin
            if (start && (op != 3'b000))
                done_aax_int <= 1'b1;
            else
                done_aax_int <= 1'b0;
        end
    end

    always @(posedge clk or negedge reset_n) begin
        if (!reset_n)
            done_aax <= 1'b0;
        else
            done_aax <= done_aax_int;
    end

endmodule

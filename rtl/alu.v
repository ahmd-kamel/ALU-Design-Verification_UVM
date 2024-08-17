module alu #(parameter DATA_WIDTH = 32, OP = 3)
(
    input wire start,
    input wire clk,
    input wire reset_n,
    input wire [DATA_WIDTH - 1 : 0] A,
    input wire [DATA_WIDTH - 1 : 0] B,
    input wire [OP - 1 : 0] op,
    output reg [DATA_WIDTH - 1 : 0] result,
    output reg done
);

  localparam AND = 3'b000;  //0
  localparam OR  = 3'b001;  //1
  localparam ADD = 3'b010;  //2
  localparam NOP = 3'b011;  //3
  localparam SUB = 3'b100;  //4
  localparam MUL = 3'b101;  //5
  localparam SLT = 3'b110;  //6

  reg done_reg;

  always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
      result <= 32'h00000000;
    end
    else begin
      if(start) begin
        case (op)
          AND: result <=  A & B;
          OR : result <=  A | B;
          ADD: result <=  A + B;
          SUB: result <=  A - B;
          MUL: result <=  A * B;
          SLT: result <= (A < B) ? 32'b1 : 32'b0;
          default: result <= 32'h00000000;
        endcase
      end
    end
  end

  always @(posedge clk or negedge reset_n) begin
    if(!reset_n) begin
      done_reg <= 1'b0;
    end
    else begin
      if(start && (op != NOP)) begin
        done_reg <= 1'b1;
      end
      else begin
        done_reg <= 1'b0;
      end
    end
  end

  always @(posedge clk or negedge reset_n) begin
    if (!reset_n) begin
      done <= 1'b0;
    end
    else begin
      done <= done_reg;
    end
  end
    
endmodule
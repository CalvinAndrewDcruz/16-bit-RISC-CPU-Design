//===========================
// 2-to-1 MUX
//===========================

module mux2 #(parameter WIDTH=16)(
    input [WIDTH-1:0] a,
    input [WIDTH-1:0] b,
    input sel,
    output [WIDTH-1:0] out
);
    assign out = sel ? b : a;
endmodule

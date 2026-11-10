// Magnitude Comparator 2-Bit
// A_gt_B = A1·B1' + A0·B1'·B0' + A1·A0·B0'
// A_eq_B = (A1 XNOR B1) · (A0 XNOR B0)
// A_lt_B = A1'·B1 + A1'·A0'·B0 + A0'·B1·B0
module comparator_2bit (
    input  wire A1, A0,
    input  wire B1, B0,
    output wire A_gt_B,
    output wire A_eq_B,
    output wire A_lt_B
);
    assign A_gt_B = (A1 & ~B1) | (A0 & ~B1 & ~B0) | (A1 & A0 & ~B0);
    assign A_eq_B = ~(A1 ^ B1) & ~(A0 ^ B0);
    assign A_lt_B = (~A1 & B1) | (~A1 & ~A0 & B0) | (~A0 & B1 & B0);
endmodule

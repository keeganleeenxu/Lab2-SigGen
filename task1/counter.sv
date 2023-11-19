module counter #(
    parameter WIDTH = 8
)(
    //  interface signals
    input  logic             clk,    //clock
    input  logic             rst,    //reset
    input  logic             en,     //counter enable
    input  logic [WIDTH-1:0] incr,   //increment for the counter
    output logic [WIDTH-1:0] count   //count output (width-1):0 -> specifying the length of the bits
);

always_ff @ (posedge clk)
    if (rst)        count <= {WIDTH{1'b0}};
    else if (en)    count <= count + incr;
    else            count <= count;
                              // instead of incrementing 1 when enable is high, 
                              // we will now increment by the input value incr
    
endmodule

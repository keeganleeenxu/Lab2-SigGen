module sinegen #(
    parameter   A_WIDTH = 8,
                D_WIDTH = 8
)(
    // interface signals
    input  logic                    clk,        //  clock
    input  logic                    rst,        //  reset
    input  logic                    en,         //  enable
    input  logic    [A_WIDTH-1:0]   ofst,       //  offset for addr2
    input  logic    [D_WIDTH-1:0]   incr,       //  increment for addr counter
    output logic    [D_WIDTH-1:0]   dout1,      //  output data1
    output logic    [D_WIDTH-1:0]   dout2       //  output data2
);

    logic [A_WIDTH-1:0]             address;    //  interconnect wire
        

counter addrCounter (
    .clk (clk),
    .rst (rst),
    .en (en),
    .incr (incr),
    .count (address)
);

rom2ports sineRom (
    .clk (clk),
    .addr1 (address),
    .addr2 (address + ofst),
    .dout1 (dout1),
    .dout2 (dout2)
);

endmodule

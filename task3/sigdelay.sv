module sigdelay #(
    parameter   A_WIDTH = 9,
                D_WIDTH = 8
)(
    // interface signals
    input  logic                    clk,             //  clock
    input  logic                    rst,             //  reset
    input  logic                    en,              //  enable
    input  logic    [A_WIDTH-1:0]   offset,
    input  logic                    wr,              //  write enable
    input  logic                    rd,              //  read enable
    input  logic    [D_WIDTH-1:0]   incr,            //  increment for addr counter
    input  logic    [D_WIDTH-1:0]   mic_signal,      //  input data
    output logic    [D_WIDTH-1:0]   delayed_signal   //  output data
);

    logic   [A_WIDTH-1:0]       address;    //interconnected wire

counter addrCounter (
    .clk(clk),
    .rst (rst),
    .en (en),
    .incr (incr),
    .count (address)
);

ram2ports voiceRam  (
    .clk(clk),
    .wr_en(wr),
    .rd_en(rd),
    .wr_addr(address + offset),
    .rd_addr(address),
    .din(mic_signal),
    .dout(delayed_signal)
);

endmodule

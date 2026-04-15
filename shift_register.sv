module shift_register(
    input wire clk,
    input wire rst,
    input wire data,
    input wire wr_en,
    output reg[31:0] out
);

parameter DIRECTION = 1;

always @ (posedge clk) begin
    if (rst)
        out <= 32'b0;
    else if (wr_en) begin
        if (!DIRECTION)
            out <= {out[30:0], data};
        else    
            out <= {data, out[31:1]};
    end


end

endmodule
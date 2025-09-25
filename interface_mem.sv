interface int_mem (input bit clk,res);

  bit wr_rd;
  bit [`ADDR_WIDTH-1:0] addr;
  bit [`WIDTH-1:0] wdata;
  bit [`WIDTH-1:0] rdata;
  bit ready;
  bit valid;
  
  clocking drv_cb @ (posedge clk);
    default input #0 output #1;
    input rdata;
    input ready;
    output addr;
    output wr_rd;
    output valid;
    output wdata;
  endclocking
  
  clocking mon_cb @ (posedge clk);
    default input #1;
    input rdata;
    input ready;
    input addr;
    input wr_rd;
    input valid;
    input wdata;
  endclocking
  
endinterface
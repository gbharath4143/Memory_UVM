module top;

  bit clk,res;

  int_mem pif(clk,res);

  memory #(`WIDTH,`DEPTH, `ADDR_WIDTH) dut(
    .clk(pif.clk),
    .res(pif.res),
    .wr_rd(pif.wr_rd),
    .addr(pif.addr),
    .wdata(pif.wdata),
    .rdata(pif.rdata),
    .valid(pif.valid),
    .ready(pif.ready)
  );

  always #5 clk=~clk;

  initial begin
    $dumpfile("dump.vcd"); 
    $dumpvars;
  end

  initial begin
    run_test("test_mem");
  end  

endmodule
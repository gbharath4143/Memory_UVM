class drv_mem extends uvm_driver #(txn_mem);

  `uvm_component_utils(drv_mem)

  `NEW_COMP

  virtual int_mem vif;

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    vif=$root.top.pif;
  endfunction

  task run_phase(uvm_phase phase);
    forever begin
      seq_item_port.get_next_item(req);
      drive_to_dut();
      req.print();
      seq_item_port.item_done();
    end
  endtask

  task drive_to_dut();
    @(vif.drv_cb);
    vif.addr<=req.addr;
    vif.wr_rd<=req.wr_rd;
    vif.wdata<=req.wdata;
    vif.valid<=1;
    wait(vif.ready==1)
    req.rdata=vif.rdata;
    @(vif.drv_cb);
    vif.wr_rd<=0;
    vif.addr<=0;
    vif.wdata<=0;
    vif.valid<=0;
  endtask

endclass
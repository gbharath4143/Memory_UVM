class mon_mem extends uvm_monitor;

  `uvm_component_utils(mon_mem)

  `NEW_COMP

  txn_mem txn;
  
  virtual int_mem vif;
  
  uvm_analysis_port#(txn_mem) analysis_port;

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    vif=$root.top.pif;
    analysis_port = new("analysis_port",this);
  endfunction

  task run_phase(uvm_phase phase);
    forever begin
        @(posedge vif.clk);
        if(vif.ready && vif.valid) begin
          txn=txn_mem::type_id::create("txn");
          txn.wr_rd = vif.wr_rd;
          txn.addr  = vif.addr;
          txn.wdata = vif.wdata;
          txn.rdata = vif.rdata;
          txn.valid = vif.valid;
          txn.ready = vif.ready;
          analysis_port.write(txn);
        end
      end
  endtask
  
endclass
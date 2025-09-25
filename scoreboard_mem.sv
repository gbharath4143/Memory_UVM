class sbd_mem extends uvm_scoreboard;
  
  `uvm_component_utils(sbd_mem)
  
  `NEW_COMP
  
  uvm_analysis_imp # (txn_mem,sbd_mem) analysis_imp;
  
  bit [`WIDTH-1:0] aa [*];

  txn_mem txn;
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    analysis_imp=new("analysis_imp",this);
  endfunction
 
  virtual function void write(txn_mem txn);
    forever begin
      if(txn.wr_rd) aa[txn.addr]=txn.wdata;
      else begin
        if (aa[txn.addr]==txn.rdata) common_mem::sbd_s++;
        else common_mem::sbd_f++;
      end
    end
  endfunction
  
endclass
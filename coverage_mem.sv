class cov_mem extends uvm_subscriber #(txn_mem);

  `uvm_component_utils(cov_mem)

  `NEW_COMP

  bit [`WIDTH-1:0] aa [*];

  txn_mem txn;

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
  endfunction

  virtual function void write(txn_mem t);
    
  endfunction

endclass
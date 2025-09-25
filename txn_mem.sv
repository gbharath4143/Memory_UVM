class txn_mem extends uvm_sequence_item;

  rand bit wr_rd;
  bit res;
  bit valid;
  rand bit [`ADDR_WIDTH-1:0] addr;
  rand bit [`WIDTH-1:0] wdata;
  bit [`WIDTH-1:0] rdata;
  bit ready;
  
  `uvm_object_utils_begin(txn_mem)
  
  `uvm_field_int(wr_rd,UVM_ALL_ON)
  `uvm_field_int(addr,UVM_ALL_ON)
  `uvm_field_int(wdata,UVM_ALL_ON)
  `uvm_field_int(rdata,UVM_ALL_ON)
  
  `uvm_object_utils_end

  `NEW_OBJ

endclass
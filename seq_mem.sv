class seq_mem extends uvm_sequence #(txn_mem);

  `uvm_object_utils(seq_mem)

  `NEW_OBJ

  bit[`ADDR_WIDTH-1:0] temp [$];

  task body;
    repeat(`DEPTH)begin
      `uvm_do_with(req,{req.wr_rd==1;})
      temp.push_back(req.addr); 
    end

    repeat(`DEPTH)begin
      `uvm_do_with(req,{req.wr_rd==0;req.wdata==0;req.addr==temp.pop_front();})
    end

  endtask

endclass
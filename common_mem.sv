`define WIDTH 8
`define DEPTH 64
`define ADDR_WIDTH $clog2(`DEPTH)

`define NEW_COMP \
function new(string name="",uvm_component parent=null); \
  super.new(name,parent); \
endfunction

`define NEW_OBJ \
function new(string name=""); \
  super.new(name); \
endfunction

class common_mem;
  static int sbd_s;
  static int sbd_f;
endclass
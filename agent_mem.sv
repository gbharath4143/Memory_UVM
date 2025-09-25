class agent_mem extends uvm_agent;

  sqr_mem sqr;
  drv_mem drv;
  mon_mem mon;
  cov_mem cov;
  sbd_mem sbd;

  `uvm_component_utils(agent_mem)

  `NEW_COMP

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    sqr=sqr_mem::type_id::create("sqr",this);
    drv=drv_mem::type_id::create("drv",this);
    mon=mon_mem::type_id::create("mon",this);
    cov=cov_mem::type_id::create("cov",this);
    sbd=sbd_mem::type_id::create("sbd",this);
  endfunction

  function void connect_phase(uvm_phase phase);
    drv.seq_item_port.connect(sqr.seq_item_export);
    mon.analysis_port.connect(cov.analysis_export);    
    mon.analysis_port.connect(sbd.analysis_imp);    
  endfunction

endclass
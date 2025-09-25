class test_mem extends uvm_test;

  `uvm_component_utils(test_mem)

  env_mem env;

  `NEW_COMP

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env=env_mem::type_id::create("env",this);
  endfunction

  function void end_of_elaboration_phase(uvm_phase phase);
    uvm_top.print_topology();
  endfunction

  task run_phase(uvm_phase phase);
    seq_mem seq_rand;
    phase.raise_objection(this);
    seq_rand=seq_mem::type_id::create("seq_rand");
    seq_rand.start(env.age.sqr);
    phase.phase_done.set_drain_time(this, 100);
    phase.drop_objection(this);
  endtask

  function void report_phase(uvm_phase phase);
    super.report_phase(phase);
    `uvm_info("REPORT", $sformatf("SCOREBOARD PASS COUNT  = %0d", common_mem::sbd_s), UVM_LOW)
    `uvm_info("REPORT", $sformatf("SCOREBOARD FAIL COUNT  = %0d", common_mem::sbd_f), UVM_LOW)
  endfunction

endclass
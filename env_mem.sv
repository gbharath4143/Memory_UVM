class env_mem extends uvm_env;

  agent_mem age;

  `uvm_component_utils(env_mem)

  `NEW_COMP

  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    age=agent_mem::type_id::create("age",this);
  endfunction

endclass
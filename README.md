# UVM Memory Verification Environment  

This repository contains a **Universal Verification Methodology (UVM)** based testbench for verifying a **memory module** in SystemVerilog.  

## 📌 Project Overview  
- **Design Under Test (DUT):** A simple synchronous memory (`memory.sv`) with configurable width and depth.  
- **Verification Environment:** Built using UVM methodology with standard components:  
  - **Agent (`agent_mem`)** → sequencer, driver, monitor  
  - **Sequence (`seq_mem`)** → generates read/write transactions  
  - **Scoreboard (`sbd_mem`)** → compares DUT outputs with expected results  
  - **Coverage (`cov_mem`)** → placeholder for functional coverage  
  - **Environment (`env_mem`)** → integrates the agent  
  - **Test (`test_mem`)** → configures and runs the environment  

## 🗂 Repository Structure  
```
.
├── combine.txt        # Full combined SystemVerilog UVM testbench + DUT
├── memory             # DUT: synchronous memory module
├── txn_mem            # Transaction class (sequence item)
├── seq_mem            # Sequence generating transactions
├── sqr_mem            # Sequencer
├── drv_mem            # Driver
├── mon_mem            # Monitor
├── sbd_mem            # Scoreboard
├── cov_mem            # Coverage subscriber
├── agent_mem          # Agent (sqr, drv, mon, cov, sbd)
├── env_mem            # Environment
├── test_mem           # Test class
└── top                # Top module (instantiates DUT + UVM environment)
```

## ⚙️ Features  
- Randomized **read/write transactions**.  
- Scoreboard maintains a reference model (`aa` array).  
- Self-checking: reports **PASS/FAIL counts** at end of simulation.  
- Generates **waveform dump (`dump.vcd`)**.  

## ▶️ How to Run  
1. Clone this repo.  
2. Compile and simulate using any SystemVerilog/UVM simulator (e.g., Questa, VCS, Xcelium):  
   ```sh
   vlog combine.txt
   vsim -c top -do "run -all"
   ```  
   *(Commands may vary depending on simulator)*  
3. View results:  
   - Check **UVM logs** for scoreboard pass/fail report.  
   - Open **dump.vcd** in GTKWave for waveform analysis.  

## 📊 Example Output  
At the end of simulation, you will see something like:  
```
UVM_INFO test_mem.sv(50) @ 100: uvm_test_top [REPORT] SCOREBOARD PASS COUNT  = 64
UVM_INFO test_mem.sv(51) @ 100: uvm_test_top [REPORT] SCOREBOARD FAIL COUNT  = 0
```  

## 🚀 Future Improvements  
- Add functional coverage (`cov_mem`).  
- Randomized reset and corner-case testing.  
- Extend sequences with error injection.  

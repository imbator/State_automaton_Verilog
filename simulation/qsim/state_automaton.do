onerror {quit -f}
vlib work
vlog -work work state_automaton.vo
vlog -work work state_automaton.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.state_automaton_vlg_vec_tst
vcd file -direction state_automaton.msim.vcd
vcd add -internal state_automaton_vlg_vec_tst/*
vcd add -internal state_automaton_vlg_vec_tst/i1/*
add wave /*
run -all

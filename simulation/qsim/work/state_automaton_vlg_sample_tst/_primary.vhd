library verilog;
use verilog.vl_types.all;
entity state_automaton_vlg_sample_tst is
    port(
        CLOCK_50        : in     vl_logic;
        rst             : in     vl_logic;
        x               : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end state_automaton_vlg_sample_tst;

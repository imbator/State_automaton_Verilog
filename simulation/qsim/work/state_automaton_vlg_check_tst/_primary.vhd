library verilog;
use verilog.vl_types.all;
entity state_automaton_vlg_check_tst is
    port(
        currentState    : in     vl_logic_vector(2 downto 0);
        y               : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end state_automaton_vlg_check_tst;

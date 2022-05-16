library verilog;
use verilog.vl_types.all;
entity state_automaton is
    port(
        x               : in     vl_logic;
        rst             : in     vl_logic;
        CLOCK_50        : in     vl_logic;
        y               : out    vl_logic;
        currentState    : out    vl_logic_vector(2 downto 0)
    );
end state_automaton;

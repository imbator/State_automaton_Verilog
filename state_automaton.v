module state_automaton(input x, rst, shift, CLOCK_50, output [7:0] y, output reg [9:0] diods, output [7:0] HEX3, output [7:0] HEX2, output [7:0] HEX1, output [7:0] HEX0, output reg [2:0] currentState, output reg [9:0] custom_register);
parameter [1:0] reset = 0;
parameter state1 = 1, state11 = 2, state110 = 3, state1100 = 4, state11001 = 5, state110011 = 6, state1100110 = 7;

initial begin
	currentState = reset;
end

assign HEX3 = 7'b1111111;
assign HEX2 = 7'b1111111;
assign HEX1 = 7'b1111111;
assign HEX0 = 7'b1111111;

assign y[7:0] = {8{currentState == state1100110}};
assign pressed = ~ shift;
assign reset_key = ~ rst;

always@(posedge pressed or posedge reset_key) begin
	if (reset_key) begin
	      currentState = reset;
		 	custom_register = 10'b0;
			diods[9:0] = custom_register[9:0];
		end
	else begin
	custom_register ={custom_register[8:0], x};
	diods[9:0] = custom_register[9:0];
	case(currentState)
	reset:
		begin
			if (x == 1'b1) currentState = state1;
			else currentState = reset;
		end
	state1:
		begin
			if (x == 1'b1) currentState = state11;
			else currentState = reset;
		end
	state11:
		begin
			if (x == 1'b0) currentState = state110;
			else currentState = state1;
		end
	state110:
		begin
			if (x == 1'b0) currentState = state1100;
			else currentState = state1;
		end
	state1100:
		begin
			if (x == 1'b1) currentState = state11001;
			else currentState = reset;
		end
	state11001:
		begin
			if (x == 1'b1) currentState = state110011;
			else currentState = reset;
		end
	state110011:
		begin
			if (x == 1'b0) currentState = state1100110;
			else currentState = state1;
		end
	state1100110:
		begin
			if (x == 1'b1) currentState = 1;
			else currentState = reset;
		end
	default currentState = reset;
	endcase
end
end
endmodule	

//Zero detector using Moore FSM style
module zero_detect_moore(
			 output [1: 0] y,
			 input x, clk, rst
			 );

   reg [1: 0] 		       state;
   parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;

   always@(posedge clk, negedge rst)
     if(rst) state <= S0;
     else case(state)
	    S0: if(~x) state <= S1;
	    else state <= S0;

	    S1: if(x) state <= S2;
	    else state <= S3;

	    S2: if(~x) state <= S3;
	    else state <= S2;

	    S3: if(~x) state <= S0;
	    else state <= S3;
	  endcase // case (state)

   assign y = state;

endmodule // zero_detect_moore

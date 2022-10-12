module mux16_4_32bit(out, s, in0, in1,in2,in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15);
	input[31:0] in0, in1,in2, in3,in4,in5,in6,in7,in8,in9,in10,in11,in12,in13,in14,in15;
	output[31:0] out;
	input[3:0] s;
	
	wire[31:0] w1,w2,w3,w4;
	
	mux4_2_32bit m1 ( w1, s[1:0], in0,in1,in2,in3);
	mux4_2_32bit m2 ( w2, s[1:0], in4,in5,in6,in7);
	mux4_2_32bit m3 ( w3, s[1:0], in8,in9,in10,in11);
	mux4_2_32bit m4 ( w4, s[1:0], in12,in13,in14,in15);
	
	mux4_2_32bit m5 ( out, s[3:2], w1, w2, w3, w4);
	
endmodule 
module regfile (
    clock,
    ctrl_writeEnable,
    ctrl_reset, ctrl_writeReg,
    ctrl_readRegA, ctrl_readRegB, data_writeReg,
    data_readRegA, data_readRegB
);

   input clock, ctrl_writeEnable, ctrl_reset;
   input [4:0] ctrl_writeReg, ctrl_readRegA, ctrl_readRegB;
   input [31:0] data_writeReg;

   output [31:0] data_readRegA, data_readRegB;
	
	wire[31:0] w[31:0];
	wire[31:0] en;
	//write write_reg (clock, ctrl_writeEnable, ctrl_reset, ctrl_writeReg, data_writeReg,w);

	//write
	
	genvar i;
	generate
		for(i=0; i<32; i = i+1) begin : write
			assign en[i] = i == ctrl_writeReg? ctrl_writeEnable: 1'b0;
			reg_32 rew (w[i], data_writeReg, clock, en[i], ctrl_reset);
		end
	endgenerate  

	//read1
	
	//mux2_1_32bit m (data_readRegA,ctrl_readRegA[0],w[0],w[1]);
	
	//read1
	
	genvar j;
	generate
		for(j=0; j<32; j = j+1) begin : read1
			assign data_readRegA = j == ctrl_readRegA ? w[j] : 31'bz;
		end
	endgenerate 
	
	//read2
	
	genvar k;
	generate
		for(k=0; k<32; k = k+1) begin : read2
			assign data_readRegB = k == ctrl_readRegB ? w[k] : 31'bz;
		end
	endgenerate 
	
	
	

endmodule 
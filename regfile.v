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

   /* YOUR CODE HERE */
	
	//wire
	genvar i;
	generate
		for(i=0; i<32; i = i+1) begin : write
			reg_32 rew (w[i], data_writeReg, clock, ctrl_writeEnable, ctrl_reset);
		end
	endgenerate  

	//read1
	

endmodule
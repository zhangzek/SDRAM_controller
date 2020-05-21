module sdram_top_tb;

reg 			S_CLK  				;
reg 			S_RSTn				;
	
//----------------------------
wire         	sdram_clk  			;
wire     		sdram_cke  			;
wire     		sdram_cs_n 			;
wire     		sdram_cas_n			;
wire     		sdram_ras_n			;
wire     		sdram_we_n 			;
wire  [1:0]  	sdram_bank 			;
wire  [11:0] 	sdram_addr 			;
wire  [1:0]  	sdram_dqm  			;	
wire  [15:0] 	sdram_dq   			;

reg wr_trig;
reg rd_trig;

//------------------------------
initial
 	begin
		wr_trig <= 0;
		rd_trig <= 0;
		#205000 wr_trig <= 1;
		#20 wr_trig <= 0;
		#126500 rd_trig <= 1;
		#20 rd_trig <= 0;
	end



initial
begin
	S_CLK = 1;
	S_RSTn <= 0;
	#100
	S_RSTn <= 1;
end

always #10 S_CLK = ~ S_CLK;

defparam sdram_model_plus_inst.addr_bits = 12;
defparam sdram_model_plus_inst.data_bits = 16;
defparam sdram_model_plus_inst.col_bits  = 9;
defparam sdram_model_plus_inst.mem_sizes = 2*1024*1024;




assign sdram_dqm  = 2'b00;
assign sdram_bank = 2'b00;

sdram_top sdram_top_inst
							(
								//global clock
								.S_CLK        	(S_CLK       		),
								.S_RSTn     	(S_RSTn    		),
								 
								//user interface
								.sdram_clk    	(sdram_clk 			),
								.sdram_cke  	(sdram_cke  		),   
								.sdram_cs_n 	(sdram_cs_n 		), 
								.sdram_cas_n	(sdram_cas_n		),
								.sdram_ras_n	(sdram_ras_n		),
								.sdram_we_n 	(sdram_we_n 		), 
								.sdram_bank   	(sdram_bank			),
								.sdram_addr   	(sdram_addr			),
								.sdram_dqm    	(sdram_dqm 			),	
								.sdram_dq   	(sdram_dq			),
								.wr_trig		(wr_trig 			),
								.rd_trig		(rd_trig			)
							);

sdram_model_plus sdram_model_plus_inst
							(
								.Dq   	      	(sdram_dq 			), 
								.Addr 	      	(sdram_addr  		), 
								.Ba   	      	(sdram_bank  		), 
								.Clk  	      	(sdram_clk   		), 
								.Cke  	      	(sdram_cke			), 
								.Cs_n 	      	(sdram_cs_n 		), 
								.Ras_n	      	(sdram_ras_n		), 
								.Cas_n	      	(sdram_cas_n		), 
								.We_n 	      	(sdram_we_n 		), 
								.Dqm  	      	(sdram_dqm        	),
								.Debug	      	(1'b1             	)
							);	


endmodule	
	
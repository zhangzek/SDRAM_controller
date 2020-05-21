module sdram_top(
	//system clock
	input               	S_CLK      				,
	input               	S_RSTn    				,
							
	//SDRAM interface						
	output wire         	sdram_clk  				,
	output wire     		sdram_cke  				,  
	output wire     		sdram_cs_n 				,  
	output wire     		sdram_cas_n				,
	output wire     		sdram_ras_n				,
	output wire     		sdram_we_n 				, 	
	output wire  [1:0]  	sdram_bank 				,
	output reg   [11:0] 	sdram_addr 				,
	output wire  [1:0]  	sdram_dqm  				,	
	inout        [15:0] 	sdram_dq                ,

	input					wr_trig					,
	input 					rd_trig
);
reg [ 3:0] sd_cmd;


//==================ARBIT FSM state=================//
localparam IDLE 	= 5'b0_0001;
localparam ARBIT 	= 5'b0_0010;
localparam AREF 	= 5'b0_0100;
localparam WRITE 	= 5'b0_1000;
localparam READ		= 5'b1_0000;

reg [4:0] state;


//==================init interface==================//
wire        flag_init_end;
wire [3:0]  init_cmd;
wire [11:0] init_addr;





//=================Arefersh interface===============//
reg 		ref_en;
wire 		ref_req;
wire 		flag_ref_end;

wire [ 3:0] ref_cmd;
wire [11:0] ref_addr;



//==================write interface==================//
reg  		wr_en 		  ;
wire 		wr_req 	  ;
wire 		flag_wr_end  ;
wire [ 3:0] wr_cmd 	;
wire [11:0] wr_addr 	;
wire [ 1:0] wr_bank_addr;
wire [15:0] wr_data;



//==================read interface==================//
reg 		rd_en;
wire 		rd_req;
wire 		flag_rd_end;

wire [ 3:0]	rd_cmd;
wire [11:0]	rd_addr;
wire [ 1:0]	rd_bank_addr;


//=====================FSM=======================//
always @(posedge S_CLK or negedge S_RSTn) 
begin
	if (!S_RSTn) 
		begin
			state <= IDLE;

		end
	else case (state) 
			IDLE :	if (flag_init_end)
						state <= ARBIT;
					else 
						state <= IDLE;
			ARBIT:	if (ref_en)
						state <= AREF;
					else if (wr_en)
						state <= WRITE;
					else if (rd_en)
						state <= READ;
					else 
						state <= ARBIT;
			AREF:	if (flag_ref_end)
						state <= ARBIT;
					else 
						state <= AREF;
			WRITE:	if (flag_wr_end)
						state <= ARBIT;
					else
						state <= WRITE;
			READ:	if (flag_rd_end)
						state <= ARBIT;
					else
						state <= READ; 
			default: state <= IDLE;
		endcase


end

//sd_cmd
//sd_addr
always @(*) 
begin
	case(state)
		IDLE	:begin
					sd_cmd <= init_cmd;
					sdram_addr <= init_addr;
				end
		AREF 	:begin
					sd_cmd <= ref_cmd;
					sdram_addr <= ref_addr;
				end
		WRITE 	:begin
					sd_cmd <= wr_cmd;
					sdram_addr <= wr_addr;
				end
		READ 	:begin
					sd_cmd <= rd_cmd;
					sdram_addr <= rd_addr;
				end
		default	:begin
					sd_cmd <= 4'b0111;//NOP command
					sdram_addr <= 0;
				end
	endcase
end



//ref_en
always @(posedge S_CLK or negedge S_RSTn) 
begin
	if (!S_RSTn) 
		begin
			ref_en <= 0;

		end
	else if (state == ARBIT && ref_req == 1) 
		begin
			ref_en <= 1;
		end
	else 
		begin
			ref_en <= 0;
		end
end

//wr_en
always @(posedge S_CLK or negedge S_RSTn) 
begin
	if (!S_RSTn) 
		begin
			wr_en <= 0;
		end
	else if (state == ARBIT && ref_req == 0 && wr_req == 1) 
		begin
			wr_en <= 1;
		end
	else 
		begin
			wr_en <= 0;
		end
end

//rd_en
always @(posedge S_CLK or negedge S_RSTn) 
begin
	if (!S_RSTn) 
		begin
			rd_en <= 0;
		end
	else if (state == ARBIT && ref_req == 0 && rd_req == 1 && wr_req == 0) 
		begin
			rd_en <= 1;
		end
	else 
		begin
			rd_en <= 0;
		end
end




assign sdram_cke  = 1'b1;
assign sdram_clk  = ~ S_CLK;
assign sdram_dqm  = 2'b00;
//assign sdram_addr = (state == IDLE) ? init_addr :ref_addr;
assign {sdram_cs_n, sdram_ras_n,sdram_cas_n,sdram_we_n} = sd_cmd;
assign sdram_dq = (state == WRITE) ? wr_data : {16{1'bz}};
assign sdram_bank = (state == WRITE) ? wr_bank_addr : rd_bank_addr;






//=========================inst===========================//
sdram_init sdram_init_inst(
								//system clock	
								.CLK   		(S_CLK         	),
								.RSTn    	(S_RSTn      	),
									
								//sdram init interface		
								.cmd_reg    	(init_cmd     	),
								.sdram_addr  	(init_addr    	),	
								.flag_init_end	(flag_init_end	)
						  );
sdram_aref sdram_aref_inst (
								.CLK			(S_CLK         	),						
								.RSTn			(S_RSTn        	),

								.ref_en 		(ref_en        	),						
								.flag_init_end	(flag_init_end 	),
								.ref_req		(ref_req        ),						
								.flag_ref_end	(flag_ref_end 	),					
								
								.aref_cmd		(ref_cmd        ),					
								.sdram_addr		(ref_addr       )
							);
sdram_write sdram_write_inst(
								.CLK 			(S_CLK 			),
								.RSTn 			(S_RSTn 		),
								.wr_en 			(wr_en 			),
								.wr_req 		(wr_req 		),
								.flag_wr_end 	(flag_wr_end 	),
								.wr_cmd 		(wr_cmd 		),
								.wr_addr 		(wr_addr 		),
								.bank_addr 		(wr_bank_addr 	),
								.wr_trig 		(wr_trig 		),
								.ref_req 		(ref_req 		),
								.wr_data		(wr_data        )
							);
sdram_read sdram_read_inst(
								.CLK 			(S_CLK),
								.RSTn 			(S_RSTn),
								.rd_en 			(rd_en),
								.rd_req 		(rd_req),
								.flag_rd_end 	(flag_rd_end),
								.rd_cmd 		(rd_cmd),
								.rd_addr 		(rd_addr),
								.bank_addr 		(rd_bank_addr),
								.rd_trig 		(rd_trig),
								.ref_req 		(ref_req)
							);

endmodule  
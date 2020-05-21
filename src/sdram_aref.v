module sdram_aref(

	input 						CLK									,
	input 						RSTn								,

	input 						ref_en 								,
	input 						flag_init_end						,
	output reg   				ref_req								,
	output wire 				flag_ref_end						,

	output reg  [ 3:0]    		aref_cmd							,
	output wire [11:0] 			sdram_addr							
);

localparam DELAY_15US = 749;

//COMMAND
localparam NOP 				= 4'b0111 	;
localparam PERCHARGE 		= 4'b0010 	;			
localparam AREFRESH 		= 4'b0001 	;			
//localparam LOAD_REGISTER 	= 4'b0000 	;


reg [ 3:0] 	cmd_cnt;//command counter
reg [ 9:0] 	ref_cnt;//750 need 10bit
reg 		flag_ref;//inside refresh signal


//ref_cnt
always @(posedge CLK or negedge RSTn) 
begin
	if (!RSTn) 
		begin
			ref_cnt <= 0;
		end
	else if (ref_cnt == DELAY_15US) 
		begin
			ref_cnt <= 0;
		end
	else 
		begin
			ref_cnt <= ref_cnt + 1;
		end
end

//15us push reg_req
//assign ref_req = (ref_cnt >= DELAY_15US) ? 1 : 0;
always @(posedge CLK or negedge RSTn) 
begin
	if (!RSTn) 
		begin
			ref_req <= 0;
		end
	else if (ref_en)
	 	begin
			ref_req <= 0;
		end
	else if (ref_cnt >= DELAY_15US) 
		begin
			ref_req <= 1;
		end
end

//flag_ref
always @(posedge CLK or negedge RSTn) 
begin
	if (!RSTn) 
		begin
			flag_ref <= 0;		
		end
	else if (ref_en) 
		begin
			flag_ref <= 1;
		end
	else if (flag_ref_end)
		begin
			flag_ref <= 0;
		end
end

//flag_ref_end
assign flag_ref_end = (cmd_cnt >= 4'd3) ? 1 : 0;

//cmd_cnt
always @(posedge CLK or negedge RSTn) 
begin
	if (!RSTn) 
		begin
			cmd_cnt <= 0;		
		end
	else if (flag_ref) 
		begin
			cmd_cnt <= cmd_cnt + 1;
		end
	else 
		begin
			cmd_cnt <= 0;
		end
end

//command
always @(posedge CLK or negedge RSTn) 
begin
	if (!RSTn) 
		begin
			aref_cmd <= NOP;
		end
	else 
		case(cmd_cnt)
		1:		aref_cmd <= PERCHARGE;
		2:		aref_cmd <= AREFRESH;
		default:aref_cmd <= NOP;

		endcase
end
//always @(posedge CLK or negedge RSTn) 
//begin
//	if (!RSTn) 
//		begin
//			aref_cmd <= NOP;
//		end
//	else if (cmd_cnt == 'd2) 
//		begin
//			aref_cmd <= AREFRESH;
//		end
//	else 
//		aref_cmd <= NOP;
//end

assign sdram_addr = 12'b0100_0000_0000;//percharge A10 = 1

endmodule
module sdram_write(
	input 				CLK,
	input 				RSTn,

	input 				wr_en,
	output wire 		wr_req,
	output reg 			flag_wr_end,

	output reg [ 3:0] 	wr_cmd,
	output reg [11:0] 	wr_addr,
	output wire[ 1:0] 	bank_addr,

	input				wr_trig,
	input 				ref_req,

	output reg [15:0]	wr_data
);
//=======================state=====================//
localparam W_IDLE 	= 5'b00001;
localparam W_REQ 	= 5'b00010;
localparam W_ACT 	= 5'b00100;
localparam W_WR 	= 5'b01000;
localparam W_PRE 	= 5'b10000;

//======================command====================//
localparam NOP 	= 4'b0111;
localparam PRE 	= 4'b0010;
localparam ACT 	= 4'b0011;
localparam AREF = 4'b0001;
localparam WR 	= 4'b0100;


reg 		flag_wr;
reg  [ 4:0] state;


wire 		flag_act_end;
wire 		flag_pre_end;
reg  		sd_row_end;//hang over
reg  [ 1:0] burst_cnt;
reg  [ 1:0]	burst_cnt_t;
reg  		wr_data_end;

reg  [ 3:0]	act_cnt;
reg  [ 3:0]	break_cnt;
reg  [ 6:0]	col_cnt;

reg  [11:0]	row_addr;
wire [ 8:0]	col_addr;


//=========================FSM==========================//
always @(posedge CLK or negedge RSTn) 
begin
	if (!RSTn) 
		begin
			state <= W_IDLE;
		end
	else 
		case(state)
			W_IDLE:	if (wr_trig)
						state <= W_REQ;
					else
						state <= W_IDLE;
			W_REQ :	if (wr_en)
						state <= W_ACT;
					else
						state <= W_REQ;
			W_ACT :	if (flag_act_end)
						state <= W_WR;
					else
						state <= W_ACT;
			W_WR  :	if (wr_data_end)
						state <= W_PRE;
					else if (ref_req && (burst_cnt_t == 'd2) && flag_wr)
						state <= W_PRE;
					else if (sd_row_end && flag_wr)
						state <= W_PRE;
					
			W_PRE :	if (ref_req && flag_wr)
						state <= W_REQ;
					else if (flag_pre_end && flag_wr)
						state <= W_ACT;
					else if (wr_data_end)
						state <= W_IDLE;
					
			default:	state <= W_IDLE;
		endcase	
	
end


//=====================command=====================//
always @(posedge CLK or negedge RSTn) 
begin
	if (!RSTn) 
		begin
			wr_cmd <= NOP;
		end
	else 
		case (state)
			 W_ACT  :	if (act_cnt == 0)
			 				wr_cmd <= ACT;
			 			else
			 				wr_cmd <= NOP;
			 W_WR	:	if (burst_cnt == 0)
			 				wr_cmd <= WR;
			 			else
			 				wr_cmd <= NOP;
			 W_PRE	:	if (break_cnt == 0)
			 				wr_cmd <= PRE;
			 			else
			 				wr_cmd <= NOP;
			 default:	wr_cmd <= NOP;

		endcase
		
end

//=====================flag_wr=====================//
always @(posedge CLK or negedge RSTn) 
begin
	if (!RSTn) 
		begin
			flag_wr <= 0;
		end
	else if (wr_trig && (!flag_wr)) 
		begin
			flag_wr <= 1;
		end
	else if (wr_data_end)
	 	begin
			flag_wr <= 0; 
		end
end


//flag_act_end
assign flag_act_end = (act_cnt == 'd3) ? 1: 0;

//flag_pre_end
assign flag_pre_end = (break_cnt == 'd3) ? 1 : 0;

//sd_row_end
//assign sd_row_end = (col_addr == 'd511) ? 1 : 0;//also can use
always @(posedge CLK or negedge RSTn) 
begin
    if (!RSTn)
        sd_row_end <= 0;
//    else if (state == W_WR && col_addr == 'd511)
    else if (col_addr == 'd510)
        sd_row_end <= 1;
    else 
        sd_row_end <= 0;
end

//burst_cnt
//burst_cnt_t
always @(posedge CLK or negedge RSTn) 
begin
	if (!RSTn) 
		begin
			burst_cnt <= 0;
			burst_cnt_t <= 0;		
		end
	else if (state == W_WR) 
		begin
			burst_cnt <= burst_cnt + 1;
			burst_cnt_t <= burst_cnt;
		end
	else 
		begin
			burst_cnt <= 0;
			burst_cnt_t<= 0;
		end
end

//wr_data_end
always @(posedge CLK or negedge RSTn) 
begin
	if (!RSTn) 
		begin
			wr_data_end <= 0;		
		end
	else if ((row_addr == 1) && (col_addr == 'd511)) 
		begin
			wr_data_end <= 1;
		end
	else 
		begin
			wr_data_end <= 0;
		end
end

//act_cnt
always @(posedge CLK or negedge RSTn) 
begin
	if (!RSTn) 
		begin
			act_cnt <= 0;
		end
	else if (state == W_ACT) 
		begin
			act_cnt <= act_cnt + 1;
		end
	else 
		begin
			act_cnt <= 0;
		end
end

//break_cnt
always @(posedge CLK or negedge RSTn) 
begin
	if (!RSTn) 
		begin
			break_cnt <= 0;
		end
	else if (state <= W_PRE) 
		begin
			break_cnt <= break_cnt + 1;
		end
	else 
		begin
			break_cnt <= 0;
		end
end

//col_cnt
always @(posedge CLK or negedge RSTn) 
begin
	if (!RSTn) 
		begin
			col_cnt <= 0;		
		end
//	else if (state == W_WR && burst_cnt_t == 'd3) 
	else if ( burst_cnt_t == 'd3) 
		begin
			col_cnt <= col_cnt + 1;
		end
	else if (col_addr == 'd511)
		begin
			col_cnt <= 0;
		end
end

//row_addr
always @(posedge CLK or negedge RSTn) 
begin
	if (!RSTn) 
		begin
			row_addr <= 0;		
		end
	else if (sd_row_end) 
		begin
			row_addr <= row_addr + 1;
		end
end

//col_addr
assign col_addr = {col_cnt , burst_cnt_t};
// col_addr={col_cnt	burst_cnt_t}
// 			 0000000		00			
// 			 0000000		01			
// 			 0000000		10			
// 			 0000000		11
// 			 
// 			 0000001		00		
// 			 0000001		01
// 			 0000001		10
// 			 0000001		11
// 			 ...			...

//wr_addr
always @(*) 
begin 
	case(state)
		W_ACT	:	if (act_cnt == 0)
				 		wr_addr <= row_addr;
		W_WR	:		wr_addr <= {3'b000,col_addr};
		W_PRE	:	if (break_cnt == 0)
				 		wr_addr <= 12'b0100_0000_0000;
	endcase
end

assign bank_addr = 2'b00;

//wr_req
//assign wr_req = (state == W_REQ) ? 1 : 0;//also can use
assign wr_req = state[1];

//flag_wr_end
always @(posedge CLK or negedge RSTn) 
begin
	if (!RSTn) 
		begin
			flag_wr_end <= 0;
		end
	else if ((state == W_PRE && ref_req == 1) || (state == W_PRE && wr_data_end == 1)) //ref
		begin
			flag_wr_end <= 1;
		end
	else 
		flag_wr_end <= 0;
end




//test
always @(*) 
begin
	case(burst_cnt_t)
		0:wr_data <= 'd3;
		1:wr_data <= 'd5;
		2:wr_data <= 'd7;
		3:wr_data <= 'd9;
	endcase
end



endmodule
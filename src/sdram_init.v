//========================command========================//
// CMD                CS		RAS		CAS		WE
// 
// PERCHARGE			0		0		1		0
// A_REFRESH			0		0		0		1
// NOP					0		1		1		1
// LOAD_REGISTER		0		0		0		0
// 
//=========================time==========================//
// tRP		20ns (50Hz:1clk = 20ns)
// tRC		63ns (4clk)
// 200us = 200000ns/20ns = 10000

//===================sdram address==========================//
// LOAD_REGISTER:
// 	A11	A10	A9	A8	A7	A6	A5	A4	A3	A2	A1 A0
// 	0	0	0	0	0	0	1	1	0	0	1	0
// other:
// 	A11	A10	A9	A8	A7	A6	A5	A4	A3	A2	A1 A0
// 	0	1	0	0	0	0	0	0	0	0	0	0
//==========================================================






module sdram_init(
	input 				CLK				,
	input 				RSTn			,
	output reg  [ 3:0] 	cmd_reg			,
	output wire [11:0] 	sdram_addr		,
	output wire			flag_init_end
);

localparam DELAY_200US 		= 10000		;


//SDRAM COMMAND
localparam NOP 				= 4'b0111 	;
localparam PERCHARGE 		= 4'b0010 	;			
localparam A_REFRESH 		= 4'b0001 	;			
localparam LOAD_REGISTER 	= 4'b0000 	;


reg [13:0] 	cnt_200us;
reg [ 3:0] 	cnt_cmd;
wire 		flag_200us;


//cnt_200
always @(posedge CLK or negedge RSTn) begin
	if (!RSTn) begin
		// reset
		cnt_200us <= 0;
	end
	else if (!flag_200us) begin
		cnt_200us <= cnt_200us + 1;
	end
	
end


//cnt_cmd
always @(posedge CLK or negedge RSTn) begin
	if (!RSTn) begin
		// reset
		cnt_cmd <= 0;
	end
	else if (flag_200us == 1 && flag_init_end == 0) begin
		cnt_cmd <= cnt_cmd + 1;
	end
end

//cmd_reg 
always @(posedge CLK or negedge RSTn) begin
	if (!RSTn) begin
		// reset
		cmd_reg <= NOP;
	end
	else if (flag_200us) begin
		case(cnt_cmd)
			0:		cmd_reg <= PERCHARGE;
			1:		cmd_reg <= A_REFRESH;
			5:		cmd_reg <= A_REFRESH;
			9:		cmd_reg <= LOAD_REGISTER;
			default:cmd_reg <= NOP;
		endcase
	end
end

//sdram_addr
//always @(posedge CLK or negedge RSTn) begin
//	if (!RSTn) begin
//		// reset
//		sdram_addr <= 0;
//	end
//	else if (flag_200us) begin
//		case(cnt_cmd)
//			0:sdram_addr <= 12'b01
//			1:
//			5:
//			9:
//		endcase
//	end
//end


assign sdram_addr 		= (cmd_reg == LOAD_REGISTER) 	? 12'b0000_0011_0010 	: 12'b0100_0000_0000;
assign flag_200us 		= (cnt_200us >= DELAY_200US) 	? 1 					: 0;
assign flag_init_end 	= (cnt_cmd >= 4'd10) 			? 1'b1 					: 1'b0;

endmodule
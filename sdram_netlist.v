/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Wed May 20 23:58:48 2020
/////////////////////////////////////////////////////////////


module sdram_init_DW01_inc_0 ( A, SUM );
  input [13:0] A;
  output [13:0] SUM;

  wire   [13:2] carry;

  ADDHX1 U1_1_12 ( .A(A[12]), .B(carry[12]), .CO(carry[13]), .S(SUM[12]) );
  ADDHX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1 U1_1_11 ( .A(A[11]), .B(carry[11]), .CO(carry[12]), .S(SUM[11]) );
  ADDHX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1 U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1 U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHX1 U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[13]), .B(A[13]), .Y(SUM[13]) );
endmodule


module sdram_init ( CLK, RSTn, cmd_reg, sdram_addr, flag_init_end );
  output [3:0] cmd_reg;
  output [11:0] sdram_addr;
  input CLK, RSTn;
  output flag_init_end;
  wire   N10, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21, N22, N23,
         N54, n9, n12, n13, n14, n16, n17, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n40, n42, n43, n44, \sdram_addr[5] , n1, n2, n3, n4, n5, n6, n7, n8,
         n10, n11, n15, n18, n41, n45, n46, n47, n48, n49, n51;
  wire   [13:0] cnt_200us;
  wire   [3:0] cnt_cmd;
  assign sdram_addr[0] = 1'b0;
  assign sdram_addr[2] = 1'b0;
  assign sdram_addr[3] = 1'b0;
  assign sdram_addr[6] = 1'b0;
  assign sdram_addr[7] = 1'b0;
  assign sdram_addr[8] = 1'b0;
  assign sdram_addr[9] = 1'b0;
  assign sdram_addr[11] = 1'b0;
  assign cmd_reg[3] = 1'b0;
  assign sdram_addr[1] = \sdram_addr[5] ;
  assign sdram_addr[4] = \sdram_addr[5] ;
  assign sdram_addr[5] = \sdram_addr[5] ;

  sdram_init_DW01_inc_0 add_58 ( .A(cnt_200us), .SUM({N23, N22, N21, N20, N19, 
        N18, N17, N16, N15, N14, N13, N12, N11, N10}) );
  DFFRQX2 \cnt_200us_reg[13]  ( .D(n39), .CK(CLK), .RN(RSTn), .Q(cnt_200us[13]) );
  DFFRQX2 \cnt_200us_reg[1]  ( .D(n38), .CK(CLK), .RN(RSTn), .Q(cnt_200us[1])
         );
  DFFRQX2 \cnt_200us_reg[2]  ( .D(n37), .CK(CLK), .RN(RSTn), .Q(cnt_200us[2])
         );
  DFFRQX2 \cnt_200us_reg[3]  ( .D(n36), .CK(CLK), .RN(RSTn), .Q(cnt_200us[3])
         );
  DFFRQX2 \cnt_200us_reg[12]  ( .D(n27), .CK(CLK), .RN(RSTn), .Q(cnt_200us[12]) );
  DFFRQX2 \cnt_200us_reg[4]  ( .D(n35), .CK(CLK), .RN(RSTn), .Q(cnt_200us[4])
         );
  DFFRQX2 \cnt_200us_reg[11]  ( .D(n28), .CK(CLK), .RN(RSTn), .Q(cnt_200us[11]) );
  DFFRQX2 \cnt_200us_reg[6]  ( .D(n33), .CK(CLK), .RN(RSTn), .Q(cnt_200us[6])
         );
  DFFRQX2 \cnt_200us_reg[5]  ( .D(n34), .CK(CLK), .RN(RSTn), .Q(cnt_200us[5])
         );
  DFFRQX2 \cnt_200us_reg[9]  ( .D(n30), .CK(CLK), .RN(RSTn), .Q(cnt_200us[9])
         );
  DFFRQX2 \cnt_200us_reg[8]  ( .D(n31), .CK(CLK), .RN(RSTn), .Q(cnt_200us[8])
         );
  DFFRQX2 \cnt_200us_reg[10]  ( .D(n29), .CK(CLK), .RN(RSTn), .Q(cnt_200us[10]) );
  DFFRQX2 \cnt_200us_reg[7]  ( .D(n32), .CK(CLK), .RN(RSTn), .Q(cnt_200us[7])
         );
  DFFRQX2 \cnt_200us_reg[0]  ( .D(n40), .CK(CLK), .RN(RSTn), .Q(cnt_200us[0])
         );
  DFFRQX2 \cnt_cmd_reg[3]  ( .D(n42), .CK(CLK), .RN(RSTn), .Q(cnt_cmd[3]) );
  DFFRQX2 \cnt_cmd_reg[1]  ( .D(n44), .CK(CLK), .RN(RSTn), .Q(cnt_cmd[1]) );
  DFFRQX2 \cnt_cmd_reg[2]  ( .D(n43), .CK(CLK), .RN(RSTn), .Q(cnt_cmd[2]) );
  DFFRQX2 \cnt_cmd_reg[0]  ( .D(n26), .CK(CLK), .RN(RSTn), .Q(cnt_cmd[0]) );
  DFFSQXL \cmd_reg_reg[1]  ( .D(n24), .CK(CLK), .SN(RSTn), .Q(cmd_reg[1]) );
  DFFSQXL \cmd_reg_reg[0]  ( .D(n23), .CK(CLK), .SN(RSTn), .Q(cmd_reg[0]) );
  DFFSQXL \cmd_reg_reg[2]  ( .D(n25), .CK(CLK), .SN(RSTn), .Q(cmd_reg[2]) );
  INVX2 U3 ( .A(cnt_cmd[0]), .Y(n1) );
  INVX2 U4 ( .A(n1), .Y(n2) );
  INVX2 U5 ( .A(N54), .Y(n3) );
  BUFX2 U6 ( .A(N54), .Y(n48) );
  INVX2 U7 ( .A(n48), .Y(n4) );
  INVX2 U8 ( .A(n48), .Y(n5) );
  INVX2 U9 ( .A(n48), .Y(n6) );
  INVX2 U10 ( .A(n15), .Y(n18) );
  INVX2 U11 ( .A(n15), .Y(n41) );
  OAI31X1 U12 ( .A0(n49), .A1(n1), .A2(n16), .B0(n51), .Y(n42) );
  INVX2 U13 ( .A(N54), .Y(n15) );
  INVX2 U14 ( .A(n20), .Y(flag_init_end) );
  INVX2 U15 ( .A(n8), .Y(n11) );
  OR2X2 U16 ( .A(n16), .B(n51), .Y(n14) );
  INVX2 U17 ( .A(n8), .Y(n10) );
  XOR2X1 U18 ( .A(n49), .B(n22), .Y(n44) );
  XOR2X1 U19 ( .A(n1), .B(n19), .Y(n26) );
  NAND2X2 U20 ( .A(n11), .B(n20), .Y(n19) );
  NOR2BX1 U21 ( .AN(cnt_200us[13]), .B(n47), .Y(N54) );
  OAI21X1 U22 ( .A0(cnt_cmd[1]), .A1(cnt_cmd[2]), .B0(cnt_cmd[3]), .Y(n20) );
  OAI211XL U23 ( .A0(n2), .A1(n16), .B0(n14), .C0(n17), .Y(n25) );
  AOI22XL U24 ( .A0(n11), .A1(n12), .B0(cmd_reg[2]), .B1(n3), .Y(n17) );
  OAI2B11X2 U25 ( .A1N(cmd_reg[1]), .A0(n10), .B0(n13), .C0(n14), .Y(n24) );
  OAI21X1 U26 ( .A0(cnt_cmd[1]), .A1(n1), .B0(n11), .Y(n13) );
  OAI21X1 U27 ( .A0(n2), .A1(n51), .B0(n49), .Y(n12) );
  NAND3XL U28 ( .A(cnt_cmd[0]), .B(n20), .C(n7), .Y(n22) );
  INVX2 U29 ( .A(n7), .Y(n8) );
  NOR2BX1 U30 ( .AN(cnt_200us[13]), .B(n47), .Y(n7) );
  OAI2BB2X2 U31 ( .B0(n9), .B1(n5), .A0N(cmd_reg[0]), .A1N(n3), .Y(n23) );
  AOI211X2 U32 ( .A0(n2), .A1(n51), .B0(n12), .C0(cnt_cmd[2]), .Y(n9) );
  NAND2X2 U33 ( .A(cnt_cmd[2]), .B(n7), .Y(n16) );
  INVX2 U34 ( .A(cnt_cmd[1]), .Y(n49) );
  INVX2 U35 ( .A(cnt_cmd[3]), .Y(n51) );
  XOR2X1 U36 ( .A(cnt_cmd[2]), .B(n21), .Y(n43) );
  NOR2X2 U37 ( .A(n49), .B(n22), .Y(n21) );
  AO22X2 U38 ( .A0(cnt_200us[12]), .A1(n10), .B0(N22), .B1(n15), .Y(n27) );
  AO22X2 U39 ( .A0(cnt_200us[11]), .A1(n41), .B0(N21), .B1(n15), .Y(n28) );
  AO22X2 U40 ( .A0(cnt_200us[10]), .A1(n11), .B0(N20), .B1(n6), .Y(n29) );
  AO22X2 U41 ( .A0(cnt_200us[9]), .A1(n18), .B0(N19), .B1(n5), .Y(n30) );
  AO22X2 U42 ( .A0(cnt_200us[8]), .A1(n18), .B0(N18), .B1(n4), .Y(n31) );
  AO22X2 U44 ( .A0(cnt_200us[7]), .A1(n10), .B0(N17), .B1(n6), .Y(n32) );
  AO22X2 U45 ( .A0(cnt_200us[6]), .A1(n7), .B0(N16), .B1(n5), .Y(n33) );
  AO22X2 U46 ( .A0(cnt_200us[5]), .A1(n41), .B0(N15), .B1(n4), .Y(n34) );
  AO22X2 U47 ( .A0(cnt_200us[4]), .A1(N54), .B0(N14), .B1(n3), .Y(n35) );
  AO22X2 U48 ( .A0(cnt_200us[3]), .A1(n18), .B0(N13), .B1(n5), .Y(n36) );
  AO22X2 U49 ( .A0(cnt_200us[2]), .A1(n18), .B0(N12), .B1(n4), .Y(n37) );
  AO22X2 U50 ( .A0(cnt_200us[1]), .A1(n10), .B0(N11), .B1(n6), .Y(n38) );
  AO22X2 U51 ( .A0(cnt_200us[13]), .A1(n41), .B0(N23), .B1(n4), .Y(n39) );
  AO22X2 U52 ( .A0(cnt_200us[0]), .A1(n41), .B0(N10), .B1(n6), .Y(n40) );
  NOR3X1 U53 ( .A(cmd_reg[1]), .B(cmd_reg[2]), .C(cmd_reg[0]), .Y(
        \sdram_addr[5] ) );
  INVX2 U54 ( .A(\sdram_addr[5] ), .Y(sdram_addr[10]) );
  NOR4X1 U55 ( .A(cnt_200us[7]), .B(cnt_200us[6]), .C(cnt_200us[5]), .D(
        cnt_200us[4]), .Y(n45) );
  NAND4BX1 U56 ( .AN(n45), .B(cnt_200us[10]), .C(cnt_200us[9]), .D(
        cnt_200us[8]), .Y(n46) );
  NOR3BX1 U57 ( .AN(n46), .B(cnt_200us[12]), .C(cnt_200us[11]), .Y(n47) );
endmodule


module sdram_aref_DW01_inc_0 ( A, SUM );
  input [9:0] A;
  output [9:0] SUM;

  wire   [9:2] carry;

  ADDHX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1 U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[9]), .B(A[9]), .Y(SUM[9]) );
endmodule


module sdram_aref ( CLK, RSTn, ref_en, flag_init_end, ref_req, flag_ref_end, 
        aref_cmd, sdram_addr );
  output [3:0] aref_cmd;
  output [11:0] sdram_addr;
  input CLK, RSTn, ref_en, flag_init_end;
  output ref_req, flag_ref_end;
  wire   n27, N11, N12, N13, N14, N15, N16, N17, N18, N19, N20, N21, N22, N23,
         N24, N25, N26, N27, N28, N29, N30, N31, flag_ref, N41, N47, N48, N49,
         N50, N67, N68, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n1, n2, n3, n4, n6, n7, n8, n9, n10, n11, n12, n24, n25, n26;
  wire   [9:0] ref_cnt;
  wire   [3:0] cmd_cnt;
  assign sdram_addr[10] = 1'b1;
  assign sdram_addr[0] = 1'b0;
  assign sdram_addr[1] = 1'b0;
  assign sdram_addr[2] = 1'b0;
  assign sdram_addr[3] = 1'b0;
  assign sdram_addr[4] = 1'b0;
  assign sdram_addr[5] = 1'b0;
  assign sdram_addr[6] = 1'b0;
  assign sdram_addr[7] = 1'b0;
  assign sdram_addr[8] = 1'b0;
  assign sdram_addr[9] = 1'b0;
  assign sdram_addr[11] = 1'b0;
  assign aref_cmd[3] = 1'b0;
  assign flag_ref_end = N41;

  sdram_aref_DW01_inc_0 add_42 ( .A(ref_cnt), .SUM({N20, N19, N18, N17, N16, 
        N15, N14, N13, N12, N11}) );
  DFFRQX2 \ref_cnt_reg[9]  ( .D(N30), .CK(CLK), .RN(RSTn), .Q(ref_cnt[9]) );
  DFFRQX2 flag_ref_reg ( .D(n22), .CK(CLK), .RN(RSTn), .Q(flag_ref) );
  DFFRQX2 \ref_cnt_reg[6]  ( .D(N27), .CK(CLK), .RN(RSTn), .Q(ref_cnt[6]) );
  DFFRQX2 \ref_cnt_reg[3]  ( .D(N24), .CK(CLK), .RN(RSTn), .Q(ref_cnt[3]) );
  DFFRQX2 \ref_cnt_reg[5]  ( .D(N26), .CK(CLK), .RN(RSTn), .Q(ref_cnt[5]) );
  DFFRQX2 \ref_cnt_reg[7]  ( .D(N28), .CK(CLK), .RN(RSTn), .Q(ref_cnt[7]) );
  DFFRQX2 \ref_cnt_reg[4]  ( .D(N25), .CK(CLK), .RN(RSTn), .Q(ref_cnt[4]) );
  DFFRQX2 \ref_cnt_reg[8]  ( .D(N29), .CK(CLK), .RN(RSTn), .Q(ref_cnt[8]) );
  DFFRQX2 \ref_cnt_reg[1]  ( .D(N22), .CK(CLK), .RN(RSTn), .Q(ref_cnt[1]) );
  DFFRQX2 \cmd_cnt_reg[1]  ( .D(N48), .CK(CLK), .RN(RSTn), .Q(cmd_cnt[1]) );
  DFFRQX2 \ref_cnt_reg[2]  ( .D(N23), .CK(CLK), .RN(RSTn), .Q(ref_cnt[2]) );
  DFFRQX2 \cmd_cnt_reg[3]  ( .D(N50), .CK(CLK), .RN(RSTn), .Q(cmd_cnt[3]) );
  DFFRQX2 \ref_cnt_reg[0]  ( .D(N21), .CK(CLK), .RN(RSTn), .Q(ref_cnt[0]) );
  DFFRQX2 \cmd_cnt_reg[2]  ( .D(N49), .CK(CLK), .RN(RSTn), .Q(cmd_cnt[2]) );
  DFFRQX2 ref_req_reg ( .D(n23), .CK(CLK), .RN(RSTn), .Q(n27) );
  DFFRQX2 \cmd_cnt_reg[0]  ( .D(N47), .CK(CLK), .RN(RSTn), .Q(cmd_cnt[0]) );
  DFFSQXL \aref_cmd_reg[2]  ( .D(n12), .CK(CLK), .SN(RSTn), .Q(aref_cmd[2]) );
  DFFSQXL \aref_cmd_reg[1]  ( .D(N68), .CK(CLK), .SN(RSTn), .Q(aref_cmd[1]) );
  DFFSQXL \aref_cmd_reg[0]  ( .D(N67), .CK(CLK), .SN(RSTn), .Q(aref_cmd[0]) );
  INVX2 U4 ( .A(cmd_cnt[0]), .Y(n1) );
  INVX2 U5 ( .A(n1), .Y(n2) );
  INVX2 U6 ( .A(flag_ref), .Y(n3) );
  INVX2 U7 ( .A(n27), .Y(n4) );
  INVX2 U8 ( .A(n4), .Y(ref_req) );
  INVX2 U9 ( .A(n18), .Y(n6) );
  INVX2 U10 ( .A(n6), .Y(n7) );
  INVX2 U11 ( .A(n6), .Y(n8) );
  NAND3XL U12 ( .A(n25), .B(n26), .C(n17), .Y(N41) );
  INVX2 U13 ( .A(n13), .Y(n12) );
  NOR2BX1 U14 ( .AN(N19), .B(n7), .Y(N29) );
  NOR2BX1 U15 ( .AN(N18), .B(n7), .Y(N28) );
  NOR2BX1 U16 ( .AN(N17), .B(n7), .Y(N27) );
  NOR2BX1 U17 ( .AN(N16), .B(n7), .Y(N26) );
  NOR2BX1 U18 ( .AN(N15), .B(n8), .Y(N25) );
  NOR2BX1 U19 ( .AN(N14), .B(n8), .Y(N24) );
  NOR2BX1 U20 ( .AN(N13), .B(n8), .Y(N23) );
  NOR2BX1 U21 ( .AN(N12), .B(n8), .Y(N22) );
  NOR2X2 U22 ( .A(n3), .B(n14), .Y(N48) );
  NOR3X1 U23 ( .A(cmd_cnt[2]), .B(cmd_cnt[3]), .C(n14), .Y(n13) );
  AND4X2 U24 ( .A(n19), .B(ref_cnt[7]), .C(ref_cnt[9]), .D(n20), .Y(n18) );
  AND3X2 U25 ( .A(ref_cnt[5]), .B(ref_cnt[3]), .C(ref_cnt[6]), .Y(n19) );
  NOR4X2 U26 ( .A(n21), .B(ref_cnt[1]), .C(ref_cnt[8]), .D(ref_cnt[4]), .Y(n20) );
  NAND2X2 U27 ( .A(ref_cnt[2]), .B(ref_cnt[0]), .Y(n21) );
  OAI32XL U28 ( .A0(n17), .A1(cmd_cnt[2]), .A2(n3), .B0(n15), .B1(n25), .Y(N49) );
  OAI21X1 U29 ( .A0(cmd_cnt[1]), .A1(n2), .B0(n17), .Y(n14) );
  AOI2BB1X2 U30 ( .A0N(cmd_cnt[1]), .A1N(n24), .B0(N47), .Y(n15) );
  OAI21BX1 U31 ( .A0(N41), .A1(n3), .B0N(ref_en), .Y(n22) );
  OAI2BB2X2 U32 ( .B0(n15), .B1(n26), .A0N(n16), .A1N(flag_ref), .Y(N50) );
  OAI32XL U33 ( .A0(n17), .A1(cmd_cnt[3]), .A2(n25), .B0(n26), .B1(cmd_cnt[2]), 
        .Y(n16) );
  NAND2X2 U34 ( .A(cmd_cnt[1]), .B(cmd_cnt[0]), .Y(n17) );
  NOR2X2 U35 ( .A(n3), .B(n2), .Y(N47) );
  NAND2X2 U36 ( .A(n2), .B(n13), .Y(N67) );
  NAND2BX2 U37 ( .AN(n2), .B(n13), .Y(N68) );
  NOR2BX1 U38 ( .AN(N20), .B(n18), .Y(N30) );
  NOR2BX1 U39 ( .AN(N11), .B(n18), .Y(N21) );
  AOI2BB1X2 U40 ( .A0N(N31), .A1N(n27), .B0(ref_en), .Y(n23) );
  INVX2 U41 ( .A(flag_ref), .Y(n24) );
  INVX2 U42 ( .A(cmd_cnt[2]), .Y(n25) );
  INVX2 U43 ( .A(cmd_cnt[3]), .Y(n26) );
  OAI211XL U44 ( .A0(ref_cnt[0]), .A1(ref_cnt[1]), .B0(ref_cnt[2]), .C0(
        ref_cnt[3]), .Y(n9) );
  NAND2BX1 U45 ( .AN(ref_cnt[4]), .B(n9), .Y(n10) );
  AND4X1 U46 ( .A(ref_cnt[5]), .B(ref_cnt[7]), .C(ref_cnt[6]), .D(n10), .Y(n11) );
  OA21X1 U47 ( .A0(n11), .A1(ref_cnt[8]), .B0(ref_cnt[9]), .Y(N31) );
endmodule


module sdram_write_DW01_inc_0 ( A, SUM );
  input [11:0] A;
  output [11:0] SUM;

  wire   [11:2] carry;

  ADDHX1 U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHX1 U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1 U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[11]), .B(A[11]), .Y(SUM[11]) );
endmodule


module sdram_write_DW01_inc_1 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1 U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
endmodule


module sdram_write ( CLK, RSTn, wr_en, wr_req, flag_wr_end, wr_cmd, wr_addr, 
        bank_addr, wr_trig, ref_req, wr_data );
  output [3:0] wr_cmd;
  output [11:0] wr_addr;
  output [1:0] bank_addr;
  output [15:0] wr_data;
  input CLK, RSTn, wr_en, wr_trig, ref_req;
  output wr_req, flag_wr_end;
  wire   n146, n147, state_0, wr_data_end, flag_wr, \burst_cnt_t[1] ,
         sd_row_end, N110, N111, N112, N121, N122, N123, N124, N125, N130,
         N131, N132, N133, N134, N140, N142, N143, N146, N147, N148, N149,
         N150, N151, N152, N164, N165, N166, N167, N168, N169, N170, N171,
         N172, N173, N174, N175, N190, N191, N192, N193, N194, N195, N196,
         N197, N198, N199, N200, N201, N203, N204, n6, n23, n24, n26, n28, n29,
         n31, n32, n34, n35, n36, n37, n38, n39, n40, n44, n46, n47, n48, n49,
         n50, n52, n53, n54, n56, n57, n60, n61, n62, n65, n67, n69, n71, n72,
         n73, n74, n75, n76, n78, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n1, n2, n3, n4, n5, n7, n8, n10, n11, n12, n13, n14, n15,
         n16, n17, n18, n19, n20, n21, n22, n25, n27, n30, n33, n42, n43, n45,
         n51, n55, n58, n59, n63, n64, n66, n68, n70, n77, n79, n80, n98, n117,
         n118, n119, n120, n121, n122, n123, n124, n125, n126, n127, n128,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n138, n139,
         n140, n141, n142, n143, n144, n145;
  wire   [4:2] state;
  wire   [3:0] act_cnt;
  wire   [1:0] burst_cnt;
  wire   [3:0] break_cnt;
  wire   [11:0] row_addr;
  wire   [6:0] col_cnt;
  assign wr_data[0] = 1'b1;
  assign wr_data[4] = 1'b0;
  assign wr_data[5] = 1'b0;
  assign wr_data[6] = 1'b0;
  assign wr_data[7] = 1'b0;
  assign wr_data[8] = 1'b0;
  assign wr_data[9] = 1'b0;
  assign wr_data[10] = 1'b0;
  assign wr_data[11] = 1'b0;
  assign wr_data[12] = 1'b0;
  assign wr_data[13] = 1'b0;
  assign wr_data[14] = 1'b0;
  assign wr_data[15] = 1'b0;
  assign bank_addr[0] = 1'b0;
  assign bank_addr[1] = 1'b0;
  assign wr_cmd[3] = 1'b0;

  sdram_write_DW01_inc_0 add_256 ( .A(row_addr), .SUM({N175, N174, N173, N172, 
        N171, N170, N169, N168, N167, N166, N165, N164}) );
  sdram_write_DW01_inc_1 add_239 ( .A(col_cnt), .SUM({N152, N151, N150, N149, 
        N148, N147, N146}) );
  TLATX1 \wr_addr_reg[11]  ( .G(n22), .D(N201), .Q(wr_addr[11]) );
  TLATX1 \wr_addr_reg[10]  ( .G(n25), .D(N200), .Q(wr_addr[10]) );
  TLATX1 \wr_addr_reg[9]  ( .G(n22), .D(N199), .Q(wr_addr[9]) );
  TLATX1 \wr_addr_reg[8]  ( .G(n25), .D(N198), .Q(wr_addr[8]) );
  TLATX1 \wr_addr_reg[7]  ( .G(n22), .D(N197), .Q(wr_addr[7]) );
  TLATX1 \wr_addr_reg[6]  ( .G(n25), .D(N196), .Q(wr_addr[6]) );
  TLATX1 \wr_addr_reg[5]  ( .G(n22), .D(N195), .Q(wr_addr[5]) );
  TLATX1 \wr_addr_reg[4]  ( .G(n25), .D(N194), .Q(wr_addr[4]) );
  TLATX1 \wr_addr_reg[3]  ( .G(n21), .D(N193), .Q(wr_addr[3]) );
  TLATX1 \wr_addr_reg[2]  ( .G(n21), .D(N192), .Q(wr_addr[2]) );
  TLATX1 \wr_addr_reg[1]  ( .G(n21), .D(N191), .Q(wr_addr[1]) );
  TLATX1 \wr_addr_reg[0]  ( .G(n21), .D(N190), .Q(wr_addr[0]) );
  DFFRQX2 flag_wr_end_reg ( .D(N204), .CK(CLK), .RN(RSTn), .Q(flag_wr_end) );
  DFFRQX2 wr_data_end_reg ( .D(N125), .CK(CLK), .RN(RSTn), .Q(wr_data_end) );
  DFFSQXL \state_reg[0]  ( .D(n113), .CK(CLK), .SN(RSTn), .Q(state_0) );
  DFFRX1 \col_cnt_reg[2]  ( .D(n106), .CK(CLK), .RN(RSTn), .Q(col_cnt[2]), 
        .QN(n102) );
  DFFRX1 \col_cnt_reg[3]  ( .D(n105), .CK(CLK), .RN(RSTn), .Q(col_cnt[3]), 
        .QN(n101) );
  DFFRQX2 \state_reg[1]  ( .D(n112), .CK(CLK), .RN(RSTn), .Q(n146) );
  DFFRQX2 \state_reg[3]  ( .D(n110), .CK(CLK), .RN(RSTn), .Q(state[3]) );
  DFFRQX2 \burst_cnt_reg[0]  ( .D(N121), .CK(CLK), .RN(RSTn), .Q(burst_cnt[0])
         );
  DFFRX1 \burst_cnt_t_reg[0]  ( .D(N123), .CK(CLK), .RN(RSTn), .Q(n85), .QN(
        wr_data[1]) );
  DFFRQX2 \row_addr_reg[11]  ( .D(n96), .CK(CLK), .RN(RSTn), .Q(row_addr[11])
         );
  DFFRQX2 \break_cnt_reg[1]  ( .D(n79), .CK(CLK), .RN(RSTn), .Q(break_cnt[1])
         );
  DFFRQX2 \col_cnt_reg[6]  ( .D(n109), .CK(CLK), .RN(RSTn), .Q(col_cnt[6]) );
  DFFRQX2 \row_addr_reg[6]  ( .D(n90), .CK(CLK), .RN(RSTn), .Q(row_addr[6]) );
  DFFRQX2 \row_addr_reg[7]  ( .D(n89), .CK(CLK), .RN(RSTn), .Q(row_addr[7]) );
  DFFRQX2 \row_addr_reg[8]  ( .D(n88), .CK(CLK), .RN(RSTn), .Q(row_addr[8]) );
  DFFRQX2 \row_addr_reg[9]  ( .D(n87), .CK(CLK), .RN(RSTn), .Q(row_addr[9]) );
  DFFRQX2 \act_cnt_reg[0]  ( .D(N130), .CK(CLK), .RN(RSTn), .Q(act_cnt[0]) );
  DFFRQX2 \burst_cnt_reg[1]  ( .D(N122), .CK(CLK), .RN(RSTn), .Q(burst_cnt[1])
         );
  DFFRQX2 \act_cnt_reg[3]  ( .D(N133), .CK(CLK), .RN(RSTn), .Q(act_cnt[3]) );
  DFFRQX2 \state_reg[2]  ( .D(n111), .CK(CLK), .RN(RSTn), .Q(state[2]) );
  DFFRQX2 \act_cnt_reg[2]  ( .D(N132), .CK(CLK), .RN(RSTn), .Q(act_cnt[2]) );
  DFFRQX2 \row_addr_reg[0]  ( .D(n97), .CK(CLK), .RN(RSTn), .Q(row_addr[0]) );
  DFFRQX2 \act_cnt_reg[1]  ( .D(N131), .CK(CLK), .RN(RSTn), .Q(act_cnt[1]) );
  DFFRQX2 \row_addr_reg[4]  ( .D(n92), .CK(CLK), .RN(RSTn), .Q(row_addr[4]) );
  DFFRQX2 \row_addr_reg[10]  ( .D(n86), .CK(CLK), .RN(RSTn), .Q(row_addr[10])
         );
  DFFRQX2 \row_addr_reg[2]  ( .D(n94), .CK(CLK), .RN(RSTn), .Q(row_addr[2]) );
  DFFRQX2 \row_addr_reg[1]  ( .D(n95), .CK(CLK), .RN(RSTn), .Q(row_addr[1]) );
  DFFRQX2 \row_addr_reg[3]  ( .D(n93), .CK(CLK), .RN(RSTn), .Q(row_addr[3]) );
  DFFRQX2 \row_addr_reg[5]  ( .D(n91), .CK(CLK), .RN(RSTn), .Q(row_addr[5]) );
  DFFRQX2 flag_wr_reg ( .D(n115), .CK(CLK), .RN(RSTn), .Q(flag_wr) );
  DFFRQX2 \break_cnt_reg[0]  ( .D(N140), .CK(CLK), .RN(RSTn), .Q(break_cnt[0])
         );
  DFFRQX2 \burst_cnt_t_reg[1]  ( .D(N124), .CK(CLK), .RN(RSTn), .Q(
        \burst_cnt_t[1] ) );
  DFFRQX2 \col_cnt_reg[1]  ( .D(n107), .CK(CLK), .RN(RSTn), .Q(col_cnt[1]) );
  DFFRQX2 sd_row_end_reg ( .D(n116), .CK(CLK), .RN(RSTn), .Q(sd_row_end) );
  DFFRQX2 \state_reg[4]  ( .D(n114), .CK(CLK), .RN(RSTn), .Q(state[4]) );
  DFFRQX2 \break_cnt_reg[3]  ( .D(N143), .CK(CLK), .RN(RSTn), .Q(break_cnt[3])
         );
  DFFRX1 \col_cnt_reg[5]  ( .D(n103), .CK(CLK), .RN(RSTn), .Q(col_cnt[5]), 
        .QN(n99) );
  DFFRX1 \col_cnt_reg[4]  ( .D(n104), .CK(CLK), .RN(RSTn), .Q(col_cnt[4]), 
        .QN(n100) );
  DFFRQX2 \col_cnt_reg[0]  ( .D(n108), .CK(CLK), .RN(RSTn), .Q(col_cnt[0]) );
  DFFRQX2 \break_cnt_reg[2]  ( .D(N142), .CK(CLK), .RN(RSTn), .Q(break_cnt[2])
         );
  DFFSQXL \wr_cmd_reg[2]  ( .D(N112), .CK(CLK), .SN(RSTn), .Q(wr_cmd[2]) );
  DFFSQXL \wr_cmd_reg[1]  ( .D(N111), .CK(CLK), .SN(RSTn), .Q(wr_cmd[1]) );
  DFFSQXL \wr_cmd_reg[0]  ( .D(N110), .CK(CLK), .SN(RSTn), .Q(wr_cmd[0]) );
  AND2X2 U3 ( .A(n83), .B(n117), .Y(n1) );
  CLKBUFX2 U4 ( .A(ref_req), .Y(n2) );
  INVX2 U5 ( .A(n1), .Y(n3) );
  INVX2 U6 ( .A(n1), .Y(n4) );
  INVX2 U7 ( .A(n50), .Y(n5) );
  INVX2 U8 ( .A(n5), .Y(n7) );
  INVX2 U9 ( .A(n146), .Y(n8) );
  INVX2 U10 ( .A(n8), .Y(wr_req) );
  INVX2 U11 ( .A(break_cnt[2]), .Y(n10) );
  INVX2 U12 ( .A(n10), .Y(n11) );
  INVX2 U13 ( .A(n121), .Y(n12) );
  INVX2 U14 ( .A(n12), .Y(n13) );
  INVX2 U15 ( .A(n12), .Y(n14) );
  INVX2 U16 ( .A(n56), .Y(n15) );
  INVX2 U17 ( .A(n15), .Y(n16) );
  INVX2 U18 ( .A(n15), .Y(n17) );
  INVX2 U19 ( .A(n15), .Y(n18) );
  BUFX2 U20 ( .A(n49), .Y(n19) );
  BUFX2 U21 ( .A(n37), .Y(n20) );
  AOI21BX2 U22 ( .A0(n119), .A1(n53), .B0N(n54), .Y(N203) );
  INVX2 U23 ( .A(N203), .Y(n21) );
  INVX2 U24 ( .A(N203), .Y(n22) );
  INVX2 U25 ( .A(N203), .Y(n25) );
  OR2X2 U26 ( .A(n129), .B(n131), .Y(n147) );
  INVX2 U27 ( .A(n147), .Y(n27) );
  INVX2 U28 ( .A(n147), .Y(n30) );
  INVX2 U29 ( .A(n147), .Y(n33) );
  INVX2 U30 ( .A(n147), .Y(wr_data[3]) );
  NOR3X1 U31 ( .A(state[2]), .B(state[4]), .C(n127), .Y(n60) );
  NAND3XL U32 ( .A(n127), .B(n118), .C(state[2]), .Y(n56) );
  INVX2 U33 ( .A(n49), .Y(n122) );
  INVX2 U34 ( .A(n3), .Y(n98) );
  INVX2 U35 ( .A(n37), .Y(n119) );
  NAND2X2 U36 ( .A(N134), .B(n7), .Y(n65) );
  INVX2 U37 ( .A(N134), .Y(n77) );
  INVX2 U38 ( .A(n63), .Y(n42) );
  INVX2 U39 ( .A(n63), .Y(n45) );
  INVX2 U40 ( .A(n63), .Y(n43) );
  INVX2 U41 ( .A(n59), .Y(n51) );
  INVX2 U42 ( .A(n59), .Y(n55) );
  INVX2 U43 ( .A(n59), .Y(n58) );
  NAND2X2 U44 ( .A(n60), .B(n83), .Y(n49) );
  AOI21X1 U45 ( .A0(n123), .A1(n98), .B0(N130), .Y(n28) );
  NAND2X2 U46 ( .A(n120), .B(n83), .Y(n37) );
  OAI22X1 U47 ( .A0(n127), .A1(n23), .B0(n24), .B1(n125), .Y(n110) );
  OAI2BB2X2 U48 ( .B0(n42), .B1(n137), .A0N(N166), .A1N(n55), .Y(n94) );
  OAI2BB2X2 U49 ( .B0(n42), .B1(n136), .A0N(N165), .A1N(n58), .Y(n95) );
  OAI2BB2X2 U50 ( .B0(n45), .B1(n144), .A0N(N173), .A1N(n58), .Y(n87) );
  OAI2BB2X2 U51 ( .B0(n45), .B1(n143), .A0N(N172), .A1N(n55), .Y(n88) );
  OAI2BB2X2 U52 ( .B0(n45), .B1(n142), .A0N(N171), .A1N(n51), .Y(n89) );
  OAI2BB2X2 U53 ( .B0(n43), .B1(n141), .A0N(N170), .A1N(n51), .Y(n90) );
  OAI2BB2X2 U54 ( .B0(n43), .B1(n140), .A0N(N169), .A1N(n51), .Y(n91) );
  OAI2BB2X2 U55 ( .B0(n43), .B1(n139), .A0N(N168), .A1N(n55), .Y(n92) );
  OAI2BB2X2 U56 ( .B0(n45), .B1(n138), .A0N(N167), .A1N(n55), .Y(n93) );
  OAI2B2X1 U57 ( .A1N(N174), .A0(n59), .B0(n51), .B1(n145), .Y(n86) );
  NAND4X2 U58 ( .A(n141), .B(n142), .C(n143), .D(n144), .Y(n75) );
  OAI2BB2X2 U59 ( .B0(n27), .B1(n134), .A0N(N147), .A1N(wr_data[3]), .Y(n107)
         );
  OAI2BB2X2 U60 ( .B0(n118), .B1(n23), .A0N(n23), .A1N(n122), .Y(n114) );
  INVX2 U61 ( .A(n56), .Y(n117) );
  OA21X1 U62 ( .A0(n53), .A1(n37), .B0(n83), .Y(n82) );
  NOR2X2 U63 ( .A(n19), .B(n130), .Y(N124) );
  NOR2X2 U64 ( .A(n6), .B(n52), .Y(n116) );
  INVX2 U65 ( .A(n26), .Y(n125) );
  INVX2 U66 ( .A(n57), .Y(n120) );
  NAND2X2 U67 ( .A(N121), .B(n130), .Y(N111) );
  INVX2 U68 ( .A(n31), .Y(n70) );
  OAI22X1 U69 ( .A0(n129), .A1(n13), .B0(n66), .B1(n16), .Y(N190) );
  OAI22X1 U70 ( .A0(n131), .A1(n13), .B0(n136), .B1(n18), .Y(N191) );
  OAI22X1 U71 ( .A0(n133), .A1(n13), .B0(n137), .B1(n17), .Y(N192) );
  OAI22X1 U72 ( .A0(n134), .A1(n14), .B0(n138), .B1(n16), .Y(N193) );
  OAI22X1 U73 ( .A0(n132), .A1(n14), .B0(n143), .B1(n18), .Y(N198) );
  AOI31X1 U74 ( .A0(n26), .A1(n123), .A2(N130), .B0(n122), .Y(n54) );
  INVX2 U75 ( .A(n60), .Y(n121) );
  OAI21X1 U76 ( .A0(n145), .A1(n16), .B0(n57), .Y(N200) );
  NOR2X2 U77 ( .A(n144), .B(n18), .Y(N199) );
  NOR2X2 U78 ( .A(n135), .B(n17), .Y(N201) );
  NOR4X2 U79 ( .A(n50), .B(n68), .C(n11), .D(break_cnt[3]), .Y(n32) );
  NOR2X2 U80 ( .A(state_0), .B(n146), .Y(n83) );
  INVX2 U81 ( .A(sd_row_end), .Y(n59) );
  NAND4BX2 U82 ( .AN(state_0), .B(n44), .C(wr_req), .D(n118), .Y(n34) );
  INVX2 U83 ( .A(sd_row_end), .Y(n63) );
  OAI32XL U84 ( .A0(n77), .A1(break_cnt[2]), .A2(n7), .B0(n10), .B1(n65), .Y(
        N142) );
  NAND4BX2 U85 ( .AN(wr_req), .B(state_0), .C(n44), .D(n118), .Y(n35) );
  OAI32XL U86 ( .A0(n61), .A1(break_cnt[3]), .A2(n7), .B0(n62), .B1(n128), .Y(
        N143) );
  INVX2 U87 ( .A(break_cnt[3]), .Y(n128) );
  NAND2XL U88 ( .A(break_cnt[2]), .B(N134), .Y(n61) );
  OA21X1 U89 ( .A0(n77), .A1(n11), .B0(n65), .Y(n62) );
  OAI222X1 U90 ( .A0(n35), .A1(n36), .B0(wr_en), .B1(n34), .C0(n20), .C1(n31), 
        .Y(n112) );
  OAI32XL U91 ( .A0(n124), .A1(act_cnt[3]), .A2(n24), .B0(n69), .B1(n126), .Y(
        N133) );
  INVX2 U92 ( .A(act_cnt[3]), .Y(n126) );
  OA21X1 U93 ( .A0(n4), .A1(act_cnt[2]), .B0(n28), .Y(n69) );
  NOR2X2 U94 ( .A(act_cnt[2]), .B(act_cnt[3]), .Y(n26) );
  NOR4X2 U95 ( .A(break_cnt[0]), .B(break_cnt[1]), .C(n11), .D(break_cnt[3]), 
        .Y(n53) );
  NOR2X2 U96 ( .A(state[3]), .B(state[2]), .Y(n44) );
  OAI211XL U97 ( .A0(n26), .A1(n4), .B0(n28), .C0(n29), .Y(n111) );
  AOI32XL U98 ( .A0(n119), .A1(n31), .A2(n32), .B0(wr_en), .B1(n80), .Y(n29)
         );
  INVX2 U99 ( .A(n34), .Y(n80) );
  NOR2X2 U100 ( .A(n49), .B(burst_cnt[0]), .Y(N121) );
  OAI211XL U101 ( .A0(n120), .A1(n117), .B0(n81), .C0(n82), .Y(N112) );
  OAI31X1 U102 ( .A0(n125), .A1(act_cnt[1]), .A2(act_cnt[0]), .B0(n98), .Y(n81) );
  OAI211XL U103 ( .A0(n60), .A1(n120), .B0(n84), .C0(n82), .Y(N110) );
  OAI21X1 U104 ( .A0(burst_cnt[0]), .A1(burst_cnt[1]), .B0(n60), .Y(n84) );
  NOR2X2 U105 ( .A(n4), .B(act_cnt[0]), .Y(N130) );
  NAND4X2 U106 ( .A(col_cnt[0]), .B(col_cnt[1]), .C(col_cnt[6]), .D(n76), .Y(
        n52) );
  NOR4X2 U107 ( .A(n99), .B(n100), .C(n101), .D(n102), .Y(n76) );
  OAI22X1 U108 ( .A0(n28), .A1(n124), .B0(act_cnt[2]), .B1(n24), .Y(N132) );
  OAI22X1 U109 ( .A0(wr_data_end), .A1(n68), .B0(flag_wr), .B1(n36), .Y(n115)
         );
  OAI2BB2X2 U110 ( .B0(n42), .B1(n66), .A0N(N164), .A1N(n58), .Y(n97) );
  OAI2BB2X2 U111 ( .B0(n43), .B1(n135), .A0N(N175), .A1N(n58), .Y(n96) );
  NAND2X2 U112 ( .A(break_cnt[1]), .B(break_cnt[0]), .Y(n50) );
  OAI21X1 U113 ( .A0(wr_trig), .A1(n35), .B0(n38), .Y(n113) );
  AOI31X1 U114 ( .A0(n35), .A1(n34), .A2(n39), .B0(n40), .Y(n38) );
  NOR4BX2 U115 ( .AN(wr_data_end), .B(n32), .C(n70), .D(n20), .Y(n40) );
  NOR3X1 U116 ( .A(n98), .B(n119), .C(n122), .Y(n39) );
  OAI2BB2X2 U117 ( .B0(n27), .B1(n133), .A0N(N146), .A1N(n33), .Y(n108) );
  OAI2BB2X2 U118 ( .B0(n27), .B1(n132), .A0N(N152), .A1N(n30), .Y(n109) );
  NAND2X2 U119 ( .A(n2), .B(flag_wr), .Y(n31) );
  NAND3XL U120 ( .A(n46), .B(n47), .C(n48), .Y(n23) );
  OAI21X1 U121 ( .A0(n32), .A1(n70), .B0(n119), .Y(n47) );
  AOI2BB2X2 U122 ( .B0(n49), .B1(n37), .A0N(n6), .A1N(n31), .Y(n48) );
  AOI31X1 U123 ( .A0(n122), .A1(n42), .A2(flag_wr), .B0(wr_data_end), .Y(n46)
         );
  NAND3XL U124 ( .A(act_cnt[0]), .B(n98), .C(act_cnt[1]), .Y(n24) );
  OAI2BB2X2 U125 ( .B0(n101), .B1(n33), .A0N(N149), .A1N(n30), .Y(n105) );
  OAI2BB2X2 U126 ( .B0(n100), .B1(n30), .A0N(N150), .A1N(wr_data[3]), .Y(n104)
         );
  OAI2BB2X2 U127 ( .B0(n99), .B1(wr_data[3]), .A0N(N151), .A1N(n33), .Y(n103)
         );
  OAI2BB2X2 U128 ( .B0(n102), .B1(n33), .A0N(N148), .A1N(n30), .Y(n106) );
  NAND2X2 U129 ( .A(state[4]), .B(n44), .Y(n57) );
  NOR2X2 U130 ( .A(break_cnt[0]), .B(n77), .Y(N140) );
  INVX2 U131 ( .A(n67), .Y(n79) );
  OAI211XL U132 ( .A0(break_cnt[0]), .A1(break_cnt[1]), .B0(N134), .C0(n7), 
        .Y(n67) );
  NAND2X2 U133 ( .A(\burst_cnt_t[1] ), .B(n129), .Y(n6) );
  NOR2X2 U134 ( .A(n78), .B(n19), .Y(N122) );
  XNOR2X1 U135 ( .A(burst_cnt[0]), .B(burst_cnt[1]), .Y(n78) );
  INVX2 U136 ( .A(n85), .Y(n129) );
  NOR2BX1 U137 ( .AN(burst_cnt[0]), .B(n19), .Y(N123) );
  AOI2BB1X2 U138 ( .A0N(wr_data_end), .A1N(n2), .B0(n20), .Y(N204) );
  INVX2 U139 ( .A(state[4]), .Y(n118) );
  NOR2X2 U140 ( .A(n71), .B(n4), .Y(N131) );
  XNOR2X1 U141 ( .A(act_cnt[0]), .B(act_cnt[1]), .Y(n71) );
  INVX2 U142 ( .A(row_addr[9]), .Y(n144) );
  INVX2 U144 ( .A(state[3]), .Y(n127) );
  INVX2 U145 ( .A(burst_cnt[1]), .Y(n130) );
  INVX2 U146 ( .A(row_addr[6]), .Y(n141) );
  INVX2 U147 ( .A(row_addr[7]), .Y(n142) );
  INVX2 U148 ( .A(row_addr[8]), .Y(n143) );
  INVX2 U149 ( .A(flag_wr), .Y(n68) );
  INVX2 U150 ( .A(row_addr[10]), .Y(n145) );
  INVX2 U151 ( .A(\burst_cnt_t[1] ), .Y(n131) );
  INVX2 U152 ( .A(act_cnt[1]), .Y(n123) );
  INVX2 U153 ( .A(row_addr[0]), .Y(n66) );
  INVX2 U154 ( .A(col_cnt[0]), .Y(n133) );
  INVX2 U155 ( .A(row_addr[11]), .Y(n135) );
  INVX2 U156 ( .A(col_cnt[1]), .Y(n134) );
  INVX2 U157 ( .A(row_addr[5]), .Y(n140) );
  INVX2 U158 ( .A(row_addr[3]), .Y(n138) );
  INVX2 U159 ( .A(row_addr[1]), .Y(n136) );
  INVX2 U160 ( .A(row_addr[2]), .Y(n137) );
  INVX2 U161 ( .A(row_addr[4]), .Y(n139) );
  INVX2 U162 ( .A(act_cnt[2]), .Y(n124) );
  AND3X2 U163 ( .A(n72), .B(n73), .C(n74), .Y(N125) );
  NOR4X2 U164 ( .A(row_addr[2]), .B(row_addr[1]), .C(row_addr[11]), .D(
        row_addr[10]), .Y(n73) );
  NOR4X2 U165 ( .A(n75), .B(row_addr[3]), .C(row_addr[5]), .D(row_addr[4]), 
        .Y(n74) );
  NOR3BX1 U166 ( .AN(n27), .B(n52), .C(n66), .Y(n72) );
  INVX2 U167 ( .A(col_cnt[6]), .Y(n132) );
  OAI22X1 U168 ( .A0(n102), .A1(n14), .B0(n139), .B1(n17), .Y(N194) );
  OAI22X1 U169 ( .A0(n101), .A1(n121), .B0(n140), .B1(n16), .Y(N195) );
  OAI22X1 U170 ( .A0(n100), .A1(n14), .B0(n141), .B1(n18), .Y(N196) );
  OAI22X1 U171 ( .A0(n99), .A1(n121), .B0(n142), .B1(n17), .Y(N197) );
  OAI21X1 U172 ( .A0(\burst_cnt_t[1] ), .A1(n129), .B0(n6), .Y(wr_data[2]) );
  INVX2 U173 ( .A(wr_trig), .Y(n36) );
  OR2X1 U174 ( .A(state[3]), .B(state[2]), .Y(n64) );
  OAI31X1 U175 ( .A0(n64), .A1(n146), .A2(state_0), .B0(state[4]), .Y(N134) );
endmodule


module sdram_read_DW01_inc_0 ( A, SUM );
  input [11:0] A;
  output [11:0] SUM;

  wire   [11:2] carry;

  ADDHX1 U1_1_10 ( .A(A[10]), .B(carry[10]), .CO(carry[11]), .S(SUM[10]) );
  ADDHX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1 U1_1_9 ( .A(A[9]), .B(carry[9]), .CO(carry[10]), .S(SUM[9]) );
  ADDHX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .CO(carry[9]), .S(SUM[8]) );
  ADDHX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .CO(carry[8]), .S(SUM[7]) );
  ADDHX1 U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[11]), .B(A[11]), .Y(SUM[11]) );
endmodule


module sdram_read_DW01_inc_1 ( A, SUM );
  input [6:0] A;
  output [6:0] SUM;

  wire   [6:2] carry;

  ADDHX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  ADDHX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1 U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[6]), .B(A[6]), .Y(SUM[6]) );
endmodule


module sdram_read ( CLK, RSTn, rd_en, rd_req, flag_rd_end, rd_cmd, rd_addr, 
        bank_addr, rd_trig, ref_req );
  output [3:0] rd_cmd;
  output [11:0] rd_addr;
  output [1:0] bank_addr;
  input CLK, RSTn, rd_en, rd_trig, ref_req;
  output rd_req, flag_rd_end;
  wire   flag_rd, rd_data_end, state_0, \burst_cnt_t[0] , sd_row_end,
         flag_pre_end, N112, N113, N114, N117, N118, N119, N120, N121, N126,
         N127, N128, N129, N130, N136, N138, N139, N142, N143, N144, N145,
         N146, N147, N148, N160, N161, N162, N163, N164, N165, N166, N167,
         N168, N169, N170, N171, N186, N187, N188, N189, N190, N191, N192,
         N193, N194, N195, N196, N197, N199, N200, n17, n22, n23, n24, n27,
         n28, n29, n30, n31, n32, n33, n36, n37, n38, n40, n44, n46, n47, n51,
         n53, n54, n56, n58, n59, n60, n61, n64, n66, n68, n70, n71, n72, n73,
         n74, n75, n76, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n108, n109, n110, n111, n112,
         n113, n114, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n18, n19, n20, n21, n25, n26, n34, n35, n39, n41, n42,
         n43, n45, n48, n49, n50, n52, n55, n57, n62, n63, n65, n67, n69, n77,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153;
  wire   [4:2] state;
  wire   [3:0] act_cnt;
  wire   [1:0] burst_cnt;
  wire   [3:0] break_cnt;
  wire   [11:0] row_addr;
  wire   [6:0] col_cnt;
  assign bank_addr[0] = 1'b0;
  assign bank_addr[1] = 1'b0;
  assign rd_cmd[3] = 1'b0;

  sdram_read_DW01_inc_0 add_270 ( .A(row_addr), .SUM({N171, N170, N169, N168, 
        N167, N166, N165, N164, N163, N162, N161, N160}) );
  sdram_read_DW01_inc_1 add_253 ( .A(col_cnt), .SUM({N148, N147, N146, N145, 
        N144, N143, N142}) );
  TLATX1 \rd_addr_reg[11]  ( .G(n48), .D(N197), .Q(rd_addr[11]) );
  TLATX1 \rd_addr_reg[10]  ( .G(n49), .D(N196), .Q(rd_addr[10]) );
  TLATX1 \rd_addr_reg[9]  ( .G(n48), .D(N195), .Q(rd_addr[9]) );
  TLATX1 \rd_addr_reg[8]  ( .G(n49), .D(N194), .Q(rd_addr[8]) );
  TLATX1 \rd_addr_reg[7]  ( .G(n48), .D(N193), .Q(rd_addr[7]) );
  TLATX1 \rd_addr_reg[6]  ( .G(n49), .D(N192), .Q(rd_addr[6]) );
  TLATX1 \rd_addr_reg[5]  ( .G(n48), .D(N191), .Q(rd_addr[5]) );
  TLATX1 \rd_addr_reg[4]  ( .G(n49), .D(N190), .Q(rd_addr[4]) );
  TLATX1 \rd_addr_reg[3]  ( .G(n45), .D(N189), .Q(rd_addr[3]) );
  TLATX1 \rd_addr_reg[2]  ( .G(n45), .D(N188), .Q(rd_addr[2]) );
  TLATX1 \rd_addr_reg[1]  ( .G(n45), .D(N187), .Q(rd_addr[1]) );
  TLATX1 \rd_addr_reg[0]  ( .G(n45), .D(N186), .Q(rd_addr[0]) );
  DFFRQX2 flag_pre_end_reg ( .D(n114), .CK(CLK), .RN(RSTn), .Q(flag_pre_end)
         );
  DFFRQX2 flag_rd_end_reg ( .D(N200), .CK(CLK), .RN(RSTn), .Q(flag_rd_end) );
  DFFRQX2 \burst_cnt_reg[0]  ( .D(N117), .CK(CLK), .RN(RSTn), .Q(burst_cnt[0])
         );
  DFFRQX2 \row_addr_reg[11]  ( .D(n93), .CK(CLK), .RN(RSTn), .Q(row_addr[11])
         );
  DFFRQX2 \act_cnt_reg[2]  ( .D(N128), .CK(CLK), .RN(RSTn), .Q(act_cnt[2]) );
  DFFRQX2 \burst_cnt_reg[1]  ( .D(N118), .CK(CLK), .RN(RSTn), .Q(burst_cnt[1])
         );
  DFFRQX2 \act_cnt_reg[3]  ( .D(N129), .CK(CLK), .RN(RSTn), .Q(act_cnt[3]) );
  DFFRX1 \col_cnt_reg[2]  ( .D(n103), .CK(CLK), .RN(RSTn), .Q(col_cnt[2]), 
        .QN(n99) );
  DFFRX1 \col_cnt_reg[3]  ( .D(n102), .CK(CLK), .RN(RSTn), .Q(col_cnt[3]), 
        .QN(n98) );
  DFFRX1 \col_cnt_reg[4]  ( .D(n101), .CK(CLK), .RN(RSTn), .Q(col_cnt[4]), 
        .QN(n97) );
  DFFRQX2 rd_data_end_reg ( .D(N121), .CK(CLK), .RN(RSTn), .Q(rd_data_end) );
  DFFRQX2 \burst_cnt_t_reg[0]  ( .D(N119), .CK(CLK), .RN(RSTn), .Q(
        \burst_cnt_t[0] ) );
  DFFRQX2 \state_reg[3]  ( .D(n107), .CK(CLK), .RN(RSTn), .Q(state[3]) );
  DFFRQX2 flag_rd_reg ( .D(n112), .CK(CLK), .RN(RSTn), .Q(flag_rd) );
  DFFRQX2 \break_cnt_reg[1]  ( .D(n126), .CK(CLK), .RN(RSTn), .Q(break_cnt[1])
         );
  DFFRQX2 \col_cnt_reg[6]  ( .D(n106), .CK(CLK), .RN(RSTn), .Q(col_cnt[6]) );
  DFFRQX2 \row_addr_reg[1]  ( .D(n92), .CK(CLK), .RN(RSTn), .Q(row_addr[1]) );
  DFFRQX2 \row_addr_reg[2]  ( .D(n91), .CK(CLK), .RN(RSTn), .Q(row_addr[2]) );
  DFFRQX2 \row_addr_reg[3]  ( .D(n90), .CK(CLK), .RN(RSTn), .Q(row_addr[3]) );
  DFFRQX2 \row_addr_reg[4]  ( .D(n89), .CK(CLK), .RN(RSTn), .Q(row_addr[4]) );
  DFFRQX2 \row_addr_reg[5]  ( .D(n88), .CK(CLK), .RN(RSTn), .Q(row_addr[5]) );
  DFFRQX2 \row_addr_reg[10]  ( .D(n83), .CK(CLK), .RN(RSTn), .Q(row_addr[10])
         );
  DFFRQX2 \act_cnt_reg[0]  ( .D(N126), .CK(CLK), .RN(RSTn), .Q(act_cnt[0]) );
  DFFRQX2 \state_reg[2]  ( .D(n108), .CK(CLK), .RN(RSTn), .Q(state[2]) );
  DFFRQX2 \state_reg[4]  ( .D(n111), .CK(CLK), .RN(RSTn), .Q(state[4]) );
  DFFRQX2 \act_cnt_reg[1]  ( .D(N127), .CK(CLK), .RN(RSTn), .Q(act_cnt[1]) );
  DFFRQX2 \row_addr_reg[6]  ( .D(n87), .CK(CLK), .RN(RSTn), .Q(row_addr[6]) );
  DFFRQX2 \row_addr_reg[9]  ( .D(n84), .CK(CLK), .RN(RSTn), .Q(row_addr[9]) );
  DFFRQX2 \row_addr_reg[8]  ( .D(n85), .CK(CLK), .RN(RSTn), .Q(row_addr[8]) );
  DFFRQX2 \row_addr_reg[7]  ( .D(n86), .CK(CLK), .RN(RSTn), .Q(row_addr[7]) );
  DFFRQX2 \break_cnt_reg[0]  ( .D(N136), .CK(CLK), .RN(RSTn), .Q(break_cnt[0])
         );
  DFFRQX2 \col_cnt_reg[1]  ( .D(n104), .CK(CLK), .RN(RSTn), .Q(col_cnt[1]) );
  DFFRQX2 sd_row_end_reg ( .D(n113), .CK(CLK), .RN(RSTn), .Q(sd_row_end) );
  DFFRQX2 \break_cnt_reg[3]  ( .D(N139), .CK(CLK), .RN(RSTn), .Q(break_cnt[3])
         );
  DFFRX1 \col_cnt_reg[5]  ( .D(n100), .CK(CLK), .RN(RSTn), .Q(col_cnt[5]), 
        .QN(n96) );
  DFFRQX2 \col_cnt_reg[0]  ( .D(n105), .CK(CLK), .RN(RSTn), .Q(col_cnt[0]) );
  DFFRQX2 \row_addr_reg[0]  ( .D(n94), .CK(CLK), .RN(RSTn), .Q(row_addr[0]) );
  DFFRQX2 \break_cnt_reg[2]  ( .D(N138), .CK(CLK), .RN(RSTn), .Q(break_cnt[2])
         );
  DFFRQX2 \state_reg[1]  ( .D(n109), .CK(CLK), .RN(RSTn), .Q(rd_req) );
  DFFRX1 \burst_cnt_t_reg[1]  ( .D(N120), .CK(CLK), .RN(RSTn), .Q(n2), .QN(n95) );
  DFFSQXL \rd_cmd_reg[2]  ( .D(N114), .CK(CLK), .SN(RSTn), .Q(rd_cmd[2]) );
  DFFSQXL \rd_cmd_reg[1]  ( .D(N113), .CK(CLK), .SN(RSTn), .Q(rd_cmd[1]) );
  DFFSQXL \rd_cmd_reg[0]  ( .D(N112), .CK(CLK), .SN(RSTn), .Q(rd_cmd[0]) );
  DFFSQXL \state_reg[0]  ( .D(n110), .CK(CLK), .SN(RSTn), .Q(state_0) );
  OAI31X1 U3 ( .A0(n129), .A1(n9), .A2(n24), .B0(n56), .Y(N199) );
  OR3X2 U4 ( .A(n35), .B(state_0), .C(n58), .Y(n1) );
  CLKBUFX2 U5 ( .A(ref_req), .Y(n3) );
  INVX2 U6 ( .A(n1), .Y(n4) );
  INVX2 U7 ( .A(n1), .Y(n5) );
  INVX2 U8 ( .A(n40), .Y(n6) );
  INVX2 U9 ( .A(n6), .Y(n7) );
  INVX2 U10 ( .A(act_cnt[1]), .Y(n8) );
  INVX2 U11 ( .A(n8), .Y(n9) );
  INVX2 U12 ( .A(flag_rd), .Y(n10) );
  INVX2 U13 ( .A(n10), .Y(n11) );
  INVX2 U14 ( .A(n54), .Y(n12) );
  INVX2 U15 ( .A(n12), .Y(n13) );
  INVX2 U16 ( .A(n40), .Y(n14) );
  INVX2 U17 ( .A(break_cnt[2]), .Y(n15) );
  INVX2 U18 ( .A(n15), .Y(n16) );
  INVX2 U19 ( .A(n131), .Y(n18) );
  INVX2 U20 ( .A(n18), .Y(n19) );
  INVX2 U21 ( .A(n28), .Y(n20) );
  INVX2 U22 ( .A(n20), .Y(n21) );
  INVX2 U23 ( .A(state_0), .Y(n25) );
  INVX2 U24 ( .A(n25), .Y(n26) );
  INVX2 U25 ( .A(rd_req), .Y(n34) );
  INVX2 U26 ( .A(n34), .Y(n35) );
  INVX2 U27 ( .A(n59), .Y(n39) );
  INVX2 U28 ( .A(n39), .Y(n41) );
  INVX2 U29 ( .A(n39), .Y(n42) );
  INVX2 U30 ( .A(N199), .Y(n43) );
  INVX2 U31 ( .A(n43), .Y(n45) );
  INVX2 U32 ( .A(n43), .Y(n48) );
  INVX2 U33 ( .A(n43), .Y(n49) );
  INVX2 U34 ( .A(n58), .Y(n50) );
  INVX2 U35 ( .A(n50), .Y(n52) );
  INVX2 U36 ( .A(n50), .Y(n55) );
  INVX2 U37 ( .A(n50), .Y(n57) );
  INVX2 U38 ( .A(n17), .Y(n62) );
  INVX2 U39 ( .A(n62), .Y(n63) );
  INVX2 U40 ( .A(n62), .Y(n65) );
  INVX2 U41 ( .A(n62), .Y(n67) );
  NOR4X2 U42 ( .A(n131), .B(n136), .C(n35), .D(state_0), .Y(n28) );
  NAND3XL U43 ( .A(n135), .B(n131), .C(state[2]), .Y(n58) );
  NAND2X2 U44 ( .A(N130), .B(n54), .Y(n64) );
  INVX2 U45 ( .A(N130), .Y(n125) );
  INVX2 U46 ( .A(n120), .Y(n115) );
  INVX2 U47 ( .A(n120), .Y(n77) );
  INVX2 U48 ( .A(n120), .Y(n69) );
  INVX2 U49 ( .A(n119), .Y(n118) );
  INVX2 U50 ( .A(n119), .Y(n117) );
  INVX2 U51 ( .A(n119), .Y(n116) );
  NOR3X1 U52 ( .A(n30), .B(n124), .C(n123), .Y(n36) );
  INVX2 U53 ( .A(n4), .Y(n130) );
  NAND2X2 U54 ( .A(n79), .B(n21), .Y(N112) );
  OAI22X1 U55 ( .A0(n135), .A1(n22), .B0(n23), .B1(n24), .Y(n107) );
  OAI2BB2X2 U56 ( .B0(n69), .B1(n153), .A0N(N170), .A1N(n116), .Y(n83) );
  OAI2BB2X2 U57 ( .B0(n69), .B1(n152), .A0N(N169), .A1N(n118), .Y(n84) );
  OAI2BB2X2 U58 ( .B0(n69), .B1(n151), .A0N(N168), .A1N(n118), .Y(n85) );
  OAI2BB2X2 U59 ( .B0(n77), .B1(n150), .A0N(N167), .A1N(n118), .Y(n86) );
  OAI2BB2X2 U60 ( .B0(n77), .B1(n149), .A0N(N166), .A1N(n117), .Y(n87) );
  OAI2BB2X2 U61 ( .B0(n115), .B1(n148), .A0N(N165), .A1N(n118), .Y(n88) );
  OAI2BB2X2 U62 ( .B0(n115), .B1(n147), .A0N(N164), .A1N(n117), .Y(n89) );
  OAI2BB2X2 U63 ( .B0(n115), .B1(n146), .A0N(N163), .A1N(n117), .Y(n90) );
  OAI2BB2X2 U64 ( .B0(n115), .B1(n145), .A0N(N162), .A1N(n116), .Y(n91) );
  OAI2BB2X2 U65 ( .B0(n77), .B1(n144), .A0N(N161), .A1N(n117), .Y(n92) );
  OAI2BB2X2 U66 ( .B0(n19), .B1(n22), .A0N(n22), .A1N(n7), .Y(n111) );
  OAI2BB2X2 U67 ( .B0(n63), .B1(n142), .A0N(N143), .A1N(n65), .Y(n104) );
  INVX2 U68 ( .A(n31), .Y(n132) );
  INVX2 U69 ( .A(n44), .Y(n136) );
  NOR2X2 U70 ( .A(n14), .B(n139), .Y(N120) );
  NAND2X2 U71 ( .A(n133), .B(n134), .Y(n24) );
  OAI2BB1X1 U72 ( .A0N(n21), .A1N(n36), .B0(n37), .Y(n110) );
  AOI32XL U73 ( .A0(n32), .A1(n132), .A2(n38), .B0(n127), .B1(n33), .Y(n37) );
  INVX2 U74 ( .A(n32), .Y(n127) );
  NOR3X1 U75 ( .A(n7), .B(n28), .C(n5), .Y(n38) );
  INVX2 U76 ( .A(n70), .Y(n128) );
  INVX2 U77 ( .A(n29), .Y(n124) );
  INVX2 U78 ( .A(N126), .Y(n129) );
  NAND2X2 U79 ( .A(N117), .B(n139), .Y(N113) );
  OAI22X1 U80 ( .A0(n138), .A1(n41), .B0(n122), .B1(n55), .Y(N186) );
  OAI22X1 U81 ( .A0(n141), .A1(n42), .B0(n145), .B1(n52), .Y(N188) );
  OAI22X1 U82 ( .A0(n142), .A1(n59), .B0(n146), .B1(n57), .Y(N189) );
  OAI22X1 U83 ( .A0(n140), .A1(n42), .B0(n151), .B1(n55), .Y(N194) );
  OAI22X1 U84 ( .A0(n153), .A1(n55), .B0(n136), .B1(n19), .Y(N196) );
  NOR2X2 U85 ( .A(n152), .B(n52), .Y(N195) );
  NOR2X2 U86 ( .A(n143), .B(n57), .Y(N197) );
  NOR3X1 U87 ( .A(n35), .B(n26), .C(n41), .Y(n40) );
  NOR2X2 U88 ( .A(n138), .B(n95), .Y(n17) );
  NOR4X2 U89 ( .A(n34), .B(n136), .C(state[4]), .D(n26), .Y(n31) );
  NOR4X2 U90 ( .A(break_cnt[0]), .B(break_cnt[1]), .C(break_cnt[2]), .D(
        break_cnt[3]), .Y(n79) );
  OAI211XL U91 ( .A0(n28), .A1(n7), .B0(n46), .C0(n47), .Y(n22) );
  OAI31X1 U92 ( .A0(n30), .A1(n36), .A2(n124), .B0(n28), .Y(n46) );
  AOI32XL U93 ( .A0(n138), .A1(n2), .A2(n124), .B0(n40), .B1(n51), .Y(n47) );
  INVX2 U94 ( .A(sd_row_end), .Y(n119) );
  NOR4X2 U95 ( .A(row_addr[9]), .B(row_addr[8]), .C(row_addr[7]), .D(
        row_addr[6]), .Y(n76) );
  INVX2 U96 ( .A(sd_row_end), .Y(n120) );
  OAI32XL U97 ( .A0(n125), .A1(n16), .A2(n13), .B0(n15), .B1(n64), .Y(N138) );
  OAI32XL U98 ( .A0(n60), .A1(break_cnt[3]), .A2(n13), .B0(n61), .B1(n137), 
        .Y(N139) );
  INVX2 U99 ( .A(break_cnt[3]), .Y(n137) );
  NAND2XL U100 ( .A(n16), .B(N130), .Y(n60) );
  OA21X1 U101 ( .A0(n125), .A1(break_cnt[2]), .B0(n64), .Y(n61) );
  OAI21X1 U102 ( .A0(n9), .A1(n130), .B0(n129), .Y(n70) );
  OAI32XL U103 ( .A0(n133), .A1(act_cnt[3]), .A2(n23), .B0(n68), .B1(n134), 
        .Y(N129) );
  AOI21X1 U104 ( .A0(n5), .A1(n133), .B0(n70), .Y(n68) );
  OAI222X1 U105 ( .A0(n32), .A1(n33), .B0(rd_en), .B1(n132), .C0(n29), .C1(n20), .Y(n109) );
  NOR2X2 U106 ( .A(state[3]), .B(state[2]), .Y(n44) );
  OR3X2 U107 ( .A(state[2]), .B(state[4]), .C(n135), .Y(n59) );
  NAND4X2 U108 ( .A(n26), .B(n44), .C(n34), .D(n19), .Y(n32) );
  NAND4X2 U109 ( .A(col_cnt[0]), .B(col_cnt[1]), .C(col_cnt[6]), .D(n75), .Y(
        n53) );
  NOR4X2 U110 ( .A(n96), .B(n97), .C(n98), .D(n99), .Y(n75) );
  NAND3XL U111 ( .A(act_cnt[0]), .B(n5), .C(act_cnt[1]), .Y(n23) );
  NOR2X2 U112 ( .A(n130), .B(act_cnt[0]), .Y(N126) );
  OAI2B11X2 U113 ( .A1N(n24), .A0(n130), .B0(n128), .C0(n27), .Y(n108) );
  AOI32XL U114 ( .A0(n21), .A1(n29), .A2(n30), .B0(rd_en), .B1(n31), .Y(n27)
         );
  OAI211XL U115 ( .A0(n79), .A1(n20), .B0(n80), .C0(n81), .Y(N114) );
  NOR3X1 U116 ( .A(n82), .B(n26), .C(rd_req), .Y(n81) );
  OAI31X1 U117 ( .A0(n24), .A1(n9), .A2(act_cnt[0]), .B0(n5), .Y(n80) );
  OA21X1 U118 ( .A0(n19), .A1(n136), .B0(n58), .Y(n82) );
  NOR2X2 U119 ( .A(n6), .B(burst_cnt[0]), .Y(N117) );
  OAI22X1 U120 ( .A0(n128), .A1(n133), .B0(act_cnt[2]), .B1(n23), .Y(N128) );
  OAI2B2X1 U121 ( .A1N(n11), .A0(rd_data_end), .B0(n11), .B1(n33), .Y(n112) );
  NOR3X1 U122 ( .A(n53), .B(n95), .C(\burst_cnt_t[0] ), .Y(n113) );
  OAI2BB2X2 U123 ( .B0(n77), .B1(n143), .A0N(N171), .A1N(n116), .Y(n93) );
  OAI2BB2X2 U124 ( .B0(n69), .B1(n122), .A0N(N160), .A1N(n116), .Y(n94) );
  NOR3X1 U125 ( .A(n13), .B(break_cnt[3]), .C(n16), .Y(n114) );
  NAND2X2 U126 ( .A(break_cnt[1]), .B(break_cnt[0]), .Y(n54) );
  NOR4X2 U127 ( .A(n72), .B(n73), .C(n53), .D(n74), .Y(N121) );
  NAND4X2 U128 ( .A(n153), .B(n143), .C(n144), .D(n145), .Y(n73) );
  NAND4X2 U129 ( .A(n147), .B(n148), .C(n146), .D(n76), .Y(n72) );
  NAND2X2 U130 ( .A(n63), .B(row_addr[0]), .Y(n74) );
  OAI2BB2X2 U131 ( .B0(n63), .B1(n141), .A0N(N142), .A1N(n17), .Y(n105) );
  OAI2BB2X2 U132 ( .B0(n67), .B1(n140), .A0N(N148), .A1N(n67), .Y(n106) );
  OAI2BB2X2 U133 ( .B0(n96), .B1(n65), .A0N(N147), .A1N(n63), .Y(n100) );
  OAI2BB2X2 U134 ( .B0(n97), .B1(n17), .A0N(N146), .A1N(n65), .Y(n101) );
  OAI2BB2X2 U135 ( .B0(n98), .B1(n67), .A0N(N145), .A1N(n17), .Y(n102) );
  OAI2BB2X2 U136 ( .B0(n99), .B1(n65), .A0N(N144), .A1N(n67), .Y(n103) );
  NAND2X2 U137 ( .A(n3), .B(flag_rd), .Y(n29) );
  NOR2X2 U138 ( .A(break_cnt[0]), .B(n125), .Y(N136) );
  INVX2 U139 ( .A(n66), .Y(n126) );
  OAI211XL U141 ( .A0(break_cnt[0]), .A1(break_cnt[1]), .B0(N130), .C0(n13), 
        .Y(n66) );
  INVX2 U142 ( .A(state[4]), .Y(n131) );
  AOI2BB1X2 U143 ( .A0N(n3), .A1N(rd_data_end), .B0(n20), .Y(N200) );
  AND2X2 U144 ( .A(flag_pre_end), .B(n11), .Y(n30) );
  NOR2X2 U145 ( .A(n71), .B(n130), .Y(N127) );
  XNOR2X1 U146 ( .A(act_cnt[0]), .B(n9), .Y(n71) );
  NOR2BX1 U147 ( .AN(burst_cnt[0]), .B(n14), .Y(N119) );
  NOR2X2 U148 ( .A(n78), .B(n14), .Y(N118) );
  XNOR2X1 U149 ( .A(burst_cnt[0]), .B(burst_cnt[1]), .Y(n78) );
  OAI2BB1X1 U150 ( .A0N(sd_row_end), .A1N(n11), .B0(n123), .Y(n51) );
  INVX2 U151 ( .A(act_cnt[2]), .Y(n133) );
  INVX2 U152 ( .A(state[3]), .Y(n135) );
  INVX2 U153 ( .A(row_addr[10]), .Y(n153) );
  INVX2 U154 ( .A(row_addr[4]), .Y(n147) );
  INVX2 U155 ( .A(row_addr[2]), .Y(n145) );
  INVX2 U156 ( .A(row_addr[5]), .Y(n148) );
  INVX2 U157 ( .A(row_addr[3]), .Y(n146) );
  INVX2 U158 ( .A(row_addr[1]), .Y(n144) );
  INVX2 U159 ( .A(row_addr[9]), .Y(n152) );
  INVX2 U160 ( .A(row_addr[11]), .Y(n143) );
  INVX2 U161 ( .A(burst_cnt[1]), .Y(n139) );
  INVX2 U162 ( .A(\burst_cnt_t[0] ), .Y(n138) );
  INVX2 U163 ( .A(row_addr[0]), .Y(n122) );
  INVX2 U164 ( .A(col_cnt[0]), .Y(n141) );
  INVX2 U165 ( .A(col_cnt[1]), .Y(n142) );
  INVX2 U166 ( .A(row_addr[7]), .Y(n150) );
  INVX2 U167 ( .A(row_addr[8]), .Y(n151) );
  INVX2 U168 ( .A(row_addr[6]), .Y(n149) );
  INVX2 U169 ( .A(act_cnt[3]), .Y(n134) );
  INVX2 U170 ( .A(rd_data_end), .Y(n123) );
  INVX2 U171 ( .A(col_cnt[6]), .Y(n140) );
  AND2X2 U172 ( .A(N112), .B(n14), .Y(n56) );
  OAI22X1 U173 ( .A0(n95), .A1(n59), .B0(n144), .B1(n52), .Y(N187) );
  OAI22X1 U174 ( .A0(n99), .A1(n42), .B0(n147), .B1(n57), .Y(N190) );
  OAI22X1 U175 ( .A0(n98), .A1(n41), .B0(n148), .B1(n55), .Y(N191) );
  OAI22X1 U176 ( .A0(n97), .A1(n42), .B0(n149), .B1(n52), .Y(N192) );
  OAI22X1 U177 ( .A0(n96), .A1(n59), .B0(n150), .B1(n57), .Y(N193) );
  INVX2 U178 ( .A(rd_trig), .Y(n33) );
  OR2X1 U179 ( .A(state[3]), .B(state[2]), .Y(n121) );
  OAI31X1 U180 ( .A0(n121), .A1(n35), .A2(state_0), .B0(state[4]), .Y(N130) );
endmodule


module sdram_top ( S_CLK, S_RSTn, sdram_clk, sdram_cke, sdram_cs_n, 
        sdram_cas_n, sdram_ras_n, sdram_we_n, sdram_bank, sdram_addr, 
        sdram_dqm, sdram_dq, wr_trig, rd_trig );
  output [1:0] sdram_bank;
  output [11:0] sdram_addr;
  output [3:0] sdram_dqm;
  inout [15:0] sdram_dq;
  input S_CLK, S_RSTn, wr_trig, rd_trig;
  output sdram_clk, sdram_cke, sdram_cs_n, sdram_cas_n, sdram_ras_n,
         sdram_we_n;
  wire   flag_init_end, flag_ref_end, flag_wr_end, flag_rd_end, ref_en, wr_en,
         rd_en, N79, N81, N82, N83, ref_req, N126, wr_req, N128, rd_req, N130,
         n1, n2, n3, n5, n7, n10, n11, n12, n13, n14, n15, n16, n26, n27, n28,
         n29, n34, n35, n38, n39, n42, n44, n45, n51, n56, n57, n60, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n97, n98, n99,
         n100, n101, n102, n103, n104, n105, n106, n107;
  wire   [4:0] state;
  wire   [3:0] init_cmd;
  wire   [11:0] init_addr;
  wire   [3:0] ref_cmd;
  wire   [3:0] wr_cmd;
  wire   [11:0] wr_addr;
  wire   [3:0] rd_cmd;
  wire   [11:0] rd_addr;
  wire   [15:0] wr_data;
  tri   [15:0] sdram_dq;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24;
  assign sdram_cke = 1'b1;
  assign sdram_dqm[0] = 1'b0;
  assign sdram_dqm[1] = 1'b0;
  assign sdram_dqm[2] = 1'b0;
  assign sdram_dqm[3] = 1'b0;
  assign sdram_cs_n = 1'b0;
  assign sdram_bank[1] = 1'b0;
  assign sdram_bank[0] = 1'b0;

  sdram_init sdram_init_inst ( .CLK(S_CLK), .RSTn(S_RSTn), .cmd_reg({
        SYNOPSYS_UNCONNECTED__0, init_cmd[2:0]}), .sdram_addr({
        SYNOPSYS_UNCONNECTED__1, init_addr[10], SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, 
        SYNOPSYS_UNCONNECTED__5, init_addr[5:4], SYNOPSYS_UNCONNECTED__6, 
        SYNOPSYS_UNCONNECTED__7, init_addr[1], SYNOPSYS_UNCONNECTED__8}), 
        .flag_init_end(flag_init_end) );
  sdram_aref sdram_aref_inst ( .CLK(S_CLK), .RSTn(S_RSTn), .ref_en(n64), 
        .flag_init_end(flag_init_end), .ref_req(ref_req), .flag_ref_end(
        flag_ref_end), .aref_cmd({SYNOPSYS_UNCONNECTED__9, ref_cmd[2:0]}) );
  sdram_write sdram_write_inst ( .CLK(S_CLK), .RSTn(S_RSTn), .wr_en(wr_en), 
        .wr_req(wr_req), .flag_wr_end(flag_wr_end), .wr_cmd({
        SYNOPSYS_UNCONNECTED__10, wr_cmd[2:0]}), .wr_addr(wr_addr), .wr_trig(
        wr_trig), .ref_req(ref_req), .wr_data({SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, wr_data[3:1], SYNOPSYS_UNCONNECTED__23}) );
  sdram_read sdram_read_inst ( .CLK(S_CLK), .RSTn(S_RSTn), .rd_en(rd_en), 
        .rd_req(rd_req), .flag_rd_end(flag_rd_end), .rd_cmd({
        SYNOPSYS_UNCONNECTED__24, rd_cmd[2:0]}), .rd_addr(rd_addr), .rd_trig(
        rd_trig), .ref_req(ref_req) );
  DFFRQX2 ref_en_reg ( .D(N126), .CK(S_CLK), .RN(S_RSTn), .Q(ref_en) );
  DFFRQX2 rd_en_reg ( .D(N130), .CK(S_CLK), .RN(S_RSTn), .Q(rd_en) );
  DFFRQX2 wr_en_reg ( .D(N128), .CK(S_CLK), .RN(S_RSTn), .Q(wr_en) );
  DFFRQX2 \state_reg[3]  ( .D(N82), .CK(S_CLK), .RN(S_RSTn), .Q(state[3]) );
  DFFRQX2 \state_reg[4]  ( .D(N83), .CK(S_CLK), .RN(S_RSTn), .Q(state[4]) );
  DFFRQX2 \state_reg[2]  ( .D(N81), .CK(S_CLK), .RN(S_RSTn), .Q(state[2]) );
  DFFRQX2 \state_reg[1]  ( .D(n97), .CK(S_CLK), .RN(S_RSTn), .Q(state[1]) );
  INVX2 U59 ( .A(S_CLK), .Y(sdram_clk) );
  TBUFX1 \sdram_dq_tri[2]  ( .A(wr_data[2]), .OE(n89), .Y(sdram_dq[2]) );
  TBUFX1 \sdram_dq_tri[3]  ( .A(wr_data[3]), .OE(n86), .Y(sdram_dq[3]) );
  DFFSQXL \state_reg[0]  ( .D(N79), .CK(S_CLK), .SN(S_RSTn), .Q(state[0]) );
  TBUFX1 \sdram_dq_tri[0]  ( .A(1'b1), .OE(n88), .Y(sdram_dq[0]) );
  TBUFX1 \sdram_dq_tri[1]  ( .A(wr_data[1]), .OE(n87), .Y(sdram_dq[1]) );
  TBUFX1 \sdram_dq_tri[4]  ( .A(1'b0), .OE(n89), .Y(sdram_dq[4]) );
  TBUFX1 \sdram_dq_tri[5]  ( .A(1'b0), .OE(n86), .Y(sdram_dq[5]) );
  TBUFX1 \sdram_dq_tri[6]  ( .A(1'b0), .OE(n89), .Y(sdram_dq[6]) );
  TBUFX1 \sdram_dq_tri[7]  ( .A(1'b0), .OE(n86), .Y(sdram_dq[7]) );
  TBUFX1 \sdram_dq_tri[8]  ( .A(1'b0), .OE(n89), .Y(sdram_dq[8]) );
  TBUFX1 \sdram_dq_tri[9]  ( .A(1'b0), .OE(n86), .Y(sdram_dq[9]) );
  TBUFX1 \sdram_dq_tri[10]  ( .A(1'b0), .OE(n87), .Y(sdram_dq[10]) );
  TBUFX1 \sdram_dq_tri[11]  ( .A(1'b0), .OE(n88), .Y(sdram_dq[11]) );
  TBUFX1 \sdram_dq_tri[12]  ( .A(1'b0), .OE(n87), .Y(sdram_dq[12]) );
  TBUFX1 \sdram_dq_tri[13]  ( .A(1'b0), .OE(n88), .Y(sdram_dq[13]) );
  TBUFX1 \sdram_dq_tri[14]  ( .A(1'b0), .OE(n87), .Y(sdram_dq[14]) );
  TBUFX1 \sdram_dq_tri[15]  ( .A(1'b0), .OE(n88), .Y(sdram_dq[15]) );
  AND4X2 U87 ( .A(n72), .B(n56), .C(n105), .D(n106), .Y(n60) );
  AO22X2 U88 ( .A0(wr_addr[9]), .A1(n57), .B0(rd_addr[9]), .B1(n77), .Y(
        sdram_addr[9]) );
  CLKBUFX2 U89 ( .A(ref_req), .Y(n62) );
  INVX2 U90 ( .A(ref_en), .Y(n63) );
  INVX2 U91 ( .A(n63), .Y(n64) );
  INVX2 U92 ( .A(n5), .Y(n65) );
  INVX2 U93 ( .A(n65), .Y(n66) );
  INVX2 U94 ( .A(n60), .Y(n67) );
  INVX2 U95 ( .A(n60), .Y(n68) );
  INVX2 U96 ( .A(n1), .Y(n69) );
  INVX2 U97 ( .A(n69), .Y(n70) );
  INVX2 U98 ( .A(state[1]), .Y(n71) );
  INVX2 U99 ( .A(n71), .Y(n72) );
  INVX2 U100 ( .A(n11), .Y(n73) );
  INVX2 U101 ( .A(n73), .Y(n74) );
  INVX2 U102 ( .A(n10), .Y(n75) );
  INVX2 U103 ( .A(n75), .Y(n76) );
  INVX2 U104 ( .A(n75), .Y(n77) );
  INVX2 U105 ( .A(n75), .Y(n78) );
  NOR2BX1 U106 ( .AN(n66), .B(state[1]), .Y(n57) );
  INVX2 U107 ( .A(n94), .Y(n90) );
  INVX2 U108 ( .A(n93), .Y(n86) );
  INVX2 U109 ( .A(n93), .Y(n89) );
  INVX2 U110 ( .A(n93), .Y(n87) );
  INVX2 U111 ( .A(n93), .Y(n88) );
  INVX2 U112 ( .A(n94), .Y(n91) );
  INVX2 U113 ( .A(n94), .Y(n92) );
  INVX2 U114 ( .A(n16), .Y(n100) );
  INVX2 U115 ( .A(n14), .Y(n102) );
  INVX2 U116 ( .A(n57), .Y(n94) );
  INVX2 U117 ( .A(n57), .Y(n95) );
  OAI32XL U118 ( .A0(n51), .A1(n76), .A2(n101), .B0(flag_init_end), .B1(n73), 
        .Y(N79) );
  NAND3XL U119 ( .A(n95), .B(n73), .C(n103), .Y(n51) );
  INVX2 U120 ( .A(n68), .Y(n101) );
  INVX2 U121 ( .A(n12), .Y(n103) );
  INVX2 U122 ( .A(n57), .Y(n93) );
  NOR4X2 U123 ( .A(n107), .B(state[0]), .C(state[2]), .D(state[4]), .Y(n5) );
  AOI31X1 U124 ( .A0(n15), .A1(n1), .A2(n14), .B0(state[1]), .Y(n2) );
  NOR2X2 U125 ( .A(n5), .B(n100), .Y(n15) );
  NOR2X2 U126 ( .A(state[4]), .B(state[3]), .Y(n56) );
  NAND4X2 U127 ( .A(state[4]), .B(n105), .C(n106), .D(n107), .Y(n16) );
  NAND3XL U128 ( .A(n56), .B(n105), .C(state[2]), .Y(n1) );
  NAND3XL U129 ( .A(n56), .B(n106), .C(state[0]), .Y(n14) );
  OAI2B11X2 U130 ( .A1N(ref_cmd[0]), .A0(n70), .B0(n2), .C0(n3), .Y(sdram_we_n) );
  AOI222XL U131 ( .A0(init_cmd[0]), .A1(n102), .B0(wr_cmd[0]), .B1(n66), .C0(
        rd_cmd[0]), .C1(n100), .Y(n3) );
  OAI2B11X2 U132 ( .A1N(ref_cmd[2]), .A0(n70), .B0(n2), .C0(n7), .Y(
        sdram_ras_n) );
  AOI222XL U133 ( .A0(init_cmd[2]), .A1(n102), .B0(wr_cmd[2]), .B1(n66), .C0(
        rd_cmd[2]), .C1(n100), .Y(n7) );
  OAI2B11X2 U134 ( .A1N(ref_cmd[1]), .A0(n70), .B0(n2), .C0(n13), .Y(
        sdram_cas_n) );
  AOI222XL U135 ( .A0(init_cmd[1]), .A1(n102), .B0(wr_cmd[1]), .B1(n66), .C0(
        rd_cmd[1]), .C1(n100), .Y(n13) );
  INVX2 U136 ( .A(state[2]), .Y(n106) );
  INVX2 U137 ( .A(state[0]), .Y(n105) );
  INVX2 U138 ( .A(state[3]), .Y(n107) );
  NOR2X2 U139 ( .A(n16), .B(n72), .Y(n10) );
  NOR2X2 U140 ( .A(n14), .B(n72), .Y(n11) );
  INVX2 U141 ( .A(n42), .Y(n97) );
  AOI221XL U142 ( .A0(n74), .A1(flag_init_end), .B0(n12), .B1(flag_ref_end), 
        .C0(n98), .Y(n42) );
  INVX2 U143 ( .A(n44), .Y(n98) );
  AOI222XL U144 ( .A0(flag_rd_end), .A1(n76), .B0(n45), .B1(n99), .C0(
        flag_wr_end), .C1(n90), .Y(n44) );
  OAI32XL U145 ( .A0(n104), .A1(n64), .A2(n68), .B0(flag_wr_end), .B1(n95), 
        .Y(N82) );
  INVX2 U146 ( .A(wr_en), .Y(n104) );
  NOR2X2 U147 ( .A(n70), .B(n72), .Y(n12) );
  NOR3X1 U148 ( .A(ref_en), .B(wr_en), .C(n67), .Y(n45) );
  NOR4BX2 U149 ( .AN(rd_req), .B(wr_req), .C(ref_req), .D(n68), .Y(N130) );
  NOR3BX1 U150 ( .AN(wr_req), .B(n62), .C(n68), .Y(N128) );
  OAI2BB2X2 U151 ( .B0(flag_ref_end), .B1(n103), .A0N(n64), .A1N(n101), .Y(N81) );
  AO2B2X2 U152 ( .B0(n45), .B1(rd_en), .A0(n76), .A1N(flag_rd_end), .Y(N83) );
  AND2X2 U153 ( .A(n62), .B(n101), .Y(N126) );
  INVX2 U154 ( .A(rd_en), .Y(n99) );
  NAND2X2 U155 ( .A(n34), .B(n35), .Y(sdram_addr[1]) );
  NAND2X2 U156 ( .A(init_addr[1]), .B(n74), .Y(n34) );
  AOI22XL U157 ( .A0(wr_addr[1]), .A1(n91), .B0(rd_addr[1]), .B1(n10), .Y(n35)
         );
  NAND2X2 U158 ( .A(n28), .B(n29), .Y(sdram_addr[4]) );
  NAND2X2 U159 ( .A(init_addr[4]), .B(n11), .Y(n28) );
  AOI22XL U160 ( .A0(wr_addr[4]), .A1(n91), .B0(rd_addr[4]), .B1(n77), .Y(n29)
         );
  NAND2X2 U161 ( .A(n26), .B(n27), .Y(sdram_addr[5]) );
  NAND2X2 U162 ( .A(init_addr[5]), .B(n74), .Y(n26) );
  AOI22XL U163 ( .A0(wr_addr[5]), .A1(n92), .B0(rd_addr[5]), .B1(n78), .Y(n27)
         );
  NAND2X2 U164 ( .A(n38), .B(n39), .Y(sdram_addr[10]) );
  AOI21X1 U165 ( .A0(init_addr[10]), .A1(n11), .B0(n12), .Y(n38) );
  AOI22XL U166 ( .A0(wr_addr[10]), .A1(n90), .B0(rd_addr[10]), .B1(n10), .Y(
        n39) );
  AO22X2 U167 ( .A0(wr_addr[0]), .A1(n90), .B0(rd_addr[0]), .B1(n78), .Y(
        sdram_addr[0]) );
  AO22X2 U168 ( .A0(wr_addr[11]), .A1(n90), .B0(rd_addr[11]), .B1(n76), .Y(
        sdram_addr[11]) );
  AO22X2 U169 ( .A0(wr_addr[2]), .A1(n91), .B0(rd_addr[2]), .B1(n77), .Y(
        sdram_addr[2]) );
  AO22X2 U170 ( .A0(wr_addr[3]), .A1(n91), .B0(rd_addr[3]), .B1(n78), .Y(
        sdram_addr[3]) );
  AO22X2 U171 ( .A0(wr_addr[6]), .A1(n92), .B0(rd_addr[6]), .B1(n10), .Y(
        sdram_addr[6]) );
  AO22X2 U172 ( .A0(wr_addr[7]), .A1(n92), .B0(rd_addr[7]), .B1(n77), .Y(
        sdram_addr[7]) );
  AO22X2 U173 ( .A0(wr_addr[8]), .A1(n92), .B0(rd_addr[8]), .B1(n78), .Y(
        sdram_addr[8]) );
endmodule


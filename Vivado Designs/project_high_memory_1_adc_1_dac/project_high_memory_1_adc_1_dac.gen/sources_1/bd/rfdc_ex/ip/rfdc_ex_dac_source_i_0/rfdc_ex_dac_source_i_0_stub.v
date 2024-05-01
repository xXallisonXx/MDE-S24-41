// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Thu Mar 21 19:20:02 2024
// Host        : LAPTOP-L57NIJPM running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_dac_source_i_0/rfdc_ex_dac_source_i_0_stub.v
// Design      : rfdc_ex_dac_source_i_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xczu67dr-fsve1156-2-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "exdes_rfdac_data_bram_stim,Vivado 2023.2" *)
module rfdc_ex_dac_source_i_0(s_axi_awaddr, s_axi_awvalid, s_axi_awready, 
  s_axi_wdata, s_axi_wvalid, s_axi_wready, s_axi_wstrb, s_axi_bresp, s_axi_bvalid, 
  s_axi_bready, s_axi_araddr, s_axi_arvalid, s_axi_arready, s_axi_rdata, s_axi_rresp, 
  s_axi_rvalid, s_axi_rready, m00_tdata, m00_tvalid, m00_tready, s00_user_tdata, 
  s00_user_tvalid, s00_user_tready, user_select_00, m0_axis_clock, m0_div2_axis_clock, 
  hw_trigger_0, hw_trigger_en_0, s_axi_aclk, s_axi_aresetn)
/* synthesis syn_black_box black_box_pad_pin="s_axi_awaddr[31:0],s_axi_awvalid,s_axi_awready,s_axi_wdata[31:0],s_axi_wvalid,s_axi_wready,s_axi_wstrb[3:0],s_axi_bresp[1:0],s_axi_bvalid,s_axi_bready,s_axi_araddr[31:0],s_axi_arvalid,s_axi_arready,s_axi_rdata[31:0],s_axi_rresp[1:0],s_axi_rvalid,s_axi_rready,m00_tdata[255:0],m00_tvalid,m00_tready,s00_user_tdata[255:0],s00_user_tvalid,s00_user_tready,user_select_00,m0_div2_axis_clock,hw_trigger_0,hw_trigger_en_0,s_axi_aresetn" */
/* synthesis syn_force_seq_prim="m0_axis_clock" */
/* synthesis syn_force_seq_prim="s_axi_aclk" */;
  input [31:0]s_axi_awaddr;
  input s_axi_awvalid;
  output s_axi_awready;
  input [31:0]s_axi_wdata;
  input s_axi_wvalid;
  output s_axi_wready;
  input [3:0]s_axi_wstrb;
  output [1:0]s_axi_bresp;
  output s_axi_bvalid;
  input s_axi_bready;
  input [31:0]s_axi_araddr;
  input s_axi_arvalid;
  output s_axi_arready;
  output [31:0]s_axi_rdata;
  output [1:0]s_axi_rresp;
  output s_axi_rvalid;
  input s_axi_rready;
  output [255:0]m00_tdata;
  output m00_tvalid;
  input m00_tready;
  input [255:0]s00_user_tdata;
  input s00_user_tvalid;
  output s00_user_tready;
  input user_select_00;
  input m0_axis_clock /* synthesis syn_isclock = 1 */;
  input m0_div2_axis_clock;
  input hw_trigger_0;
  input hw_trigger_en_0;
  input s_axi_aclk /* synthesis syn_isclock = 1 */;
  input s_axi_aresetn;
endmodule

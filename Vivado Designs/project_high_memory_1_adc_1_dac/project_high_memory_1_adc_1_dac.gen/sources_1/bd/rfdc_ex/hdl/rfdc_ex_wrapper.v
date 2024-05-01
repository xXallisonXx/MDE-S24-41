//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
//Date        : Thu Mar 21 19:17:06 2024
//Host        : LAPTOP-L57NIJPM running 64-bit major release  (build 9200)
//Command     : generate_target rfdc_ex_wrapper.bd
//Design      : rfdc_ex_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module rfdc_ex_wrapper
   (adc1_clk_clk_n,
    adc1_clk_clk_p,
    adc1_hw_trigger,
    adc1_hw_trigger_en,
    dac0_clk_clk_n,
    dac0_clk_clk_p,
    dac0_hw_trigger,
    dac0_hw_trigger_en,
    m10_0_tdata,
    m10_0_tready,
    m10_0_tvalid,
    m1_axis_aclk,
    s00_0_tdata,
    s00_0_tready,
    s00_0_tvalid,
    s0_axis_aclk,
    s_axi_aclk,
    s_axi_aresetn,
    sysref_in_diff_n,
    sysref_in_diff_p,
    user_select_00_0,
    vin10_v_n,
    vin10_v_p,
    vout00_v_n,
    vout00_v_p);
  input adc1_clk_clk_n;
  input adc1_clk_clk_p;
  input adc1_hw_trigger;
  input adc1_hw_trigger_en;
  input dac0_clk_clk_n;
  input dac0_clk_clk_p;
  input dac0_hw_trigger;
  input dac0_hw_trigger_en;
  output [127:0]m10_0_tdata;
  input m10_0_tready;
  output m10_0_tvalid;
  output m1_axis_aclk;
  input [255:0]s00_0_tdata;
  output s00_0_tready;
  input s00_0_tvalid;
  output s0_axis_aclk;
  input s_axi_aclk;
  input s_axi_aresetn;
  input sysref_in_diff_n;
  input sysref_in_diff_p;
  input user_select_00_0;
  input vin10_v_n;
  input vin10_v_p;
  output vout00_v_n;
  output vout00_v_p;

  wire adc1_clk_clk_n;
  wire adc1_clk_clk_p;
  wire adc1_hw_trigger;
  wire adc1_hw_trigger_en;
  wire dac0_clk_clk_n;
  wire dac0_clk_clk_p;
  wire dac0_hw_trigger;
  wire dac0_hw_trigger_en;
  wire [127:0]m10_0_tdata;
  wire m10_0_tready;
  wire m10_0_tvalid;
  wire m1_axis_aclk;
  wire [255:0]s00_0_tdata;
  wire s00_0_tready;
  wire s00_0_tvalid;
  wire s0_axis_aclk;
  wire s_axi_aclk;
  wire s_axi_aresetn;
  wire sysref_in_diff_n;
  wire sysref_in_diff_p;
  wire user_select_00_0;
  wire vin10_v_n;
  wire vin10_v_p;
  wire vout00_v_n;
  wire vout00_v_p;

  rfdc_ex rfdc_ex_i
       (.adc1_clk_clk_n(adc1_clk_clk_n),
        .adc1_clk_clk_p(adc1_clk_clk_p),
        .adc1_hw_trigger(adc1_hw_trigger),
        .adc1_hw_trigger_en(adc1_hw_trigger_en),
        .dac0_clk_clk_n(dac0_clk_clk_n),
        .dac0_clk_clk_p(dac0_clk_clk_p),
        .dac0_hw_trigger(dac0_hw_trigger),
        .dac0_hw_trigger_en(dac0_hw_trigger_en),
        .m10_0_tdata(m10_0_tdata),
        .m10_0_tready(m10_0_tready),
        .m10_0_tvalid(m10_0_tvalid),
        .m1_axis_aclk(m1_axis_aclk),
        .s00_0_tdata(s00_0_tdata),
        .s00_0_tready(s00_0_tready),
        .s00_0_tvalid(s00_0_tvalid),
        .s0_axis_aclk(s0_axis_aclk),
        .s_axi_aclk(s_axi_aclk),
        .s_axi_aresetn(s_axi_aresetn),
        .sysref_in_diff_n(sysref_in_diff_n),
        .sysref_in_diff_p(sysref_in_diff_p),
        .user_select_00_0(user_select_00_0),
        .vin10_v_n(vin10_v_n),
        .vin10_v_p(vin10_v_p),
        .vout00_v_n(vout00_v_n),
        .vout00_v_p(vout00_v_p));
endmodule

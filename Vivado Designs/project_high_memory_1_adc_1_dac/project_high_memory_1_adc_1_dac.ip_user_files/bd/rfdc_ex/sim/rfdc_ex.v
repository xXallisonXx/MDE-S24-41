//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
//Date        : Thu Mar 21 19:01:32 2024
//Host        : LAPTOP-L57NIJPM running 64-bit major release  (build 9200)
//Command     : generate_target rfdc_ex.bd
//Design      : rfdc_ex
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module clocking_block_imp_1Q9S2IC
   (clk_in1,
    clk_in2,
    clk_out1,
    locked,
    locked1,
    s0_axis_aclk,
    s_axi_aclk,
    s_axi_aresetn,
    s_axi_lite1_araddr,
    s_axi_lite1_arready,
    s_axi_lite1_arvalid,
    s_axi_lite1_awaddr,
    s_axi_lite1_awready,
    s_axi_lite1_awvalid,
    s_axi_lite1_bready,
    s_axi_lite1_bresp,
    s_axi_lite1_bvalid,
    s_axi_lite1_rdata,
    s_axi_lite1_rready,
    s_axi_lite1_rresp,
    s_axi_lite1_rvalid,
    s_axi_lite1_wdata,
    s_axi_lite1_wready,
    s_axi_lite1_wstrb,
    s_axi_lite1_wvalid,
    s_axi_lite_araddr,
    s_axi_lite_arready,
    s_axi_lite_arvalid,
    s_axi_lite_awaddr,
    s_axi_lite_awready,
    s_axi_lite_awvalid,
    s_axi_lite_bready,
    s_axi_lite_bresp,
    s_axi_lite_bvalid,
    s_axi_lite_rdata,
    s_axi_lite_rready,
    s_axi_lite_rresp,
    s_axi_lite_rvalid,
    s_axi_lite_wdata,
    s_axi_lite_wready,
    s_axi_lite_wstrb,
    s_axi_lite_wvalid);
  input clk_in1;
  input clk_in2;
  output clk_out1;
  output locked;
  output locked1;
  output s0_axis_aclk;
  input s_axi_aclk;
  input s_axi_aresetn;
  input [10:0]s_axi_lite1_araddr;
  output s_axi_lite1_arready;
  input s_axi_lite1_arvalid;
  input [10:0]s_axi_lite1_awaddr;
  output s_axi_lite1_awready;
  input s_axi_lite1_awvalid;
  input s_axi_lite1_bready;
  output [1:0]s_axi_lite1_bresp;
  output s_axi_lite1_bvalid;
  output [31:0]s_axi_lite1_rdata;
  input s_axi_lite1_rready;
  output [1:0]s_axi_lite1_rresp;
  output s_axi_lite1_rvalid;
  input [31:0]s_axi_lite1_wdata;
  output s_axi_lite1_wready;
  input [3:0]s_axi_lite1_wstrb;
  input s_axi_lite1_wvalid;
  input [10:0]s_axi_lite_araddr;
  output s_axi_lite_arready;
  input s_axi_lite_arvalid;
  input [10:0]s_axi_lite_awaddr;
  output s_axi_lite_awready;
  input s_axi_lite_awvalid;
  input s_axi_lite_bready;
  output [1:0]s_axi_lite_bresp;
  output s_axi_lite_bvalid;
  output [31:0]s_axi_lite_rdata;
  input s_axi_lite_rready;
  output [1:0]s_axi_lite_rresp;
  output s_axi_lite_rvalid;
  input [31:0]s_axi_lite_wdata;
  output s_axi_lite_wready;
  input [3:0]s_axi_lite_wstrb;
  input s_axi_lite_wvalid;

  wire [10:0]Conn1_ARADDR;
  wire Conn1_ARREADY;
  wire Conn1_ARVALID;
  wire [10:0]Conn1_AWADDR;
  wire Conn1_AWREADY;
  wire Conn1_AWVALID;
  wire Conn1_BREADY;
  wire [1:0]Conn1_BRESP;
  wire Conn1_BVALID;
  wire [31:0]Conn1_RDATA;
  wire Conn1_RREADY;
  wire [1:0]Conn1_RRESP;
  wire Conn1_RVALID;
  wire [31:0]Conn1_WDATA;
  wire Conn1_WREADY;
  wire [3:0]Conn1_WSTRB;
  wire Conn1_WVALID;
  wire clk_in2_1;
  wire clk_wiz_adc0_clk_out1;
  wire clk_wiz_adc0_locked;
  wire clk_wiz_dac0_clk_out1;
  wire clk_wiz_dac0_locked;
  wire [10:0]ex_design_M03_AXI_ARADDR;
  wire ex_design_M03_AXI_ARREADY;
  wire ex_design_M03_AXI_ARVALID;
  wire [10:0]ex_design_M03_AXI_AWADDR;
  wire ex_design_M03_AXI_AWREADY;
  wire ex_design_M03_AXI_AWVALID;
  wire ex_design_M03_AXI_BREADY;
  wire [1:0]ex_design_M03_AXI_BRESP;
  wire ex_design_M03_AXI_BVALID;
  wire [31:0]ex_design_M03_AXI_RDATA;
  wire ex_design_M03_AXI_RREADY;
  wire [1:0]ex_design_M03_AXI_RRESP;
  wire ex_design_M03_AXI_RVALID;
  wire [31:0]ex_design_M03_AXI_WDATA;
  wire ex_design_M03_AXI_WREADY;
  wire [3:0]ex_design_M03_AXI_WSTRB;
  wire ex_design_M03_AXI_WVALID;
  wire ex_design_clk_dac0;
  wire rst_s_axi_aclk_57M_interconnect_aresetn;
  wire s_axi_aclk_1;

  assign Conn1_ARADDR = s_axi_lite1_araddr[10:0];
  assign Conn1_ARVALID = s_axi_lite1_arvalid;
  assign Conn1_AWADDR = s_axi_lite1_awaddr[10:0];
  assign Conn1_AWVALID = s_axi_lite1_awvalid;
  assign Conn1_BREADY = s_axi_lite1_bready;
  assign Conn1_RREADY = s_axi_lite1_rready;
  assign Conn1_WDATA = s_axi_lite1_wdata[31:0];
  assign Conn1_WSTRB = s_axi_lite1_wstrb[3:0];
  assign Conn1_WVALID = s_axi_lite1_wvalid;
  assign clk_in2_1 = clk_in2;
  assign clk_out1 = clk_wiz_adc0_clk_out1;
  assign ex_design_M03_AXI_ARADDR = s_axi_lite_araddr[10:0];
  assign ex_design_M03_AXI_ARVALID = s_axi_lite_arvalid;
  assign ex_design_M03_AXI_AWADDR = s_axi_lite_awaddr[10:0];
  assign ex_design_M03_AXI_AWVALID = s_axi_lite_awvalid;
  assign ex_design_M03_AXI_BREADY = s_axi_lite_bready;
  assign ex_design_M03_AXI_RREADY = s_axi_lite_rready;
  assign ex_design_M03_AXI_WDATA = s_axi_lite_wdata[31:0];
  assign ex_design_M03_AXI_WSTRB = s_axi_lite_wstrb[3:0];
  assign ex_design_M03_AXI_WVALID = s_axi_lite_wvalid;
  assign ex_design_clk_dac0 = clk_in1;
  assign locked = clk_wiz_dac0_locked;
  assign locked1 = clk_wiz_adc0_locked;
  assign rst_s_axi_aclk_57M_interconnect_aresetn = s_axi_aresetn;
  assign s0_axis_aclk = clk_wiz_dac0_clk_out1;
  assign s_axi_aclk_1 = s_axi_aclk;
  assign s_axi_lite1_arready = Conn1_ARREADY;
  assign s_axi_lite1_awready = Conn1_AWREADY;
  assign s_axi_lite1_bresp[1:0] = Conn1_BRESP;
  assign s_axi_lite1_bvalid = Conn1_BVALID;
  assign s_axi_lite1_rdata[31:0] = Conn1_RDATA;
  assign s_axi_lite1_rresp[1:0] = Conn1_RRESP;
  assign s_axi_lite1_rvalid = Conn1_RVALID;
  assign s_axi_lite1_wready = Conn1_WREADY;
  assign s_axi_lite_arready = ex_design_M03_AXI_ARREADY;
  assign s_axi_lite_awready = ex_design_M03_AXI_AWREADY;
  assign s_axi_lite_bresp[1:0] = ex_design_M03_AXI_BRESP;
  assign s_axi_lite_bvalid = ex_design_M03_AXI_BVALID;
  assign s_axi_lite_rdata[31:0] = ex_design_M03_AXI_RDATA;
  assign s_axi_lite_rresp[1:0] = ex_design_M03_AXI_RRESP;
  assign s_axi_lite_rvalid = ex_design_M03_AXI_RVALID;
  assign s_axi_lite_wready = ex_design_M03_AXI_WREADY;
  rfdc_ex_clk_wiz_adc0_0 clk_wiz_adc0
       (.clk_in1(clk_in2_1),
        .clk_out1(clk_wiz_adc0_clk_out1),
        .locked(clk_wiz_adc0_locked),
        .s_axi_aclk(s_axi_aclk_1),
        .s_axi_araddr(Conn1_ARADDR),
        .s_axi_aresetn(rst_s_axi_aclk_57M_interconnect_aresetn),
        .s_axi_arready(Conn1_ARREADY),
        .s_axi_arvalid(Conn1_ARVALID),
        .s_axi_awaddr(Conn1_AWADDR),
        .s_axi_awready(Conn1_AWREADY),
        .s_axi_awvalid(Conn1_AWVALID),
        .s_axi_bready(Conn1_BREADY),
        .s_axi_bresp(Conn1_BRESP),
        .s_axi_bvalid(Conn1_BVALID),
        .s_axi_rdata(Conn1_RDATA),
        .s_axi_rready(Conn1_RREADY),
        .s_axi_rresp(Conn1_RRESP),
        .s_axi_rvalid(Conn1_RVALID),
        .s_axi_wdata(Conn1_WDATA),
        .s_axi_wready(Conn1_WREADY),
        .s_axi_wstrb(Conn1_WSTRB),
        .s_axi_wvalid(Conn1_WVALID));
  rfdc_ex_clk_wiz_dac0_0 clk_wiz_dac0
       (.clk_in1(ex_design_clk_dac0),
        .clk_out1(clk_wiz_dac0_clk_out1),
        .locked(clk_wiz_dac0_locked),
        .s_axi_aclk(s_axi_aclk_1),
        .s_axi_araddr(ex_design_M03_AXI_ARADDR),
        .s_axi_aresetn(rst_s_axi_aclk_57M_interconnect_aresetn),
        .s_axi_arready(ex_design_M03_AXI_ARREADY),
        .s_axi_arvalid(ex_design_M03_AXI_ARVALID),
        .s_axi_awaddr(ex_design_M03_AXI_AWADDR),
        .s_axi_awready(ex_design_M03_AXI_AWREADY),
        .s_axi_awvalid(ex_design_M03_AXI_AWVALID),
        .s_axi_bready(ex_design_M03_AXI_BREADY),
        .s_axi_bresp(ex_design_M03_AXI_BRESP),
        .s_axi_bvalid(ex_design_M03_AXI_BVALID),
        .s_axi_rdata(ex_design_M03_AXI_RDATA),
        .s_axi_rready(ex_design_M03_AXI_RREADY),
        .s_axi_rresp(ex_design_M03_AXI_RRESP),
        .s_axi_rvalid(ex_design_M03_AXI_RVALID),
        .s_axi_wdata(ex_design_M03_AXI_WDATA),
        .s_axi_wready(ex_design_M03_AXI_WREADY),
        .s_axi_wstrb(ex_design_M03_AXI_WSTRB),
        .s_axi_wvalid(ex_design_M03_AXI_WVALID));
endmodule

module ex_design_imp_1MGVD6J
   (M03_AXI_araddr,
    M03_AXI_arready,
    M03_AXI_arvalid,
    M03_AXI_awaddr,
    M03_AXI_awready,
    M03_AXI_awvalid,
    M03_AXI_bready,
    M03_AXI_bresp,
    M03_AXI_bvalid,
    M03_AXI_rdata,
    M03_AXI_rready,
    M03_AXI_rresp,
    M03_AXI_rvalid,
    M03_AXI_wdata,
    M03_AXI_wready,
    M03_AXI_wstrb,
    M03_AXI_wvalid,
    M04_AXI_araddr,
    M04_AXI_arready,
    M04_AXI_arvalid,
    M04_AXI_awaddr,
    M04_AXI_awready,
    M04_AXI_awvalid,
    M04_AXI_bready,
    M04_AXI_bresp,
    M04_AXI_bvalid,
    M04_AXI_rdata,
    M04_AXI_rready,
    M04_AXI_rresp,
    M04_AXI_rvalid,
    M04_AXI_wdata,
    M04_AXI_wready,
    M04_AXI_wstrb,
    M04_AXI_wvalid,
    M05_AXI_araddr,
    M05_AXI_arready,
    M05_AXI_arvalid,
    M05_AXI_awaddr,
    M05_AXI_awready,
    M05_AXI_awvalid,
    M05_AXI_bready,
    M05_AXI_bresp,
    M05_AXI_bvalid,
    M05_AXI_rdata,
    M05_AXI_rready,
    M05_AXI_rresp,
    M05_AXI_rvalid,
    M05_AXI_wdata,
    M05_AXI_wready,
    M05_AXI_wstrb,
    M05_AXI_wvalid,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arid,
    S00_AXI_arlen,
    S00_AXI_arlock,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arready,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awid,
    S00_AXI_awlen,
    S00_AXI_awlock,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awready,
    S00_AXI_awsize,
    S00_AXI_awvalid,
    S00_AXI_bid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rid,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wlast,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid,
    S01_AXI_araddr,
    S01_AXI_arprot,
    S01_AXI_arready,
    S01_AXI_arvalid,
    S01_AXI_awaddr,
    S01_AXI_awprot,
    S01_AXI_awready,
    S01_AXI_awvalid,
    S01_AXI_bready,
    S01_AXI_bresp,
    S01_AXI_bvalid,
    S01_AXI_rdata,
    S01_AXI_rready,
    S01_AXI_rresp,
    S01_AXI_rvalid,
    S01_AXI_wdata,
    S01_AXI_wready,
    S01_AXI_wstrb,
    S01_AXI_wvalid,
    adc1_clk_clk_n,
    adc1_clk_clk_p,
    adc1_hw_trigger,
    adc1_hw_trigger_en,
    clk_adc1,
    clk_dac0,
    dac0_clk_clk_n,
    dac0_clk_clk_p,
    dac0_hw_trigger,
    dac0_hw_trigger_en,
    m10_0_tdata,
    m10_0_tready,
    m10_0_tvalid,
    m1_axis_aclk,
    m1_axis_aresetn,
    s00_0_tdata,
    s00_0_tready,
    s00_0_tvalid,
    s0_axis_aclk,
    s0_axis_aresetn,
    s_axi_aclk,
    s_axi_aresetn,
    sysref_in_diff_n,
    sysref_in_diff_p,
    user_select_00_0,
    vin10_v_n,
    vin10_v_p,
    vout00_v_n,
    vout00_v_p);
  output [10:0]M03_AXI_araddr;
  input M03_AXI_arready;
  output M03_AXI_arvalid;
  output [10:0]M03_AXI_awaddr;
  input M03_AXI_awready;
  output M03_AXI_awvalid;
  output M03_AXI_bready;
  input [1:0]M03_AXI_bresp;
  input M03_AXI_bvalid;
  input [31:0]M03_AXI_rdata;
  output M03_AXI_rready;
  input [1:0]M03_AXI_rresp;
  input M03_AXI_rvalid;
  output [31:0]M03_AXI_wdata;
  input M03_AXI_wready;
  output [3:0]M03_AXI_wstrb;
  output M03_AXI_wvalid;
  output [10:0]M04_AXI_araddr;
  input M04_AXI_arready;
  output M04_AXI_arvalid;
  output [10:0]M04_AXI_awaddr;
  input M04_AXI_awready;
  output M04_AXI_awvalid;
  output M04_AXI_bready;
  input [1:0]M04_AXI_bresp;
  input M04_AXI_bvalid;
  input [31:0]M04_AXI_rdata;
  output M04_AXI_rready;
  input [1:0]M04_AXI_rresp;
  input M04_AXI_rvalid;
  output [31:0]M04_AXI_wdata;
  input M04_AXI_wready;
  output [3:0]M04_AXI_wstrb;
  output M04_AXI_wvalid;
  output [4:0]M05_AXI_araddr;
  input M05_AXI_arready;
  output M05_AXI_arvalid;
  output [4:0]M05_AXI_awaddr;
  input M05_AXI_awready;
  output M05_AXI_awvalid;
  output M05_AXI_bready;
  input [1:0]M05_AXI_bresp;
  input M05_AXI_bvalid;
  input [31:0]M05_AXI_rdata;
  output M05_AXI_rready;
  input [1:0]M05_AXI_rresp;
  input M05_AXI_rvalid;
  output [31:0]M05_AXI_wdata;
  input M05_AXI_wready;
  output [3:0]M05_AXI_wstrb;
  output M05_AXI_wvalid;
  input [31:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [0:0]S00_AXI_arid;
  input [7:0]S00_AXI_arlen;
  input S00_AXI_arlock;
  input [2:0]S00_AXI_arprot;
  input [3:0]S00_AXI_arqos;
  output S00_AXI_arready;
  input [2:0]S00_AXI_arsize;
  input S00_AXI_arvalid;
  input [31:0]S00_AXI_awaddr;
  input [1:0]S00_AXI_awburst;
  input [3:0]S00_AXI_awcache;
  input [0:0]S00_AXI_awid;
  input [7:0]S00_AXI_awlen;
  input S00_AXI_awlock;
  input [2:0]S00_AXI_awprot;
  input [3:0]S00_AXI_awqos;
  output S00_AXI_awready;
  input [2:0]S00_AXI_awsize;
  input S00_AXI_awvalid;
  output [0:0]S00_AXI_bid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  output [31:0]S00_AXI_rdata;
  output [0:0]S00_AXI_rid;
  output S00_AXI_rlast;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;
  input [31:0]S00_AXI_wdata;
  input S00_AXI_wlast;
  output S00_AXI_wready;
  input [3:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;
  input [31:0]S01_AXI_araddr;
  input [2:0]S01_AXI_arprot;
  output S01_AXI_arready;
  input S01_AXI_arvalid;
  input [31:0]S01_AXI_awaddr;
  input [2:0]S01_AXI_awprot;
  output S01_AXI_awready;
  input S01_AXI_awvalid;
  input S01_AXI_bready;
  output [1:0]S01_AXI_bresp;
  output S01_AXI_bvalid;
  output [31:0]S01_AXI_rdata;
  input S01_AXI_rready;
  output [1:0]S01_AXI_rresp;
  output S01_AXI_rvalid;
  input [31:0]S01_AXI_wdata;
  output S01_AXI_wready;
  input [3:0]S01_AXI_wstrb;
  input S01_AXI_wvalid;
  input adc1_clk_clk_n;
  input adc1_clk_clk_p;
  input adc1_hw_trigger;
  input adc1_hw_trigger_en;
  output clk_adc1;
  output clk_dac0;
  input dac0_clk_clk_n;
  input dac0_clk_clk_p;
  input dac0_hw_trigger;
  input dac0_hw_trigger_en;
  output [127:0]m10_0_tdata;
  input m10_0_tready;
  output m10_0_tvalid;
  input m1_axis_aclk;
  input m1_axis_aresetn;
  input [255:0]s00_0_tdata;
  output s00_0_tready;
  input s00_0_tvalid;
  input s0_axis_aclk;
  input s0_axis_aresetn;
  input s_axi_aclk;
  input s_axi_aresetn;
  input sysref_in_diff_n;
  input sysref_in_diff_p;
  input user_select_00_0;
  input vin10_v_n;
  input vin10_v_p;
  output vout00_v_n;
  output vout00_v_p;

  wire [31:0]Conn10_ARADDR;
  wire [1:0]Conn10_ARBURST;
  wire [3:0]Conn10_ARCACHE;
  wire [0:0]Conn10_ARID;
  wire [7:0]Conn10_ARLEN;
  wire Conn10_ARLOCK;
  wire [2:0]Conn10_ARPROT;
  wire [3:0]Conn10_ARQOS;
  wire Conn10_ARREADY;
  wire [2:0]Conn10_ARSIZE;
  wire Conn10_ARVALID;
  wire [31:0]Conn10_AWADDR;
  wire [1:0]Conn10_AWBURST;
  wire [3:0]Conn10_AWCACHE;
  wire [0:0]Conn10_AWID;
  wire [7:0]Conn10_AWLEN;
  wire Conn10_AWLOCK;
  wire [2:0]Conn10_AWPROT;
  wire [3:0]Conn10_AWQOS;
  wire Conn10_AWREADY;
  wire [2:0]Conn10_AWSIZE;
  wire Conn10_AWVALID;
  wire [0:0]Conn10_BID;
  wire Conn10_BREADY;
  wire [1:0]Conn10_BRESP;
  wire Conn10_BVALID;
  wire [31:0]Conn10_RDATA;
  wire [0:0]Conn10_RID;
  wire Conn10_RLAST;
  wire Conn10_RREADY;
  wire [1:0]Conn10_RRESP;
  wire Conn10_RVALID;
  wire [31:0]Conn10_WDATA;
  wire Conn10_WLAST;
  wire Conn10_WREADY;
  wire [3:0]Conn10_WSTRB;
  wire Conn10_WVALID;
  wire [31:0]Conn11_ARADDR;
  wire [2:0]Conn11_ARPROT;
  wire Conn11_ARREADY;
  wire Conn11_ARVALID;
  wire [31:0]Conn11_AWADDR;
  wire [2:0]Conn11_AWPROT;
  wire Conn11_AWREADY;
  wire Conn11_AWVALID;
  wire Conn11_BREADY;
  wire [1:0]Conn11_BRESP;
  wire Conn11_BVALID;
  wire [31:0]Conn11_RDATA;
  wire Conn11_RREADY;
  wire [1:0]Conn11_RRESP;
  wire Conn11_RVALID;
  wire [31:0]Conn11_WDATA;
  wire Conn11_WREADY;
  wire [3:0]Conn11_WSTRB;
  wire Conn11_WVALID;
  wire [4:0]Conn12_ARADDR;
  wire Conn12_ARREADY;
  wire Conn12_ARVALID;
  wire [4:0]Conn12_AWADDR;
  wire Conn12_AWREADY;
  wire Conn12_AWVALID;
  wire Conn12_BREADY;
  wire [1:0]Conn12_BRESP;
  wire Conn12_BVALID;
  wire [31:0]Conn12_RDATA;
  wire Conn12_RREADY;
  wire [1:0]Conn12_RRESP;
  wire Conn12_RVALID;
  wire [31:0]Conn12_WDATA;
  wire Conn12_WREADY;
  wire [3:0]Conn12_WSTRB;
  wire Conn12_WVALID;
  wire Conn1_diff_n;
  wire Conn1_diff_p;
  wire [127:0]Conn2_TDATA;
  wire Conn2_TREADY;
  wire Conn2_TVALID;
  wire Conn3_CLK_N;
  wire Conn3_CLK_P;
  wire [255:0]Conn4_TDATA;
  wire Conn4_TREADY;
  wire Conn4_TVALID;
  wire Conn5_V_N;
  wire Conn5_V_P;
  wire Conn6_V_N;
  wire Conn6_V_P;
  wire Conn7_CLK_N;
  wire Conn7_CLK_P;
  wire [10:0]Conn8_ARADDR;
  wire Conn8_ARREADY;
  wire Conn8_ARVALID;
  wire [10:0]Conn8_AWADDR;
  wire Conn8_AWREADY;
  wire Conn8_AWVALID;
  wire Conn8_BREADY;
  wire [1:0]Conn8_BRESP;
  wire Conn8_BVALID;
  wire [31:0]Conn8_RDATA;
  wire Conn8_RREADY;
  wire [1:0]Conn8_RRESP;
  wire Conn8_RVALID;
  wire [31:0]Conn8_WDATA;
  wire Conn8_WREADY;
  wire [3:0]Conn8_WSTRB;
  wire Conn8_WVALID;
  wire [10:0]Conn9_ARADDR;
  wire Conn9_ARREADY;
  wire Conn9_ARVALID;
  wire [10:0]Conn9_AWADDR;
  wire Conn9_AWREADY;
  wire Conn9_AWVALID;
  wire Conn9_BREADY;
  wire [1:0]Conn9_BRESP;
  wire Conn9_BVALID;
  wire [31:0]Conn9_RDATA;
  wire Conn9_RREADY;
  wire [1:0]Conn9_RRESP;
  wire Conn9_RVALID;
  wire [31:0]Conn9_WDATA;
  wire Conn9_WREADY;
  wire [3:0]Conn9_WSTRB;
  wire Conn9_WVALID;
  wire Net;
  wire Net1;
  wire adc1_hw_trigger_1;
  wire adc1_hw_trigger_en_1;
  wire dac0_hw_trigger_1;
  wire dac0_hw_trigger_en_1;
  wire [255:0]dac_source_i_m00_TDATA;
  wire dac_source_i_m00_TREADY;
  wire dac_source_i_m00_TVALID;
  wire m1_axis_aresetn_1;
  wire s0_axis_aresetn_1;
  wire s_axi_aclk_1;
  wire s_axi_aresetn_1;
  wire [17:0]smartconnect_0_M00_AXI_ARADDR;
  wire smartconnect_0_M00_AXI_ARREADY;
  wire smartconnect_0_M00_AXI_ARVALID;
  wire [17:0]smartconnect_0_M00_AXI_AWADDR;
  wire smartconnect_0_M00_AXI_AWREADY;
  wire smartconnect_0_M00_AXI_AWVALID;
  wire smartconnect_0_M00_AXI_BREADY;
  wire [1:0]smartconnect_0_M00_AXI_BRESP;
  wire smartconnect_0_M00_AXI_BVALID;
  wire [31:0]smartconnect_0_M00_AXI_RDATA;
  wire smartconnect_0_M00_AXI_RREADY;
  wire [1:0]smartconnect_0_M00_AXI_RRESP;
  wire smartconnect_0_M00_AXI_RVALID;
  wire [31:0]smartconnect_0_M00_AXI_WDATA;
  wire smartconnect_0_M00_AXI_WREADY;
  wire [3:0]smartconnect_0_M00_AXI_WSTRB;
  wire smartconnect_0_M00_AXI_WVALID;
  wire [63:0]smartconnect_0_M01_AXI_ARADDR;
  wire smartconnect_0_M01_AXI_ARREADY;
  wire smartconnect_0_M01_AXI_ARVALID;
  wire [63:0]smartconnect_0_M01_AXI_AWADDR;
  wire smartconnect_0_M01_AXI_AWREADY;
  wire smartconnect_0_M01_AXI_AWVALID;
  wire smartconnect_0_M01_AXI_BREADY;
  wire [1:0]smartconnect_0_M01_AXI_BRESP;
  wire smartconnect_0_M01_AXI_BVALID;
  wire [31:0]smartconnect_0_M01_AXI_RDATA;
  wire smartconnect_0_M01_AXI_RREADY;
  wire [1:0]smartconnect_0_M01_AXI_RRESP;
  wire smartconnect_0_M01_AXI_RVALID;
  wire [31:0]smartconnect_0_M01_AXI_WDATA;
  wire smartconnect_0_M01_AXI_WREADY;
  wire [3:0]smartconnect_0_M01_AXI_WSTRB;
  wire smartconnect_0_M01_AXI_WVALID;
  wire [15:0]smartconnect_0_M02_AXI_ARADDR;
  wire smartconnect_0_M02_AXI_ARREADY;
  wire smartconnect_0_M02_AXI_ARVALID;
  wire [15:0]smartconnect_0_M02_AXI_AWADDR;
  wire smartconnect_0_M02_AXI_AWREADY;
  wire smartconnect_0_M02_AXI_AWVALID;
  wire smartconnect_0_M02_AXI_BREADY;
  wire [1:0]smartconnect_0_M02_AXI_BRESP;
  wire smartconnect_0_M02_AXI_BVALID;
  wire [31:0]smartconnect_0_M02_AXI_RDATA;
  wire smartconnect_0_M02_AXI_RREADY;
  wire [1:0]smartconnect_0_M02_AXI_RRESP;
  wire smartconnect_0_M02_AXI_RVALID;
  wire [31:0]smartconnect_0_M02_AXI_WDATA;
  wire smartconnect_0_M02_AXI_WREADY;
  wire [3:0]smartconnect_0_M02_AXI_WSTRB;
  wire smartconnect_0_M02_AXI_WVALID;
  wire user_select_00_0_1;
  wire usp_rf_data_converter_0_clk_adc1;
  wire usp_rf_data_converter_0_clk_dac0;
  wire [127:0]usp_rf_data_converter_0_m10_axis_TDATA;
  wire usp_rf_data_converter_0_m10_axis_TVALID;

  assign Conn10_ARADDR = S00_AXI_araddr[31:0];
  assign Conn10_ARBURST = S00_AXI_arburst[1:0];
  assign Conn10_ARCACHE = S00_AXI_arcache[3:0];
  assign Conn10_ARID = S00_AXI_arid[0];
  assign Conn10_ARLEN = S00_AXI_arlen[7:0];
  assign Conn10_ARLOCK = S00_AXI_arlock;
  assign Conn10_ARPROT = S00_AXI_arprot[2:0];
  assign Conn10_ARQOS = S00_AXI_arqos[3:0];
  assign Conn10_ARSIZE = S00_AXI_arsize[2:0];
  assign Conn10_ARVALID = S00_AXI_arvalid;
  assign Conn10_AWADDR = S00_AXI_awaddr[31:0];
  assign Conn10_AWBURST = S00_AXI_awburst[1:0];
  assign Conn10_AWCACHE = S00_AXI_awcache[3:0];
  assign Conn10_AWID = S00_AXI_awid[0];
  assign Conn10_AWLEN = S00_AXI_awlen[7:0];
  assign Conn10_AWLOCK = S00_AXI_awlock;
  assign Conn10_AWPROT = S00_AXI_awprot[2:0];
  assign Conn10_AWQOS = S00_AXI_awqos[3:0];
  assign Conn10_AWSIZE = S00_AXI_awsize[2:0];
  assign Conn10_AWVALID = S00_AXI_awvalid;
  assign Conn10_BREADY = S00_AXI_bready;
  assign Conn10_RREADY = S00_AXI_rready;
  assign Conn10_WDATA = S00_AXI_wdata[31:0];
  assign Conn10_WLAST = S00_AXI_wlast;
  assign Conn10_WSTRB = S00_AXI_wstrb[3:0];
  assign Conn10_WVALID = S00_AXI_wvalid;
  assign Conn11_ARADDR = S01_AXI_araddr[31:0];
  assign Conn11_ARPROT = S01_AXI_arprot[2:0];
  assign Conn11_ARVALID = S01_AXI_arvalid;
  assign Conn11_AWADDR = S01_AXI_awaddr[31:0];
  assign Conn11_AWPROT = S01_AXI_awprot[2:0];
  assign Conn11_AWVALID = S01_AXI_awvalid;
  assign Conn11_BREADY = S01_AXI_bready;
  assign Conn11_RREADY = S01_AXI_rready;
  assign Conn11_WDATA = S01_AXI_wdata[31:0];
  assign Conn11_WSTRB = S01_AXI_wstrb[3:0];
  assign Conn11_WVALID = S01_AXI_wvalid;
  assign Conn12_ARREADY = M05_AXI_arready;
  assign Conn12_AWREADY = M05_AXI_awready;
  assign Conn12_BRESP = M05_AXI_bresp[1:0];
  assign Conn12_BVALID = M05_AXI_bvalid;
  assign Conn12_RDATA = M05_AXI_rdata[31:0];
  assign Conn12_RRESP = M05_AXI_rresp[1:0];
  assign Conn12_RVALID = M05_AXI_rvalid;
  assign Conn12_WREADY = M05_AXI_wready;
  assign Conn1_diff_n = sysref_in_diff_n;
  assign Conn1_diff_p = sysref_in_diff_p;
  assign Conn2_TREADY = m10_0_tready;
  assign Conn3_CLK_N = dac0_clk_clk_n;
  assign Conn3_CLK_P = dac0_clk_clk_p;
  assign Conn4_TDATA = s00_0_tdata[255:0];
  assign Conn4_TVALID = s00_0_tvalid;
  assign Conn5_V_N = vin10_v_n;
  assign Conn5_V_P = vin10_v_p;
  assign Conn7_CLK_N = adc1_clk_clk_n;
  assign Conn7_CLK_P = adc1_clk_clk_p;
  assign Conn8_ARREADY = M03_AXI_arready;
  assign Conn8_AWREADY = M03_AXI_awready;
  assign Conn8_BRESP = M03_AXI_bresp[1:0];
  assign Conn8_BVALID = M03_AXI_bvalid;
  assign Conn8_RDATA = M03_AXI_rdata[31:0];
  assign Conn8_RRESP = M03_AXI_rresp[1:0];
  assign Conn8_RVALID = M03_AXI_rvalid;
  assign Conn8_WREADY = M03_AXI_wready;
  assign Conn9_ARREADY = M04_AXI_arready;
  assign Conn9_AWREADY = M04_AXI_awready;
  assign Conn9_BRESP = M04_AXI_bresp[1:0];
  assign Conn9_BVALID = M04_AXI_bvalid;
  assign Conn9_RDATA = M04_AXI_rdata[31:0];
  assign Conn9_RRESP = M04_AXI_rresp[1:0];
  assign Conn9_RVALID = M04_AXI_rvalid;
  assign Conn9_WREADY = M04_AXI_wready;
  assign M03_AXI_araddr[10:0] = Conn8_ARADDR;
  assign M03_AXI_arvalid = Conn8_ARVALID;
  assign M03_AXI_awaddr[10:0] = Conn8_AWADDR;
  assign M03_AXI_awvalid = Conn8_AWVALID;
  assign M03_AXI_bready = Conn8_BREADY;
  assign M03_AXI_rready = Conn8_RREADY;
  assign M03_AXI_wdata[31:0] = Conn8_WDATA;
  assign M03_AXI_wstrb[3:0] = Conn8_WSTRB;
  assign M03_AXI_wvalid = Conn8_WVALID;
  assign M04_AXI_araddr[10:0] = Conn9_ARADDR;
  assign M04_AXI_arvalid = Conn9_ARVALID;
  assign M04_AXI_awaddr[10:0] = Conn9_AWADDR;
  assign M04_AXI_awvalid = Conn9_AWVALID;
  assign M04_AXI_bready = Conn9_BREADY;
  assign M04_AXI_rready = Conn9_RREADY;
  assign M04_AXI_wdata[31:0] = Conn9_WDATA;
  assign M04_AXI_wstrb[3:0] = Conn9_WSTRB;
  assign M04_AXI_wvalid = Conn9_WVALID;
  assign M05_AXI_araddr[4:0] = Conn12_ARADDR;
  assign M05_AXI_arvalid = Conn12_ARVALID;
  assign M05_AXI_awaddr[4:0] = Conn12_AWADDR;
  assign M05_AXI_awvalid = Conn12_AWVALID;
  assign M05_AXI_bready = Conn12_BREADY;
  assign M05_AXI_rready = Conn12_RREADY;
  assign M05_AXI_wdata[31:0] = Conn12_WDATA;
  assign M05_AXI_wstrb[3:0] = Conn12_WSTRB;
  assign M05_AXI_wvalid = Conn12_WVALID;
  assign Net = s0_axis_aclk;
  assign Net1 = m1_axis_aclk;
  assign S00_AXI_arready = Conn10_ARREADY;
  assign S00_AXI_awready = Conn10_AWREADY;
  assign S00_AXI_bid[0] = Conn10_BID;
  assign S00_AXI_bresp[1:0] = Conn10_BRESP;
  assign S00_AXI_bvalid = Conn10_BVALID;
  assign S00_AXI_rdata[31:0] = Conn10_RDATA;
  assign S00_AXI_rid[0] = Conn10_RID;
  assign S00_AXI_rlast = Conn10_RLAST;
  assign S00_AXI_rresp[1:0] = Conn10_RRESP;
  assign S00_AXI_rvalid = Conn10_RVALID;
  assign S00_AXI_wready = Conn10_WREADY;
  assign S01_AXI_arready = Conn11_ARREADY;
  assign S01_AXI_awready = Conn11_AWREADY;
  assign S01_AXI_bresp[1:0] = Conn11_BRESP;
  assign S01_AXI_bvalid = Conn11_BVALID;
  assign S01_AXI_rdata[31:0] = Conn11_RDATA;
  assign S01_AXI_rresp[1:0] = Conn11_RRESP;
  assign S01_AXI_rvalid = Conn11_RVALID;
  assign S01_AXI_wready = Conn11_WREADY;
  assign adc1_hw_trigger_1 = adc1_hw_trigger;
  assign adc1_hw_trigger_en_1 = adc1_hw_trigger_en;
  assign clk_adc1 = usp_rf_data_converter_0_clk_adc1;
  assign clk_dac0 = usp_rf_data_converter_0_clk_dac0;
  assign dac0_hw_trigger_1 = dac0_hw_trigger;
  assign dac0_hw_trigger_en_1 = dac0_hw_trigger_en;
  assign m10_0_tdata[127:0] = Conn2_TDATA;
  assign m10_0_tvalid = Conn2_TVALID;
  assign m1_axis_aresetn_1 = m1_axis_aresetn;
  assign s00_0_tready = Conn4_TREADY;
  assign s0_axis_aresetn_1 = s0_axis_aresetn;
  assign s_axi_aclk_1 = s_axi_aclk;
  assign s_axi_aresetn_1 = s_axi_aresetn;
  assign user_select_00_0_1 = user_select_00_0;
  assign vout00_v_n = Conn6_V_N;
  assign vout00_v_p = Conn6_V_P;
  rfdc_ex_adc_sink_i_0 adc_sink_i
       (.hw_trigger_1(adc1_hw_trigger_1),
        .hw_trigger_en_1(adc1_hw_trigger_en_1),
        .m10_tdata(Conn2_TDATA),
        .m10_tready(Conn2_TREADY),
        .m10_tvalid(Conn2_TVALID),
        .s10_tdata(usp_rf_data_converter_0_m10_axis_TDATA),
        .s10_tvalid(usp_rf_data_converter_0_m10_axis_TVALID),
        .s1_axis_clock(Net1),
        .s1_div2_axis_clock(Net1),
        .s_axi_aclk(s_axi_aclk_1),
        .s_axi_araddr(smartconnect_0_M02_AXI_ARADDR),
        .s_axi_aresetn(s_axi_aresetn_1),
        .s_axi_arready(smartconnect_0_M02_AXI_ARREADY),
        .s_axi_arvalid(smartconnect_0_M02_AXI_ARVALID),
        .s_axi_awaddr(smartconnect_0_M02_AXI_AWADDR),
        .s_axi_awready(smartconnect_0_M02_AXI_AWREADY),
        .s_axi_awvalid(smartconnect_0_M02_AXI_AWVALID),
        .s_axi_bready(smartconnect_0_M02_AXI_BREADY),
        .s_axi_bresp(smartconnect_0_M02_AXI_BRESP),
        .s_axi_bvalid(smartconnect_0_M02_AXI_BVALID),
        .s_axi_rdata(smartconnect_0_M02_AXI_RDATA),
        .s_axi_rready(smartconnect_0_M02_AXI_RREADY),
        .s_axi_rresp(smartconnect_0_M02_AXI_RRESP),
        .s_axi_rvalid(smartconnect_0_M02_AXI_RVALID),
        .s_axi_wdata(smartconnect_0_M02_AXI_WDATA),
        .s_axi_wready(smartconnect_0_M02_AXI_WREADY),
        .s_axi_wstrb(smartconnect_0_M02_AXI_WSTRB),
        .s_axi_wvalid(smartconnect_0_M02_AXI_WVALID));
  rfdc_ex_dac_source_i_0 dac_source_i
       (.hw_trigger_0(dac0_hw_trigger_1),
        .hw_trigger_en_0(dac0_hw_trigger_en_1),
        .m00_tdata(dac_source_i_m00_TDATA),
        .m00_tready(dac_source_i_m00_TREADY),
        .m00_tvalid(dac_source_i_m00_TVALID),
        .m0_axis_clock(Net),
        .m0_div2_axis_clock(Net),
        .s00_user_tdata(Conn4_TDATA),
        .s00_user_tready(Conn4_TREADY),
        .s00_user_tvalid(Conn4_TVALID),
        .s_axi_aclk(s_axi_aclk_1),
        .s_axi_araddr(smartconnect_0_M01_AXI_ARADDR),
        .s_axi_aresetn(s_axi_aresetn_1),
        .s_axi_arready(smartconnect_0_M01_AXI_ARREADY),
        .s_axi_arvalid(smartconnect_0_M01_AXI_ARVALID),
        .s_axi_awaddr(smartconnect_0_M01_AXI_AWADDR),
        .s_axi_awready(smartconnect_0_M01_AXI_AWREADY),
        .s_axi_awvalid(smartconnect_0_M01_AXI_AWVALID),
        .s_axi_bready(smartconnect_0_M01_AXI_BREADY),
        .s_axi_bresp(smartconnect_0_M01_AXI_BRESP),
        .s_axi_bvalid(smartconnect_0_M01_AXI_BVALID),
        .s_axi_rdata(smartconnect_0_M01_AXI_RDATA),
        .s_axi_rready(smartconnect_0_M01_AXI_RREADY),
        .s_axi_rresp(smartconnect_0_M01_AXI_RRESP),
        .s_axi_rvalid(smartconnect_0_M01_AXI_RVALID),
        .s_axi_wdata(smartconnect_0_M01_AXI_WDATA),
        .s_axi_wready(smartconnect_0_M01_AXI_WREADY),
        .s_axi_wstrb(smartconnect_0_M01_AXI_WSTRB),
        .s_axi_wvalid(smartconnect_0_M01_AXI_WVALID),
        .user_select_00(user_select_00_0_1));
  rfdc_ex_smartconnect_0_0 smartconnect_0
       (.M00_AXI_araddr(smartconnect_0_M00_AXI_ARADDR),
        .M00_AXI_arready(smartconnect_0_M00_AXI_ARREADY),
        .M00_AXI_arvalid(smartconnect_0_M00_AXI_ARVALID),
        .M00_AXI_awaddr(smartconnect_0_M00_AXI_AWADDR),
        .M00_AXI_awready(smartconnect_0_M00_AXI_AWREADY),
        .M00_AXI_awvalid(smartconnect_0_M00_AXI_AWVALID),
        .M00_AXI_bready(smartconnect_0_M00_AXI_BREADY),
        .M00_AXI_bresp(smartconnect_0_M00_AXI_BRESP),
        .M00_AXI_bvalid(smartconnect_0_M00_AXI_BVALID),
        .M00_AXI_rdata(smartconnect_0_M00_AXI_RDATA),
        .M00_AXI_rready(smartconnect_0_M00_AXI_RREADY),
        .M00_AXI_rresp(smartconnect_0_M00_AXI_RRESP),
        .M00_AXI_rvalid(smartconnect_0_M00_AXI_RVALID),
        .M00_AXI_wdata(smartconnect_0_M00_AXI_WDATA),
        .M00_AXI_wready(smartconnect_0_M00_AXI_WREADY),
        .M00_AXI_wstrb(smartconnect_0_M00_AXI_WSTRB),
        .M00_AXI_wvalid(smartconnect_0_M00_AXI_WVALID),
        .M01_AXI_araddr(smartconnect_0_M01_AXI_ARADDR),
        .M01_AXI_arready(smartconnect_0_M01_AXI_ARREADY),
        .M01_AXI_arvalid(smartconnect_0_M01_AXI_ARVALID),
        .M01_AXI_awaddr(smartconnect_0_M01_AXI_AWADDR),
        .M01_AXI_awready(smartconnect_0_M01_AXI_AWREADY),
        .M01_AXI_awvalid(smartconnect_0_M01_AXI_AWVALID),
        .M01_AXI_bready(smartconnect_0_M01_AXI_BREADY),
        .M01_AXI_bresp(smartconnect_0_M01_AXI_BRESP),
        .M01_AXI_bvalid(smartconnect_0_M01_AXI_BVALID),
        .M01_AXI_rdata(smartconnect_0_M01_AXI_RDATA),
        .M01_AXI_rready(smartconnect_0_M01_AXI_RREADY),
        .M01_AXI_rresp(smartconnect_0_M01_AXI_RRESP),
        .M01_AXI_rvalid(smartconnect_0_M01_AXI_RVALID),
        .M01_AXI_wdata(smartconnect_0_M01_AXI_WDATA),
        .M01_AXI_wready(smartconnect_0_M01_AXI_WREADY),
        .M01_AXI_wstrb(smartconnect_0_M01_AXI_WSTRB),
        .M01_AXI_wvalid(smartconnect_0_M01_AXI_WVALID),
        .M02_AXI_araddr(smartconnect_0_M02_AXI_ARADDR),
        .M02_AXI_arready(smartconnect_0_M02_AXI_ARREADY),
        .M02_AXI_arvalid(smartconnect_0_M02_AXI_ARVALID),
        .M02_AXI_awaddr(smartconnect_0_M02_AXI_AWADDR),
        .M02_AXI_awready(smartconnect_0_M02_AXI_AWREADY),
        .M02_AXI_awvalid(smartconnect_0_M02_AXI_AWVALID),
        .M02_AXI_bready(smartconnect_0_M02_AXI_BREADY),
        .M02_AXI_bresp(smartconnect_0_M02_AXI_BRESP),
        .M02_AXI_bvalid(smartconnect_0_M02_AXI_BVALID),
        .M02_AXI_rdata(smartconnect_0_M02_AXI_RDATA),
        .M02_AXI_rready(smartconnect_0_M02_AXI_RREADY),
        .M02_AXI_rresp(smartconnect_0_M02_AXI_RRESP),
        .M02_AXI_rvalid(smartconnect_0_M02_AXI_RVALID),
        .M02_AXI_wdata(smartconnect_0_M02_AXI_WDATA),
        .M02_AXI_wready(smartconnect_0_M02_AXI_WREADY),
        .M02_AXI_wstrb(smartconnect_0_M02_AXI_WSTRB),
        .M02_AXI_wvalid(smartconnect_0_M02_AXI_WVALID),
        .M03_AXI_araddr(Conn8_ARADDR),
        .M03_AXI_arready(Conn8_ARREADY),
        .M03_AXI_arvalid(Conn8_ARVALID),
        .M03_AXI_awaddr(Conn8_AWADDR),
        .M03_AXI_awready(Conn8_AWREADY),
        .M03_AXI_awvalid(Conn8_AWVALID),
        .M03_AXI_bready(Conn8_BREADY),
        .M03_AXI_bresp(Conn8_BRESP),
        .M03_AXI_bvalid(Conn8_BVALID),
        .M03_AXI_rdata(Conn8_RDATA),
        .M03_AXI_rready(Conn8_RREADY),
        .M03_AXI_rresp(Conn8_RRESP),
        .M03_AXI_rvalid(Conn8_RVALID),
        .M03_AXI_wdata(Conn8_WDATA),
        .M03_AXI_wready(Conn8_WREADY),
        .M03_AXI_wstrb(Conn8_WSTRB),
        .M03_AXI_wvalid(Conn8_WVALID),
        .M04_AXI_araddr(Conn9_ARADDR),
        .M04_AXI_arready(Conn9_ARREADY),
        .M04_AXI_arvalid(Conn9_ARVALID),
        .M04_AXI_awaddr(Conn9_AWADDR),
        .M04_AXI_awready(Conn9_AWREADY),
        .M04_AXI_awvalid(Conn9_AWVALID),
        .M04_AXI_bready(Conn9_BREADY),
        .M04_AXI_bresp(Conn9_BRESP),
        .M04_AXI_bvalid(Conn9_BVALID),
        .M04_AXI_rdata(Conn9_RDATA),
        .M04_AXI_rready(Conn9_RREADY),
        .M04_AXI_rresp(Conn9_RRESP),
        .M04_AXI_rvalid(Conn9_RVALID),
        .M04_AXI_wdata(Conn9_WDATA),
        .M04_AXI_wready(Conn9_WREADY),
        .M04_AXI_wstrb(Conn9_WSTRB),
        .M04_AXI_wvalid(Conn9_WVALID),
        .M05_AXI_araddr(Conn12_ARADDR),
        .M05_AXI_arready(Conn12_ARREADY),
        .M05_AXI_arvalid(Conn12_ARVALID),
        .M05_AXI_awaddr(Conn12_AWADDR),
        .M05_AXI_awready(Conn12_AWREADY),
        .M05_AXI_awvalid(Conn12_AWVALID),
        .M05_AXI_bready(Conn12_BREADY),
        .M05_AXI_bresp(Conn12_BRESP),
        .M05_AXI_bvalid(Conn12_BVALID),
        .M05_AXI_rdata(Conn12_RDATA),
        .M05_AXI_rready(Conn12_RREADY),
        .M05_AXI_rresp(Conn12_RRESP),
        .M05_AXI_rvalid(Conn12_RVALID),
        .M05_AXI_wdata(Conn12_WDATA),
        .M05_AXI_wready(Conn12_WREADY),
        .M05_AXI_wstrb(Conn12_WSTRB),
        .M05_AXI_wvalid(Conn12_WVALID),
        .S00_AXI_araddr(Conn10_ARADDR),
        .S00_AXI_arburst(Conn10_ARBURST),
        .S00_AXI_arcache(Conn10_ARCACHE),
        .S00_AXI_arid(Conn10_ARID),
        .S00_AXI_arlen(Conn10_ARLEN),
        .S00_AXI_arlock(Conn10_ARLOCK),
        .S00_AXI_arprot(Conn10_ARPROT),
        .S00_AXI_arqos(Conn10_ARQOS),
        .S00_AXI_arready(Conn10_ARREADY),
        .S00_AXI_arsize(Conn10_ARSIZE),
        .S00_AXI_arvalid(Conn10_ARVALID),
        .S00_AXI_awaddr(Conn10_AWADDR),
        .S00_AXI_awburst(Conn10_AWBURST),
        .S00_AXI_awcache(Conn10_AWCACHE),
        .S00_AXI_awid(Conn10_AWID),
        .S00_AXI_awlen(Conn10_AWLEN),
        .S00_AXI_awlock(Conn10_AWLOCK),
        .S00_AXI_awprot(Conn10_AWPROT),
        .S00_AXI_awqos(Conn10_AWQOS),
        .S00_AXI_awready(Conn10_AWREADY),
        .S00_AXI_awsize(Conn10_AWSIZE),
        .S00_AXI_awvalid(Conn10_AWVALID),
        .S00_AXI_bid(Conn10_BID),
        .S00_AXI_bready(Conn10_BREADY),
        .S00_AXI_bresp(Conn10_BRESP),
        .S00_AXI_bvalid(Conn10_BVALID),
        .S00_AXI_rdata(Conn10_RDATA),
        .S00_AXI_rid(Conn10_RID),
        .S00_AXI_rlast(Conn10_RLAST),
        .S00_AXI_rready(Conn10_RREADY),
        .S00_AXI_rresp(Conn10_RRESP),
        .S00_AXI_rvalid(Conn10_RVALID),
        .S00_AXI_wdata(Conn10_WDATA),
        .S00_AXI_wlast(Conn10_WLAST),
        .S00_AXI_wready(Conn10_WREADY),
        .S00_AXI_wstrb(Conn10_WSTRB),
        .S00_AXI_wvalid(Conn10_WVALID),
        .S01_AXI_araddr(Conn11_ARADDR),
        .S01_AXI_arprot(Conn11_ARPROT),
        .S01_AXI_arready(Conn11_ARREADY),
        .S01_AXI_arvalid(Conn11_ARVALID),
        .S01_AXI_awaddr(Conn11_AWADDR),
        .S01_AXI_awprot(Conn11_AWPROT),
        .S01_AXI_awready(Conn11_AWREADY),
        .S01_AXI_awvalid(Conn11_AWVALID),
        .S01_AXI_bready(Conn11_BREADY),
        .S01_AXI_bresp(Conn11_BRESP),
        .S01_AXI_bvalid(Conn11_BVALID),
        .S01_AXI_rdata(Conn11_RDATA),
        .S01_AXI_rready(Conn11_RREADY),
        .S01_AXI_rresp(Conn11_RRESP),
        .S01_AXI_rvalid(Conn11_RVALID),
        .S01_AXI_wdata(Conn11_WDATA),
        .S01_AXI_wready(Conn11_WREADY),
        .S01_AXI_wstrb(Conn11_WSTRB),
        .S01_AXI_wvalid(Conn11_WVALID),
        .aclk(s_axi_aclk_1),
        .aresetn(s_axi_aresetn_1));
  rfdc_ex_usp_rf_data_converter_0_0 usp_rf_data_converter_0
       (.adc1_clk_n(Conn7_CLK_N),
        .adc1_clk_p(Conn7_CLK_P),
        .clk_adc1(usp_rf_data_converter_0_clk_adc1),
        .clk_dac0(usp_rf_data_converter_0_clk_dac0),
        .dac0_clk_n(Conn3_CLK_N),
        .dac0_clk_p(Conn3_CLK_P),
        .m10_axis_tdata(usp_rf_data_converter_0_m10_axis_TDATA),
        .m10_axis_tready(1'b1),
        .m10_axis_tvalid(usp_rf_data_converter_0_m10_axis_TVALID),
        .m1_axis_aclk(Net1),
        .m1_axis_aresetn(m1_axis_aresetn_1),
        .s00_axis_tdata(dac_source_i_m00_TDATA),
        .s00_axis_tready(dac_source_i_m00_TREADY),
        .s00_axis_tvalid(dac_source_i_m00_TVALID),
        .s0_axis_aclk(Net),
        .s0_axis_aresetn(s0_axis_aresetn_1),
        .s_axi_aclk(s_axi_aclk_1),
        .s_axi_araddr(smartconnect_0_M00_AXI_ARADDR),
        .s_axi_aresetn(s_axi_aresetn_1),
        .s_axi_arready(smartconnect_0_M00_AXI_ARREADY),
        .s_axi_arvalid(smartconnect_0_M00_AXI_ARVALID),
        .s_axi_awaddr(smartconnect_0_M00_AXI_AWADDR),
        .s_axi_awready(smartconnect_0_M00_AXI_AWREADY),
        .s_axi_awvalid(smartconnect_0_M00_AXI_AWVALID),
        .s_axi_bready(smartconnect_0_M00_AXI_BREADY),
        .s_axi_bresp(smartconnect_0_M00_AXI_BRESP),
        .s_axi_bvalid(smartconnect_0_M00_AXI_BVALID),
        .s_axi_rdata(smartconnect_0_M00_AXI_RDATA),
        .s_axi_rready(smartconnect_0_M00_AXI_RREADY),
        .s_axi_rresp(smartconnect_0_M00_AXI_RRESP),
        .s_axi_rvalid(smartconnect_0_M00_AXI_RVALID),
        .s_axi_wdata(smartconnect_0_M00_AXI_WDATA),
        .s_axi_wready(smartconnect_0_M00_AXI_WREADY),
        .s_axi_wstrb(smartconnect_0_M00_AXI_WSTRB),
        .s_axi_wvalid(smartconnect_0_M00_AXI_WVALID),
        .sysref_in_n(Conn1_diff_n),
        .sysref_in_p(Conn1_diff_p),
        .vin10_n(Conn5_V_N),
        .vin10_p(Conn5_V_P),
        .vout00_n(Conn6_V_N),
        .vout00_p(Conn6_V_P));
endmodule

module microblaze_0_local_memory_imp_1FP2N28
   (DLMB_abus,
    DLMB_addrstrobe,
    DLMB_be,
    DLMB_ce,
    DLMB_readdbus,
    DLMB_readstrobe,
    DLMB_ready,
    DLMB_ue,
    DLMB_wait,
    DLMB_writedbus,
    DLMB_writestrobe,
    ILMB_abus,
    ILMB_addrstrobe,
    ILMB_ce,
    ILMB_readdbus,
    ILMB_readstrobe,
    ILMB_ready,
    ILMB_ue,
    ILMB_wait,
    SYS_Rst,
    s_axi_aclk);
  input [0:31]DLMB_abus;
  input DLMB_addrstrobe;
  input [0:3]DLMB_be;
  output DLMB_ce;
  output [0:31]DLMB_readdbus;
  input DLMB_readstrobe;
  output DLMB_ready;
  output DLMB_ue;
  output DLMB_wait;
  input [0:31]DLMB_writedbus;
  input DLMB_writestrobe;
  input [0:31]ILMB_abus;
  input ILMB_addrstrobe;
  output ILMB_ce;
  output [0:31]ILMB_readdbus;
  input ILMB_readstrobe;
  output ILMB_ready;
  output ILMB_ue;
  output ILMB_wait;
  input SYS_Rst;
  input s_axi_aclk;

  wire SYS_Rst_1;
  wire [0:31]microblaze_0_dlmb_ABUS;
  wire microblaze_0_dlmb_ADDRSTROBE;
  wire [0:3]microblaze_0_dlmb_BE;
  wire microblaze_0_dlmb_CE;
  wire [0:31]microblaze_0_dlmb_READDBUS;
  wire microblaze_0_dlmb_READSTROBE;
  wire microblaze_0_dlmb_READY;
  wire microblaze_0_dlmb_UE;
  wire microblaze_0_dlmb_WAIT;
  wire [0:31]microblaze_0_dlmb_WRITEDBUS;
  wire microblaze_0_dlmb_WRITESTROBE;
  wire [0:31]microblaze_0_dlmb_bus_ABUS;
  wire microblaze_0_dlmb_bus_ADDRSTROBE;
  wire [0:3]microblaze_0_dlmb_bus_BE;
  wire microblaze_0_dlmb_bus_CE;
  wire [0:31]microblaze_0_dlmb_bus_READDBUS;
  wire microblaze_0_dlmb_bus_READSTROBE;
  wire microblaze_0_dlmb_bus_READY;
  wire microblaze_0_dlmb_bus_UE;
  wire microblaze_0_dlmb_bus_WAIT;
  wire [0:31]microblaze_0_dlmb_bus_WRITEDBUS;
  wire microblaze_0_dlmb_bus_WRITESTROBE;
  wire [0:31]microblaze_0_dlmb_cntlr_ADDR;
  wire microblaze_0_dlmb_cntlr_CLK;
  wire [0:31]microblaze_0_dlmb_cntlr_DIN;
  wire [31:0]microblaze_0_dlmb_cntlr_DOUT;
  wire microblaze_0_dlmb_cntlr_EN;
  wire microblaze_0_dlmb_cntlr_RST;
  wire [0:3]microblaze_0_dlmb_cntlr_WE;
  wire [0:31]microblaze_0_ilmb_ABUS;
  wire microblaze_0_ilmb_ADDRSTROBE;
  wire microblaze_0_ilmb_CE;
  wire [0:31]microblaze_0_ilmb_READDBUS;
  wire microblaze_0_ilmb_READSTROBE;
  wire microblaze_0_ilmb_READY;
  wire microblaze_0_ilmb_UE;
  wire microblaze_0_ilmb_WAIT;
  wire [0:31]microblaze_0_ilmb_bus_ABUS;
  wire microblaze_0_ilmb_bus_ADDRSTROBE;
  wire [0:3]microblaze_0_ilmb_bus_BE;
  wire microblaze_0_ilmb_bus_CE;
  wire [0:31]microblaze_0_ilmb_bus_READDBUS;
  wire microblaze_0_ilmb_bus_READSTROBE;
  wire microblaze_0_ilmb_bus_READY;
  wire microblaze_0_ilmb_bus_UE;
  wire microblaze_0_ilmb_bus_WAIT;
  wire [0:31]microblaze_0_ilmb_bus_WRITEDBUS;
  wire microblaze_0_ilmb_bus_WRITESTROBE;
  wire [0:31]microblaze_0_ilmb_cntlr_ADDR;
  wire microblaze_0_ilmb_cntlr_CLK;
  wire [0:31]microblaze_0_ilmb_cntlr_DIN;
  wire [31:0]microblaze_0_ilmb_cntlr_DOUT;
  wire microblaze_0_ilmb_cntlr_EN;
  wire microblaze_0_ilmb_cntlr_RST;
  wire [0:3]microblaze_0_ilmb_cntlr_WE;
  wire s_axi_aclk_1;

  assign DLMB_ce = microblaze_0_dlmb_CE;
  assign DLMB_readdbus[0:31] = microblaze_0_dlmb_READDBUS;
  assign DLMB_ready = microblaze_0_dlmb_READY;
  assign DLMB_ue = microblaze_0_dlmb_UE;
  assign DLMB_wait = microblaze_0_dlmb_WAIT;
  assign ILMB_ce = microblaze_0_ilmb_CE;
  assign ILMB_readdbus[0:31] = microblaze_0_ilmb_READDBUS;
  assign ILMB_ready = microblaze_0_ilmb_READY;
  assign ILMB_ue = microblaze_0_ilmb_UE;
  assign ILMB_wait = microblaze_0_ilmb_WAIT;
  assign SYS_Rst_1 = SYS_Rst;
  assign microblaze_0_dlmb_ABUS = DLMB_abus[0:31];
  assign microblaze_0_dlmb_ADDRSTROBE = DLMB_addrstrobe;
  assign microblaze_0_dlmb_BE = DLMB_be[0:3];
  assign microblaze_0_dlmb_READSTROBE = DLMB_readstrobe;
  assign microblaze_0_dlmb_WRITEDBUS = DLMB_writedbus[0:31];
  assign microblaze_0_dlmb_WRITESTROBE = DLMB_writestrobe;
  assign microblaze_0_ilmb_ABUS = ILMB_abus[0:31];
  assign microblaze_0_ilmb_ADDRSTROBE = ILMB_addrstrobe;
  assign microblaze_0_ilmb_READSTROBE = ILMB_readstrobe;
  assign s_axi_aclk_1 = s_axi_aclk;
  (* BMM_INFO_ADDRESS_SPACE = "byte  0x00000000 32 > rfdc_ex microblaze_0_local_memory/lmb_bram" *) 
  (* KEEP_HIERARCHY = "yes" *) 
  rfdc_ex_dlmb_bram_if_cntlr_0 dlmb_bram_if_cntlr
       (.BRAM_Addr_A(microblaze_0_dlmb_cntlr_ADDR),
        .BRAM_Clk_A(microblaze_0_dlmb_cntlr_CLK),
        .BRAM_Din_A({microblaze_0_dlmb_cntlr_DOUT[31],microblaze_0_dlmb_cntlr_DOUT[30],microblaze_0_dlmb_cntlr_DOUT[29],microblaze_0_dlmb_cntlr_DOUT[28],microblaze_0_dlmb_cntlr_DOUT[27],microblaze_0_dlmb_cntlr_DOUT[26],microblaze_0_dlmb_cntlr_DOUT[25],microblaze_0_dlmb_cntlr_DOUT[24],microblaze_0_dlmb_cntlr_DOUT[23],microblaze_0_dlmb_cntlr_DOUT[22],microblaze_0_dlmb_cntlr_DOUT[21],microblaze_0_dlmb_cntlr_DOUT[20],microblaze_0_dlmb_cntlr_DOUT[19],microblaze_0_dlmb_cntlr_DOUT[18],microblaze_0_dlmb_cntlr_DOUT[17],microblaze_0_dlmb_cntlr_DOUT[16],microblaze_0_dlmb_cntlr_DOUT[15],microblaze_0_dlmb_cntlr_DOUT[14],microblaze_0_dlmb_cntlr_DOUT[13],microblaze_0_dlmb_cntlr_DOUT[12],microblaze_0_dlmb_cntlr_DOUT[11],microblaze_0_dlmb_cntlr_DOUT[10],microblaze_0_dlmb_cntlr_DOUT[9],microblaze_0_dlmb_cntlr_DOUT[8],microblaze_0_dlmb_cntlr_DOUT[7],microblaze_0_dlmb_cntlr_DOUT[6],microblaze_0_dlmb_cntlr_DOUT[5],microblaze_0_dlmb_cntlr_DOUT[4],microblaze_0_dlmb_cntlr_DOUT[3],microblaze_0_dlmb_cntlr_DOUT[2],microblaze_0_dlmb_cntlr_DOUT[1],microblaze_0_dlmb_cntlr_DOUT[0]}),
        .BRAM_Dout_A(microblaze_0_dlmb_cntlr_DIN),
        .BRAM_EN_A(microblaze_0_dlmb_cntlr_EN),
        .BRAM_Rst_A(microblaze_0_dlmb_cntlr_RST),
        .BRAM_WEN_A(microblaze_0_dlmb_cntlr_WE),
        .LMB_ABus(microblaze_0_dlmb_bus_ABUS),
        .LMB_AddrStrobe(microblaze_0_dlmb_bus_ADDRSTROBE),
        .LMB_BE(microblaze_0_dlmb_bus_BE),
        .LMB_Clk(s_axi_aclk_1),
        .LMB_ReadStrobe(microblaze_0_dlmb_bus_READSTROBE),
        .LMB_Rst(SYS_Rst_1),
        .LMB_WriteDBus(microblaze_0_dlmb_bus_WRITEDBUS),
        .LMB_WriteStrobe(microblaze_0_dlmb_bus_WRITESTROBE),
        .Sl_CE(microblaze_0_dlmb_bus_CE),
        .Sl_DBus(microblaze_0_dlmb_bus_READDBUS),
        .Sl_Ready(microblaze_0_dlmb_bus_READY),
        .Sl_UE(microblaze_0_dlmb_bus_UE),
        .Sl_Wait(microblaze_0_dlmb_bus_WAIT));
  rfdc_ex_dlmb_v10_0 dlmb_v10
       (.LMB_ABus(microblaze_0_dlmb_bus_ABUS),
        .LMB_AddrStrobe(microblaze_0_dlmb_bus_ADDRSTROBE),
        .LMB_BE(microblaze_0_dlmb_bus_BE),
        .LMB_CE(microblaze_0_dlmb_CE),
        .LMB_Clk(s_axi_aclk_1),
        .LMB_ReadDBus(microblaze_0_dlmb_READDBUS),
        .LMB_ReadStrobe(microblaze_0_dlmb_bus_READSTROBE),
        .LMB_Ready(microblaze_0_dlmb_READY),
        .LMB_UE(microblaze_0_dlmb_UE),
        .LMB_Wait(microblaze_0_dlmb_WAIT),
        .LMB_WriteDBus(microblaze_0_dlmb_bus_WRITEDBUS),
        .LMB_WriteStrobe(microblaze_0_dlmb_bus_WRITESTROBE),
        .M_ABus(microblaze_0_dlmb_ABUS),
        .M_AddrStrobe(microblaze_0_dlmb_ADDRSTROBE),
        .M_BE(microblaze_0_dlmb_BE),
        .M_DBus(microblaze_0_dlmb_WRITEDBUS),
        .M_ReadStrobe(microblaze_0_dlmb_READSTROBE),
        .M_WriteStrobe(microblaze_0_dlmb_WRITESTROBE),
        .SYS_Rst(SYS_Rst_1),
        .Sl_CE(microblaze_0_dlmb_bus_CE),
        .Sl_DBus(microblaze_0_dlmb_bus_READDBUS),
        .Sl_Ready(microblaze_0_dlmb_bus_READY),
        .Sl_UE(microblaze_0_dlmb_bus_UE),
        .Sl_Wait(microblaze_0_dlmb_bus_WAIT));
  rfdc_ex_ilmb_bram_if_cntlr_0 ilmb_bram_if_cntlr
       (.BRAM_Addr_A(microblaze_0_ilmb_cntlr_ADDR),
        .BRAM_Clk_A(microblaze_0_ilmb_cntlr_CLK),
        .BRAM_Din_A({microblaze_0_ilmb_cntlr_DOUT[31],microblaze_0_ilmb_cntlr_DOUT[30],microblaze_0_ilmb_cntlr_DOUT[29],microblaze_0_ilmb_cntlr_DOUT[28],microblaze_0_ilmb_cntlr_DOUT[27],microblaze_0_ilmb_cntlr_DOUT[26],microblaze_0_ilmb_cntlr_DOUT[25],microblaze_0_ilmb_cntlr_DOUT[24],microblaze_0_ilmb_cntlr_DOUT[23],microblaze_0_ilmb_cntlr_DOUT[22],microblaze_0_ilmb_cntlr_DOUT[21],microblaze_0_ilmb_cntlr_DOUT[20],microblaze_0_ilmb_cntlr_DOUT[19],microblaze_0_ilmb_cntlr_DOUT[18],microblaze_0_ilmb_cntlr_DOUT[17],microblaze_0_ilmb_cntlr_DOUT[16],microblaze_0_ilmb_cntlr_DOUT[15],microblaze_0_ilmb_cntlr_DOUT[14],microblaze_0_ilmb_cntlr_DOUT[13],microblaze_0_ilmb_cntlr_DOUT[12],microblaze_0_ilmb_cntlr_DOUT[11],microblaze_0_ilmb_cntlr_DOUT[10],microblaze_0_ilmb_cntlr_DOUT[9],microblaze_0_ilmb_cntlr_DOUT[8],microblaze_0_ilmb_cntlr_DOUT[7],microblaze_0_ilmb_cntlr_DOUT[6],microblaze_0_ilmb_cntlr_DOUT[5],microblaze_0_ilmb_cntlr_DOUT[4],microblaze_0_ilmb_cntlr_DOUT[3],microblaze_0_ilmb_cntlr_DOUT[2],microblaze_0_ilmb_cntlr_DOUT[1],microblaze_0_ilmb_cntlr_DOUT[0]}),
        .BRAM_Dout_A(microblaze_0_ilmb_cntlr_DIN),
        .BRAM_EN_A(microblaze_0_ilmb_cntlr_EN),
        .BRAM_Rst_A(microblaze_0_ilmb_cntlr_RST),
        .BRAM_WEN_A(microblaze_0_ilmb_cntlr_WE),
        .LMB_ABus(microblaze_0_ilmb_bus_ABUS),
        .LMB_AddrStrobe(microblaze_0_ilmb_bus_ADDRSTROBE),
        .LMB_BE(microblaze_0_ilmb_bus_BE),
        .LMB_Clk(s_axi_aclk_1),
        .LMB_ReadStrobe(microblaze_0_ilmb_bus_READSTROBE),
        .LMB_Rst(SYS_Rst_1),
        .LMB_WriteDBus(microblaze_0_ilmb_bus_WRITEDBUS),
        .LMB_WriteStrobe(microblaze_0_ilmb_bus_WRITESTROBE),
        .Sl_CE(microblaze_0_ilmb_bus_CE),
        .Sl_DBus(microblaze_0_ilmb_bus_READDBUS),
        .Sl_Ready(microblaze_0_ilmb_bus_READY),
        .Sl_UE(microblaze_0_ilmb_bus_UE),
        .Sl_Wait(microblaze_0_ilmb_bus_WAIT));
  rfdc_ex_ilmb_v10_0 ilmb_v10
       (.LMB_ABus(microblaze_0_ilmb_bus_ABUS),
        .LMB_AddrStrobe(microblaze_0_ilmb_bus_ADDRSTROBE),
        .LMB_BE(microblaze_0_ilmb_bus_BE),
        .LMB_CE(microblaze_0_ilmb_CE),
        .LMB_Clk(s_axi_aclk_1),
        .LMB_ReadDBus(microblaze_0_ilmb_READDBUS),
        .LMB_ReadStrobe(microblaze_0_ilmb_bus_READSTROBE),
        .LMB_Ready(microblaze_0_ilmb_READY),
        .LMB_UE(microblaze_0_ilmb_UE),
        .LMB_Wait(microblaze_0_ilmb_WAIT),
        .LMB_WriteDBus(microblaze_0_ilmb_bus_WRITEDBUS),
        .LMB_WriteStrobe(microblaze_0_ilmb_bus_WRITESTROBE),
        .M_ABus(microblaze_0_ilmb_ABUS),
        .M_AddrStrobe(microblaze_0_ilmb_ADDRSTROBE),
        .M_BE({1'b0,1'b0,1'b0,1'b0}),
        .M_DBus({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .M_ReadStrobe(microblaze_0_ilmb_READSTROBE),
        .M_WriteStrobe(1'b0),
        .SYS_Rst(SYS_Rst_1),
        .Sl_CE(microblaze_0_ilmb_bus_CE),
        .Sl_DBus(microblaze_0_ilmb_bus_READDBUS),
        .Sl_Ready(microblaze_0_ilmb_bus_READY),
        .Sl_UE(microblaze_0_ilmb_bus_UE),
        .Sl_Wait(microblaze_0_ilmb_bus_WAIT));
  rfdc_ex_lmb_bram_0 lmb_bram
       (.addra({microblaze_0_dlmb_cntlr_ADDR[0],microblaze_0_dlmb_cntlr_ADDR[1],microblaze_0_dlmb_cntlr_ADDR[2],microblaze_0_dlmb_cntlr_ADDR[3],microblaze_0_dlmb_cntlr_ADDR[4],microblaze_0_dlmb_cntlr_ADDR[5],microblaze_0_dlmb_cntlr_ADDR[6],microblaze_0_dlmb_cntlr_ADDR[7],microblaze_0_dlmb_cntlr_ADDR[8],microblaze_0_dlmb_cntlr_ADDR[9],microblaze_0_dlmb_cntlr_ADDR[10],microblaze_0_dlmb_cntlr_ADDR[11],microblaze_0_dlmb_cntlr_ADDR[12],microblaze_0_dlmb_cntlr_ADDR[13],microblaze_0_dlmb_cntlr_ADDR[14],microblaze_0_dlmb_cntlr_ADDR[15],microblaze_0_dlmb_cntlr_ADDR[16],microblaze_0_dlmb_cntlr_ADDR[17],microblaze_0_dlmb_cntlr_ADDR[18],microblaze_0_dlmb_cntlr_ADDR[19],microblaze_0_dlmb_cntlr_ADDR[20],microblaze_0_dlmb_cntlr_ADDR[21],microblaze_0_dlmb_cntlr_ADDR[22],microblaze_0_dlmb_cntlr_ADDR[23],microblaze_0_dlmb_cntlr_ADDR[24],microblaze_0_dlmb_cntlr_ADDR[25],microblaze_0_dlmb_cntlr_ADDR[26],microblaze_0_dlmb_cntlr_ADDR[27],microblaze_0_dlmb_cntlr_ADDR[28],microblaze_0_dlmb_cntlr_ADDR[29],microblaze_0_dlmb_cntlr_ADDR[30],microblaze_0_dlmb_cntlr_ADDR[31]}),
        .addrb({microblaze_0_ilmb_cntlr_ADDR[0],microblaze_0_ilmb_cntlr_ADDR[1],microblaze_0_ilmb_cntlr_ADDR[2],microblaze_0_ilmb_cntlr_ADDR[3],microblaze_0_ilmb_cntlr_ADDR[4],microblaze_0_ilmb_cntlr_ADDR[5],microblaze_0_ilmb_cntlr_ADDR[6],microblaze_0_ilmb_cntlr_ADDR[7],microblaze_0_ilmb_cntlr_ADDR[8],microblaze_0_ilmb_cntlr_ADDR[9],microblaze_0_ilmb_cntlr_ADDR[10],microblaze_0_ilmb_cntlr_ADDR[11],microblaze_0_ilmb_cntlr_ADDR[12],microblaze_0_ilmb_cntlr_ADDR[13],microblaze_0_ilmb_cntlr_ADDR[14],microblaze_0_ilmb_cntlr_ADDR[15],microblaze_0_ilmb_cntlr_ADDR[16],microblaze_0_ilmb_cntlr_ADDR[17],microblaze_0_ilmb_cntlr_ADDR[18],microblaze_0_ilmb_cntlr_ADDR[19],microblaze_0_ilmb_cntlr_ADDR[20],microblaze_0_ilmb_cntlr_ADDR[21],microblaze_0_ilmb_cntlr_ADDR[22],microblaze_0_ilmb_cntlr_ADDR[23],microblaze_0_ilmb_cntlr_ADDR[24],microblaze_0_ilmb_cntlr_ADDR[25],microblaze_0_ilmb_cntlr_ADDR[26],microblaze_0_ilmb_cntlr_ADDR[27],microblaze_0_ilmb_cntlr_ADDR[28],microblaze_0_ilmb_cntlr_ADDR[29],microblaze_0_ilmb_cntlr_ADDR[30],microblaze_0_ilmb_cntlr_ADDR[31]}),
        .clka(microblaze_0_dlmb_cntlr_CLK),
        .clkb(microblaze_0_ilmb_cntlr_CLK),
        .dina({microblaze_0_dlmb_cntlr_DIN[0],microblaze_0_dlmb_cntlr_DIN[1],microblaze_0_dlmb_cntlr_DIN[2],microblaze_0_dlmb_cntlr_DIN[3],microblaze_0_dlmb_cntlr_DIN[4],microblaze_0_dlmb_cntlr_DIN[5],microblaze_0_dlmb_cntlr_DIN[6],microblaze_0_dlmb_cntlr_DIN[7],microblaze_0_dlmb_cntlr_DIN[8],microblaze_0_dlmb_cntlr_DIN[9],microblaze_0_dlmb_cntlr_DIN[10],microblaze_0_dlmb_cntlr_DIN[11],microblaze_0_dlmb_cntlr_DIN[12],microblaze_0_dlmb_cntlr_DIN[13],microblaze_0_dlmb_cntlr_DIN[14],microblaze_0_dlmb_cntlr_DIN[15],microblaze_0_dlmb_cntlr_DIN[16],microblaze_0_dlmb_cntlr_DIN[17],microblaze_0_dlmb_cntlr_DIN[18],microblaze_0_dlmb_cntlr_DIN[19],microblaze_0_dlmb_cntlr_DIN[20],microblaze_0_dlmb_cntlr_DIN[21],microblaze_0_dlmb_cntlr_DIN[22],microblaze_0_dlmb_cntlr_DIN[23],microblaze_0_dlmb_cntlr_DIN[24],microblaze_0_dlmb_cntlr_DIN[25],microblaze_0_dlmb_cntlr_DIN[26],microblaze_0_dlmb_cntlr_DIN[27],microblaze_0_dlmb_cntlr_DIN[28],microblaze_0_dlmb_cntlr_DIN[29],microblaze_0_dlmb_cntlr_DIN[30],microblaze_0_dlmb_cntlr_DIN[31]}),
        .dinb({microblaze_0_ilmb_cntlr_DIN[0],microblaze_0_ilmb_cntlr_DIN[1],microblaze_0_ilmb_cntlr_DIN[2],microblaze_0_ilmb_cntlr_DIN[3],microblaze_0_ilmb_cntlr_DIN[4],microblaze_0_ilmb_cntlr_DIN[5],microblaze_0_ilmb_cntlr_DIN[6],microblaze_0_ilmb_cntlr_DIN[7],microblaze_0_ilmb_cntlr_DIN[8],microblaze_0_ilmb_cntlr_DIN[9],microblaze_0_ilmb_cntlr_DIN[10],microblaze_0_ilmb_cntlr_DIN[11],microblaze_0_ilmb_cntlr_DIN[12],microblaze_0_ilmb_cntlr_DIN[13],microblaze_0_ilmb_cntlr_DIN[14],microblaze_0_ilmb_cntlr_DIN[15],microblaze_0_ilmb_cntlr_DIN[16],microblaze_0_ilmb_cntlr_DIN[17],microblaze_0_ilmb_cntlr_DIN[18],microblaze_0_ilmb_cntlr_DIN[19],microblaze_0_ilmb_cntlr_DIN[20],microblaze_0_ilmb_cntlr_DIN[21],microblaze_0_ilmb_cntlr_DIN[22],microblaze_0_ilmb_cntlr_DIN[23],microblaze_0_ilmb_cntlr_DIN[24],microblaze_0_ilmb_cntlr_DIN[25],microblaze_0_ilmb_cntlr_DIN[26],microblaze_0_ilmb_cntlr_DIN[27],microblaze_0_ilmb_cntlr_DIN[28],microblaze_0_ilmb_cntlr_DIN[29],microblaze_0_ilmb_cntlr_DIN[30],microblaze_0_ilmb_cntlr_DIN[31]}),
        .douta(microblaze_0_dlmb_cntlr_DOUT),
        .doutb(microblaze_0_ilmb_cntlr_DOUT),
        .ena(microblaze_0_dlmb_cntlr_EN),
        .enb(microblaze_0_ilmb_cntlr_EN),
        .rsta(microblaze_0_dlmb_cntlr_RST),
        .rstb(microblaze_0_ilmb_cntlr_RST),
        .wea({microblaze_0_dlmb_cntlr_WE[0],microblaze_0_dlmb_cntlr_WE[1],microblaze_0_dlmb_cntlr_WE[2],microblaze_0_dlmb_cntlr_WE[3]}),
        .web({microblaze_0_ilmb_cntlr_WE[0],microblaze_0_ilmb_cntlr_WE[1],microblaze_0_ilmb_cntlr_WE[2],microblaze_0_ilmb_cntlr_WE[3]}));
endmodule

(* CORE_GENERATION_INFO = "rfdc_ex,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=rfdc_ex,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=18,numReposBlks=15,numNonXlnxBlks=0,numHierBlks=3,maxHierDepth=1,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=2,numPkgbdBlks=0,bdsource=USER,synth_mode=Hierarchical}" *) (* HW_HANDOFF = "rfdc_ex.hwdef" *) 
module rfdc_ex
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
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 adc1_clk CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME adc1_clk, CAN_DEBUG false, FREQ_HZ 250000000" *) input adc1_clk_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 adc1_clk CLK_P" *) input adc1_clk_clk_p;
  input adc1_hw_trigger;
  input adc1_hw_trigger_en;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 dac0_clk CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME dac0_clk, CAN_DEBUG false, FREQ_HZ 400000000" *) input dac0_clk_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 dac0_clk CLK_P" *) input dac0_clk_clk_p;
  input dac0_hw_trigger;
  input dac0_hw_trigger_en;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m10_0 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME m10_0, CLK_DOMAIN rfdc_ex_usp_rf_data_converter_0_0_clk_adc1, FREQ_HZ 31250000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 16, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) output [127:0]m10_0_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m10_0 TREADY" *) input m10_0_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 m10_0 TVALID" *) output m10_0_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.M1_AXIS_ACLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.M1_AXIS_ACLK, ASSOCIATED_BUSIF m10_0, CLK_DOMAIN rfdc_ex_usp_rf_data_converter_0_0_clk_adc1, FREQ_HZ 31250000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) output m1_axis_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s00_0 TDATA" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME s00_0, CLK_DOMAIN rfdc_ex_usp_rf_data_converter_0_0_clk_dac0, FREQ_HZ 50000000, HAS_TKEEP 0, HAS_TLAST 0, HAS_TREADY 1, HAS_TSTRB 0, INSERT_VIP 0, LAYERED_METADATA undef, PHASE 0.0, TDATA_NUM_BYTES 32, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0" *) input [255:0]s00_0_tdata;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s00_0 TREADY" *) output s00_0_tready;
  (* X_INTERFACE_INFO = "xilinx.com:interface:axis:1.0 s00_0 TVALID" *) input s00_0_tvalid;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.S0_AXIS_ACLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.S0_AXIS_ACLK, ASSOCIATED_BUSIF s00_0, CLK_DOMAIN rfdc_ex_usp_rf_data_converter_0_0_clk_dac0, FREQ_HZ 50000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) output s0_axis_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.S_AXI_ACLK CLK" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.S_AXI_ACLK, CLK_DOMAIN rfdc_ex_s_axi_aclk, FREQ_HZ 57500000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0" *) input s_axi_aclk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 RST.S_AXI_ARESETN RST" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME RST.S_AXI_ARESETN, INSERT_VIP 0, POLARITY ACTIVE_LOW" *) input s_axi_aresetn;
  (* X_INTERFACE_INFO = "xilinx.com:display_usp_rf_data_converter:diff_pins:1.0 sysref_in diff_n" *) input sysref_in_diff_n;
  (* X_INTERFACE_INFO = "xilinx.com:display_usp_rf_data_converter:diff_pins:1.0 sysref_in diff_p" *) input sysref_in_diff_p;
  input user_select_00_0;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vin10 " *) input vin10_v_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vin10 " *) input vin10_v_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vout00 " *) output vout00_v_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_analog_io:1.0 vout00 " *) output vout00_v_p;

  wire adc1_clk_1_CLK_N;
  wire adc1_clk_1_CLK_P;
  wire adc1_hw_trigger_1;
  wire adc1_hw_trigger_en_1;
  wire clk_wiz_adc0_clk_out1;
  wire clk_wiz_dac0_clk_out1;
  wire clk_wiz_dac0_locked;
  wire dac0_clk_1_CLK_N;
  wire dac0_clk_1_CLK_P;
  wire dac0_hw_trigger_1;
  wire dac0_hw_trigger_en_1;
  wire [10:0]ex_design_M03_AXI_ARADDR;
  wire ex_design_M03_AXI_ARREADY;
  wire ex_design_M03_AXI_ARVALID;
  wire [10:0]ex_design_M03_AXI_AWADDR;
  wire ex_design_M03_AXI_AWREADY;
  wire ex_design_M03_AXI_AWVALID;
  wire ex_design_M03_AXI_BREADY;
  wire [1:0]ex_design_M03_AXI_BRESP;
  wire ex_design_M03_AXI_BVALID;
  wire [31:0]ex_design_M03_AXI_RDATA;
  wire ex_design_M03_AXI_RREADY;
  wire [1:0]ex_design_M03_AXI_RRESP;
  wire ex_design_M03_AXI_RVALID;
  wire [31:0]ex_design_M03_AXI_WDATA;
  wire ex_design_M03_AXI_WREADY;
  wire [3:0]ex_design_M03_AXI_WSTRB;
  wire ex_design_M03_AXI_WVALID;
  wire [10:0]ex_design_M04_AXI_ARADDR;
  wire ex_design_M04_AXI_ARREADY;
  wire ex_design_M04_AXI_ARVALID;
  wire [10:0]ex_design_M04_AXI_AWADDR;
  wire ex_design_M04_AXI_AWREADY;
  wire ex_design_M04_AXI_AWVALID;
  wire ex_design_M04_AXI_BREADY;
  wire [1:0]ex_design_M04_AXI_BRESP;
  wire ex_design_M04_AXI_BVALID;
  wire [31:0]ex_design_M04_AXI_RDATA;
  wire ex_design_M04_AXI_RREADY;
  wire [1:0]ex_design_M04_AXI_RRESP;
  wire ex_design_M04_AXI_RVALID;
  wire [31:0]ex_design_M04_AXI_WDATA;
  wire ex_design_M04_AXI_WREADY;
  wire [3:0]ex_design_M04_AXI_WSTRB;
  wire ex_design_M04_AXI_WVALID;
  wire [4:0]ex_design_M05_AXI_ARADDR;
  wire ex_design_M05_AXI_ARREADY;
  wire ex_design_M05_AXI_ARVALID;
  wire [4:0]ex_design_M05_AXI_AWADDR;
  wire ex_design_M05_AXI_AWREADY;
  wire ex_design_M05_AXI_AWVALID;
  wire ex_design_M05_AXI_BREADY;
  wire [1:0]ex_design_M05_AXI_BRESP;
  wire ex_design_M05_AXI_BVALID;
  wire [31:0]ex_design_M05_AXI_RDATA;
  wire ex_design_M05_AXI_RREADY;
  wire [1:0]ex_design_M05_AXI_RRESP;
  wire ex_design_M05_AXI_RVALID;
  wire [31:0]ex_design_M05_AXI_WDATA;
  wire ex_design_M05_AXI_WREADY;
  wire [3:0]ex_design_M05_AXI_WSTRB;
  wire ex_design_M05_AXI_WVALID;
  wire ex_design_clk_adc1;
  wire ex_design_clk_dac0;
  wire [127:0]ex_design_m10_0_TDATA;
  wire ex_design_m10_0_TREADY;
  wire ex_design_m10_0_TVALID;
  wire ex_design_vout00_V_N;
  wire ex_design_vout00_V_P;
  wire [31:0]jtag_axi_0_M_AXI_ARADDR;
  wire [1:0]jtag_axi_0_M_AXI_ARBURST;
  wire [3:0]jtag_axi_0_M_AXI_ARCACHE;
  wire [0:0]jtag_axi_0_M_AXI_ARID;
  wire [7:0]jtag_axi_0_M_AXI_ARLEN;
  wire jtag_axi_0_M_AXI_ARLOCK;
  wire [2:0]jtag_axi_0_M_AXI_ARPROT;
  wire [3:0]jtag_axi_0_M_AXI_ARQOS;
  wire jtag_axi_0_M_AXI_ARREADY;
  wire [2:0]jtag_axi_0_M_AXI_ARSIZE;
  wire jtag_axi_0_M_AXI_ARVALID;
  wire [31:0]jtag_axi_0_M_AXI_AWADDR;
  wire [1:0]jtag_axi_0_M_AXI_AWBURST;
  wire [3:0]jtag_axi_0_M_AXI_AWCACHE;
  wire [0:0]jtag_axi_0_M_AXI_AWID;
  wire [7:0]jtag_axi_0_M_AXI_AWLEN;
  wire jtag_axi_0_M_AXI_AWLOCK;
  wire [2:0]jtag_axi_0_M_AXI_AWPROT;
  wire [3:0]jtag_axi_0_M_AXI_AWQOS;
  wire jtag_axi_0_M_AXI_AWREADY;
  wire [2:0]jtag_axi_0_M_AXI_AWSIZE;
  wire jtag_axi_0_M_AXI_AWVALID;
  wire [0:0]jtag_axi_0_M_AXI_BID;
  wire jtag_axi_0_M_AXI_BREADY;
  wire [1:0]jtag_axi_0_M_AXI_BRESP;
  wire jtag_axi_0_M_AXI_BVALID;
  wire [31:0]jtag_axi_0_M_AXI_RDATA;
  wire [0:0]jtag_axi_0_M_AXI_RID;
  wire jtag_axi_0_M_AXI_RLAST;
  wire jtag_axi_0_M_AXI_RREADY;
  wire [1:0]jtag_axi_0_M_AXI_RRESP;
  wire jtag_axi_0_M_AXI_RVALID;
  wire [31:0]jtag_axi_0_M_AXI_WDATA;
  wire jtag_axi_0_M_AXI_WLAST;
  wire jtag_axi_0_M_AXI_WREADY;
  wire [3:0]jtag_axi_0_M_AXI_WSTRB;
  wire jtag_axi_0_M_AXI_WVALID;
  wire m1_axis_aresetn_1;
  wire mdm_1_debug_sys_rst;
  wire [31:0]microblaze_0_M_AXI_DP_ARADDR;
  wire [2:0]microblaze_0_M_AXI_DP_ARPROT;
  wire microblaze_0_M_AXI_DP_ARREADY;
  wire microblaze_0_M_AXI_DP_ARVALID;
  wire [31:0]microblaze_0_M_AXI_DP_AWADDR;
  wire [2:0]microblaze_0_M_AXI_DP_AWPROT;
  wire microblaze_0_M_AXI_DP_AWREADY;
  wire microblaze_0_M_AXI_DP_AWVALID;
  wire microblaze_0_M_AXI_DP_BREADY;
  wire [1:0]microblaze_0_M_AXI_DP_BRESP;
  wire microblaze_0_M_AXI_DP_BVALID;
  wire [31:0]microblaze_0_M_AXI_DP_RDATA;
  wire microblaze_0_M_AXI_DP_RREADY;
  wire [1:0]microblaze_0_M_AXI_DP_RRESP;
  wire microblaze_0_M_AXI_DP_RVALID;
  wire [31:0]microblaze_0_M_AXI_DP_WDATA;
  wire microblaze_0_M_AXI_DP_WREADY;
  wire [3:0]microblaze_0_M_AXI_DP_WSTRB;
  wire microblaze_0_M_AXI_DP_WVALID;
  wire microblaze_0_debug_CAPTURE;
  wire microblaze_0_debug_CLK;
  wire microblaze_0_debug_DISABLE;
  wire [0:7]microblaze_0_debug_REG_EN;
  wire microblaze_0_debug_RST;
  wire microblaze_0_debug_SHIFT;
  wire microblaze_0_debug_TDI;
  wire microblaze_0_debug_TDO;
  wire microblaze_0_debug_UPDATE;
  wire [0:31]microblaze_0_dlmb_1_ABUS;
  wire microblaze_0_dlmb_1_ADDRSTROBE;
  wire [0:3]microblaze_0_dlmb_1_BE;
  wire microblaze_0_dlmb_1_CE;
  wire [0:31]microblaze_0_dlmb_1_READDBUS;
  wire microblaze_0_dlmb_1_READSTROBE;
  wire microblaze_0_dlmb_1_READY;
  wire microblaze_0_dlmb_1_UE;
  wire microblaze_0_dlmb_1_WAIT;
  wire [0:31]microblaze_0_dlmb_1_WRITEDBUS;
  wire microblaze_0_dlmb_1_WRITESTROBE;
  wire [0:31]microblaze_0_ilmb_1_ABUS;
  wire microblaze_0_ilmb_1_ADDRSTROBE;
  wire microblaze_0_ilmb_1_CE;
  wire [0:31]microblaze_0_ilmb_1_READDBUS;
  wire microblaze_0_ilmb_1_READSTROBE;
  wire microblaze_0_ilmb_1_READY;
  wire microblaze_0_ilmb_1_UE;
  wire microblaze_0_ilmb_1_WAIT;
  wire [0:0]rst_s_axi_aclk_57M_bus_struct_reset;
  wire [0:0]rst_s_axi_aclk_57M_interconnect_aresetn;
  wire rst_s_axi_aclk_57M_mb_reset;
  wire [0:0]rst_s_axi_aclk_57M_peripheral_aresetn;
  wire [255:0]s00_0_1_TDATA;
  wire s00_0_1_TREADY;
  wire s00_0_1_TVALID;
  wire s_axi_aclk_1;
  wire s_axi_aresetn_1;
  wire sysref_in_1_diff_n;
  wire sysref_in_1_diff_p;
  wire user_select_00_0_1;
  wire vin10_1_V_N;
  wire vin10_1_V_P;

  assign adc1_clk_1_CLK_N = adc1_clk_clk_n;
  assign adc1_clk_1_CLK_P = adc1_clk_clk_p;
  assign adc1_hw_trigger_1 = adc1_hw_trigger;
  assign adc1_hw_trigger_en_1 = adc1_hw_trigger_en;
  assign dac0_clk_1_CLK_N = dac0_clk_clk_n;
  assign dac0_clk_1_CLK_P = dac0_clk_clk_p;
  assign dac0_hw_trigger_1 = dac0_hw_trigger;
  assign dac0_hw_trigger_en_1 = dac0_hw_trigger_en;
  assign ex_design_m10_0_TREADY = m10_0_tready;
  assign m10_0_tdata[127:0] = ex_design_m10_0_TDATA;
  assign m10_0_tvalid = ex_design_m10_0_TVALID;
  assign m1_axis_aclk = clk_wiz_adc0_clk_out1;
  assign s00_0_1_TDATA = s00_0_tdata[255:0];
  assign s00_0_1_TVALID = s00_0_tvalid;
  assign s00_0_tready = s00_0_1_TREADY;
  assign s0_axis_aclk = clk_wiz_dac0_clk_out1;
  assign s_axi_aclk_1 = s_axi_aclk;
  assign s_axi_aresetn_1 = s_axi_aresetn;
  assign sysref_in_1_diff_n = sysref_in_diff_n;
  assign sysref_in_1_diff_p = sysref_in_diff_p;
  assign user_select_00_0_1 = user_select_00_0;
  assign vin10_1_V_N = vin10_v_n;
  assign vin10_1_V_P = vin10_v_p;
  assign vout00_v_n = ex_design_vout00_V_N;
  assign vout00_v_p = ex_design_vout00_V_P;
  clocking_block_imp_1Q9S2IC clocking_block
       (.clk_in1(ex_design_clk_dac0),
        .clk_in2(ex_design_clk_adc1),
        .clk_out1(clk_wiz_adc0_clk_out1),
        .locked(clk_wiz_dac0_locked),
        .locked1(m1_axis_aresetn_1),
        .s0_axis_aclk(clk_wiz_dac0_clk_out1),
        .s_axi_aclk(s_axi_aclk_1),
        .s_axi_aresetn(rst_s_axi_aclk_57M_interconnect_aresetn),
        .s_axi_lite1_araddr(ex_design_M04_AXI_ARADDR),
        .s_axi_lite1_arready(ex_design_M04_AXI_ARREADY),
        .s_axi_lite1_arvalid(ex_design_M04_AXI_ARVALID),
        .s_axi_lite1_awaddr(ex_design_M04_AXI_AWADDR),
        .s_axi_lite1_awready(ex_design_M04_AXI_AWREADY),
        .s_axi_lite1_awvalid(ex_design_M04_AXI_AWVALID),
        .s_axi_lite1_bready(ex_design_M04_AXI_BREADY),
        .s_axi_lite1_bresp(ex_design_M04_AXI_BRESP),
        .s_axi_lite1_bvalid(ex_design_M04_AXI_BVALID),
        .s_axi_lite1_rdata(ex_design_M04_AXI_RDATA),
        .s_axi_lite1_rready(ex_design_M04_AXI_RREADY),
        .s_axi_lite1_rresp(ex_design_M04_AXI_RRESP),
        .s_axi_lite1_rvalid(ex_design_M04_AXI_RVALID),
        .s_axi_lite1_wdata(ex_design_M04_AXI_WDATA),
        .s_axi_lite1_wready(ex_design_M04_AXI_WREADY),
        .s_axi_lite1_wstrb(ex_design_M04_AXI_WSTRB),
        .s_axi_lite1_wvalid(ex_design_M04_AXI_WVALID),
        .s_axi_lite_araddr(ex_design_M03_AXI_ARADDR),
        .s_axi_lite_arready(ex_design_M03_AXI_ARREADY),
        .s_axi_lite_arvalid(ex_design_M03_AXI_ARVALID),
        .s_axi_lite_awaddr(ex_design_M03_AXI_AWADDR),
        .s_axi_lite_awready(ex_design_M03_AXI_AWREADY),
        .s_axi_lite_awvalid(ex_design_M03_AXI_AWVALID),
        .s_axi_lite_bready(ex_design_M03_AXI_BREADY),
        .s_axi_lite_bresp(ex_design_M03_AXI_BRESP),
        .s_axi_lite_bvalid(ex_design_M03_AXI_BVALID),
        .s_axi_lite_rdata(ex_design_M03_AXI_RDATA),
        .s_axi_lite_rready(ex_design_M03_AXI_RREADY),
        .s_axi_lite_rresp(ex_design_M03_AXI_RRESP),
        .s_axi_lite_rvalid(ex_design_M03_AXI_RVALID),
        .s_axi_lite_wdata(ex_design_M03_AXI_WDATA),
        .s_axi_lite_wready(ex_design_M03_AXI_WREADY),
        .s_axi_lite_wstrb(ex_design_M03_AXI_WSTRB),
        .s_axi_lite_wvalid(ex_design_M03_AXI_WVALID));
  ex_design_imp_1MGVD6J ex_design
       (.M03_AXI_araddr(ex_design_M03_AXI_ARADDR),
        .M03_AXI_arready(ex_design_M03_AXI_ARREADY),
        .M03_AXI_arvalid(ex_design_M03_AXI_ARVALID),
        .M03_AXI_awaddr(ex_design_M03_AXI_AWADDR),
        .M03_AXI_awready(ex_design_M03_AXI_AWREADY),
        .M03_AXI_awvalid(ex_design_M03_AXI_AWVALID),
        .M03_AXI_bready(ex_design_M03_AXI_BREADY),
        .M03_AXI_bresp(ex_design_M03_AXI_BRESP),
        .M03_AXI_bvalid(ex_design_M03_AXI_BVALID),
        .M03_AXI_rdata(ex_design_M03_AXI_RDATA),
        .M03_AXI_rready(ex_design_M03_AXI_RREADY),
        .M03_AXI_rresp(ex_design_M03_AXI_RRESP),
        .M03_AXI_rvalid(ex_design_M03_AXI_RVALID),
        .M03_AXI_wdata(ex_design_M03_AXI_WDATA),
        .M03_AXI_wready(ex_design_M03_AXI_WREADY),
        .M03_AXI_wstrb(ex_design_M03_AXI_WSTRB),
        .M03_AXI_wvalid(ex_design_M03_AXI_WVALID),
        .M04_AXI_araddr(ex_design_M04_AXI_ARADDR),
        .M04_AXI_arready(ex_design_M04_AXI_ARREADY),
        .M04_AXI_arvalid(ex_design_M04_AXI_ARVALID),
        .M04_AXI_awaddr(ex_design_M04_AXI_AWADDR),
        .M04_AXI_awready(ex_design_M04_AXI_AWREADY),
        .M04_AXI_awvalid(ex_design_M04_AXI_AWVALID),
        .M04_AXI_bready(ex_design_M04_AXI_BREADY),
        .M04_AXI_bresp(ex_design_M04_AXI_BRESP),
        .M04_AXI_bvalid(ex_design_M04_AXI_BVALID),
        .M04_AXI_rdata(ex_design_M04_AXI_RDATA),
        .M04_AXI_rready(ex_design_M04_AXI_RREADY),
        .M04_AXI_rresp(ex_design_M04_AXI_RRESP),
        .M04_AXI_rvalid(ex_design_M04_AXI_RVALID),
        .M04_AXI_wdata(ex_design_M04_AXI_WDATA),
        .M04_AXI_wready(ex_design_M04_AXI_WREADY),
        .M04_AXI_wstrb(ex_design_M04_AXI_WSTRB),
        .M04_AXI_wvalid(ex_design_M04_AXI_WVALID),
        .M05_AXI_araddr(ex_design_M05_AXI_ARADDR),
        .M05_AXI_arready(ex_design_M05_AXI_ARREADY),
        .M05_AXI_arvalid(ex_design_M05_AXI_ARVALID),
        .M05_AXI_awaddr(ex_design_M05_AXI_AWADDR),
        .M05_AXI_awready(ex_design_M05_AXI_AWREADY),
        .M05_AXI_awvalid(ex_design_M05_AXI_AWVALID),
        .M05_AXI_bready(ex_design_M05_AXI_BREADY),
        .M05_AXI_bresp(ex_design_M05_AXI_BRESP),
        .M05_AXI_bvalid(ex_design_M05_AXI_BVALID),
        .M05_AXI_rdata(ex_design_M05_AXI_RDATA),
        .M05_AXI_rready(ex_design_M05_AXI_RREADY),
        .M05_AXI_rresp(ex_design_M05_AXI_RRESP),
        .M05_AXI_rvalid(ex_design_M05_AXI_RVALID),
        .M05_AXI_wdata(ex_design_M05_AXI_WDATA),
        .M05_AXI_wready(ex_design_M05_AXI_WREADY),
        .M05_AXI_wstrb(ex_design_M05_AXI_WSTRB),
        .M05_AXI_wvalid(ex_design_M05_AXI_WVALID),
        .S00_AXI_araddr(jtag_axi_0_M_AXI_ARADDR),
        .S00_AXI_arburst(jtag_axi_0_M_AXI_ARBURST),
        .S00_AXI_arcache(jtag_axi_0_M_AXI_ARCACHE),
        .S00_AXI_arid(jtag_axi_0_M_AXI_ARID),
        .S00_AXI_arlen(jtag_axi_0_M_AXI_ARLEN),
        .S00_AXI_arlock(jtag_axi_0_M_AXI_ARLOCK),
        .S00_AXI_arprot(jtag_axi_0_M_AXI_ARPROT),
        .S00_AXI_arqos(jtag_axi_0_M_AXI_ARQOS),
        .S00_AXI_arready(jtag_axi_0_M_AXI_ARREADY),
        .S00_AXI_arsize(jtag_axi_0_M_AXI_ARSIZE),
        .S00_AXI_arvalid(jtag_axi_0_M_AXI_ARVALID),
        .S00_AXI_awaddr(jtag_axi_0_M_AXI_AWADDR),
        .S00_AXI_awburst(jtag_axi_0_M_AXI_AWBURST),
        .S00_AXI_awcache(jtag_axi_0_M_AXI_AWCACHE),
        .S00_AXI_awid(jtag_axi_0_M_AXI_AWID),
        .S00_AXI_awlen(jtag_axi_0_M_AXI_AWLEN),
        .S00_AXI_awlock(jtag_axi_0_M_AXI_AWLOCK),
        .S00_AXI_awprot(jtag_axi_0_M_AXI_AWPROT),
        .S00_AXI_awqos(jtag_axi_0_M_AXI_AWQOS),
        .S00_AXI_awready(jtag_axi_0_M_AXI_AWREADY),
        .S00_AXI_awsize(jtag_axi_0_M_AXI_AWSIZE),
        .S00_AXI_awvalid(jtag_axi_0_M_AXI_AWVALID),
        .S00_AXI_bid(jtag_axi_0_M_AXI_BID),
        .S00_AXI_bready(jtag_axi_0_M_AXI_BREADY),
        .S00_AXI_bresp(jtag_axi_0_M_AXI_BRESP),
        .S00_AXI_bvalid(jtag_axi_0_M_AXI_BVALID),
        .S00_AXI_rdata(jtag_axi_0_M_AXI_RDATA),
        .S00_AXI_rid(jtag_axi_0_M_AXI_RID),
        .S00_AXI_rlast(jtag_axi_0_M_AXI_RLAST),
        .S00_AXI_rready(jtag_axi_0_M_AXI_RREADY),
        .S00_AXI_rresp(jtag_axi_0_M_AXI_RRESP),
        .S00_AXI_rvalid(jtag_axi_0_M_AXI_RVALID),
        .S00_AXI_wdata(jtag_axi_0_M_AXI_WDATA),
        .S00_AXI_wlast(jtag_axi_0_M_AXI_WLAST),
        .S00_AXI_wready(jtag_axi_0_M_AXI_WREADY),
        .S00_AXI_wstrb(jtag_axi_0_M_AXI_WSTRB),
        .S00_AXI_wvalid(jtag_axi_0_M_AXI_WVALID),
        .S01_AXI_araddr(microblaze_0_M_AXI_DP_ARADDR),
        .S01_AXI_arprot(microblaze_0_M_AXI_DP_ARPROT),
        .S01_AXI_arready(microblaze_0_M_AXI_DP_ARREADY),
        .S01_AXI_arvalid(microblaze_0_M_AXI_DP_ARVALID),
        .S01_AXI_awaddr(microblaze_0_M_AXI_DP_AWADDR),
        .S01_AXI_awprot(microblaze_0_M_AXI_DP_AWPROT),
        .S01_AXI_awready(microblaze_0_M_AXI_DP_AWREADY),
        .S01_AXI_awvalid(microblaze_0_M_AXI_DP_AWVALID),
        .S01_AXI_bready(microblaze_0_M_AXI_DP_BREADY),
        .S01_AXI_bresp(microblaze_0_M_AXI_DP_BRESP),
        .S01_AXI_bvalid(microblaze_0_M_AXI_DP_BVALID),
        .S01_AXI_rdata(microblaze_0_M_AXI_DP_RDATA),
        .S01_AXI_rready(microblaze_0_M_AXI_DP_RREADY),
        .S01_AXI_rresp(microblaze_0_M_AXI_DP_RRESP),
        .S01_AXI_rvalid(microblaze_0_M_AXI_DP_RVALID),
        .S01_AXI_wdata(microblaze_0_M_AXI_DP_WDATA),
        .S01_AXI_wready(microblaze_0_M_AXI_DP_WREADY),
        .S01_AXI_wstrb(microblaze_0_M_AXI_DP_WSTRB),
        .S01_AXI_wvalid(microblaze_0_M_AXI_DP_WVALID),
        .adc1_clk_clk_n(adc1_clk_1_CLK_N),
        .adc1_clk_clk_p(adc1_clk_1_CLK_P),
        .adc1_hw_trigger(adc1_hw_trigger_1),
        .adc1_hw_trigger_en(adc1_hw_trigger_en_1),
        .clk_adc1(ex_design_clk_adc1),
        .clk_dac0(ex_design_clk_dac0),
        .dac0_clk_clk_n(dac0_clk_1_CLK_N),
        .dac0_clk_clk_p(dac0_clk_1_CLK_P),
        .dac0_hw_trigger(dac0_hw_trigger_1),
        .dac0_hw_trigger_en(dac0_hw_trigger_en_1),
        .m10_0_tdata(ex_design_m10_0_TDATA),
        .m10_0_tready(ex_design_m10_0_TREADY),
        .m10_0_tvalid(ex_design_m10_0_TVALID),
        .m1_axis_aclk(clk_wiz_adc0_clk_out1),
        .m1_axis_aresetn(m1_axis_aresetn_1),
        .s00_0_tdata(s00_0_1_TDATA),
        .s00_0_tready(s00_0_1_TREADY),
        .s00_0_tvalid(s00_0_1_TVALID),
        .s0_axis_aclk(clk_wiz_dac0_clk_out1),
        .s0_axis_aresetn(clk_wiz_dac0_locked),
        .s_axi_aclk(s_axi_aclk_1),
        .s_axi_aresetn(rst_s_axi_aclk_57M_peripheral_aresetn),
        .sysref_in_diff_n(sysref_in_1_diff_n),
        .sysref_in_diff_p(sysref_in_1_diff_p),
        .user_select_00_0(user_select_00_0_1),
        .vin10_v_n(vin10_1_V_N),
        .vin10_v_p(vin10_1_V_P),
        .vout00_v_n(ex_design_vout00_V_N),
        .vout00_v_p(ex_design_vout00_V_P));
  rfdc_ex_jtag_axi_0_0 jtag_axi_0
       (.aclk(s_axi_aclk_1),
        .aresetn(rst_s_axi_aclk_57M_peripheral_aresetn),
        .m_axi_araddr(jtag_axi_0_M_AXI_ARADDR),
        .m_axi_arburst(jtag_axi_0_M_AXI_ARBURST),
        .m_axi_arcache(jtag_axi_0_M_AXI_ARCACHE),
        .m_axi_arid(jtag_axi_0_M_AXI_ARID),
        .m_axi_arlen(jtag_axi_0_M_AXI_ARLEN),
        .m_axi_arlock(jtag_axi_0_M_AXI_ARLOCK),
        .m_axi_arprot(jtag_axi_0_M_AXI_ARPROT),
        .m_axi_arqos(jtag_axi_0_M_AXI_ARQOS),
        .m_axi_arready(jtag_axi_0_M_AXI_ARREADY),
        .m_axi_arsize(jtag_axi_0_M_AXI_ARSIZE),
        .m_axi_arvalid(jtag_axi_0_M_AXI_ARVALID),
        .m_axi_awaddr(jtag_axi_0_M_AXI_AWADDR),
        .m_axi_awburst(jtag_axi_0_M_AXI_AWBURST),
        .m_axi_awcache(jtag_axi_0_M_AXI_AWCACHE),
        .m_axi_awid(jtag_axi_0_M_AXI_AWID),
        .m_axi_awlen(jtag_axi_0_M_AXI_AWLEN),
        .m_axi_awlock(jtag_axi_0_M_AXI_AWLOCK),
        .m_axi_awprot(jtag_axi_0_M_AXI_AWPROT),
        .m_axi_awqos(jtag_axi_0_M_AXI_AWQOS),
        .m_axi_awready(jtag_axi_0_M_AXI_AWREADY),
        .m_axi_awsize(jtag_axi_0_M_AXI_AWSIZE),
        .m_axi_awvalid(jtag_axi_0_M_AXI_AWVALID),
        .m_axi_bid(jtag_axi_0_M_AXI_BID),
        .m_axi_bready(jtag_axi_0_M_AXI_BREADY),
        .m_axi_bresp(jtag_axi_0_M_AXI_BRESP),
        .m_axi_bvalid(jtag_axi_0_M_AXI_BVALID),
        .m_axi_rdata(jtag_axi_0_M_AXI_RDATA),
        .m_axi_rid(jtag_axi_0_M_AXI_RID),
        .m_axi_rlast(jtag_axi_0_M_AXI_RLAST),
        .m_axi_rready(jtag_axi_0_M_AXI_RREADY),
        .m_axi_rresp(jtag_axi_0_M_AXI_RRESP),
        .m_axi_rvalid(jtag_axi_0_M_AXI_RVALID),
        .m_axi_wdata(jtag_axi_0_M_AXI_WDATA),
        .m_axi_wlast(jtag_axi_0_M_AXI_WLAST),
        .m_axi_wready(jtag_axi_0_M_AXI_WREADY),
        .m_axi_wstrb(jtag_axi_0_M_AXI_WSTRB),
        .m_axi_wvalid(jtag_axi_0_M_AXI_WVALID));
  rfdc_ex_mdm_1_0 mdm_1
       (.Dbg_Capture_0(microblaze_0_debug_CAPTURE),
        .Dbg_Clk_0(microblaze_0_debug_CLK),
        .Dbg_Disable_0(microblaze_0_debug_DISABLE),
        .Dbg_Reg_En_0(microblaze_0_debug_REG_EN),
        .Dbg_Rst_0(microblaze_0_debug_RST),
        .Dbg_Shift_0(microblaze_0_debug_SHIFT),
        .Dbg_TDI_0(microblaze_0_debug_TDI),
        .Dbg_TDO_0(microblaze_0_debug_TDO),
        .Dbg_Update_0(microblaze_0_debug_UPDATE),
        .Debug_SYS_Rst(mdm_1_debug_sys_rst),
        .S_AXI_ACLK(s_axi_aclk_1),
        .S_AXI_ARADDR(ex_design_M05_AXI_ARADDR),
        .S_AXI_ARESETN(rst_s_axi_aclk_57M_peripheral_aresetn),
        .S_AXI_ARREADY(ex_design_M05_AXI_ARREADY),
        .S_AXI_ARVALID(ex_design_M05_AXI_ARVALID),
        .S_AXI_AWADDR(ex_design_M05_AXI_AWADDR),
        .S_AXI_AWREADY(ex_design_M05_AXI_AWREADY),
        .S_AXI_AWVALID(ex_design_M05_AXI_AWVALID),
        .S_AXI_BREADY(ex_design_M05_AXI_BREADY),
        .S_AXI_BRESP(ex_design_M05_AXI_BRESP),
        .S_AXI_BVALID(ex_design_M05_AXI_BVALID),
        .S_AXI_RDATA(ex_design_M05_AXI_RDATA),
        .S_AXI_RREADY(ex_design_M05_AXI_RREADY),
        .S_AXI_RRESP(ex_design_M05_AXI_RRESP),
        .S_AXI_RVALID(ex_design_M05_AXI_RVALID),
        .S_AXI_WDATA(ex_design_M05_AXI_WDATA),
        .S_AXI_WREADY(ex_design_M05_AXI_WREADY),
        .S_AXI_WSTRB(ex_design_M05_AXI_WSTRB),
        .S_AXI_WVALID(ex_design_M05_AXI_WVALID));
  (* BMM_INFO_PROCESSOR = "microblaze-le > rfdc_ex microblaze_0_local_memory/dlmb_bram_if_cntlr" *) 
  (* KEEP_HIERARCHY = "yes" *) 
  rfdc_ex_microblaze_0_0 microblaze_0
       (.Byte_Enable(microblaze_0_dlmb_1_BE),
        .Clk(s_axi_aclk_1),
        .DCE(microblaze_0_dlmb_1_CE),
        .DReady(microblaze_0_dlmb_1_READY),
        .DUE(microblaze_0_dlmb_1_UE),
        .DWait(microblaze_0_dlmb_1_WAIT),
        .D_AS(microblaze_0_dlmb_1_ADDRSTROBE),
        .Data_Addr(microblaze_0_dlmb_1_ABUS),
        .Data_Read(microblaze_0_dlmb_1_READDBUS),
        .Data_Write(microblaze_0_dlmb_1_WRITEDBUS),
        .Dbg_Capture(microblaze_0_debug_CAPTURE),
        .Dbg_Clk(microblaze_0_debug_CLK),
        .Dbg_Disable(microblaze_0_debug_DISABLE),
        .Dbg_Reg_En(microblaze_0_debug_REG_EN),
        .Dbg_Shift(microblaze_0_debug_SHIFT),
        .Dbg_TDI(microblaze_0_debug_TDI),
        .Dbg_TDO(microblaze_0_debug_TDO),
        .Dbg_Update(microblaze_0_debug_UPDATE),
        .Debug_Rst(microblaze_0_debug_RST),
        .ICE(microblaze_0_ilmb_1_CE),
        .IFetch(microblaze_0_ilmb_1_READSTROBE),
        .IReady(microblaze_0_ilmb_1_READY),
        .IUE(microblaze_0_ilmb_1_UE),
        .IWAIT(microblaze_0_ilmb_1_WAIT),
        .I_AS(microblaze_0_ilmb_1_ADDRSTROBE),
        .Instr(microblaze_0_ilmb_1_READDBUS),
        .Instr_Addr(microblaze_0_ilmb_1_ABUS),
        .Interrupt(1'b0),
        .Interrupt_Address({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .M_AXI_DP_ARADDR(microblaze_0_M_AXI_DP_ARADDR),
        .M_AXI_DP_ARPROT(microblaze_0_M_AXI_DP_ARPROT),
        .M_AXI_DP_ARREADY(microblaze_0_M_AXI_DP_ARREADY),
        .M_AXI_DP_ARVALID(microblaze_0_M_AXI_DP_ARVALID),
        .M_AXI_DP_AWADDR(microblaze_0_M_AXI_DP_AWADDR),
        .M_AXI_DP_AWPROT(microblaze_0_M_AXI_DP_AWPROT),
        .M_AXI_DP_AWREADY(microblaze_0_M_AXI_DP_AWREADY),
        .M_AXI_DP_AWVALID(microblaze_0_M_AXI_DP_AWVALID),
        .M_AXI_DP_BREADY(microblaze_0_M_AXI_DP_BREADY),
        .M_AXI_DP_BRESP(microblaze_0_M_AXI_DP_BRESP),
        .M_AXI_DP_BVALID(microblaze_0_M_AXI_DP_BVALID),
        .M_AXI_DP_RDATA(microblaze_0_M_AXI_DP_RDATA),
        .M_AXI_DP_RREADY(microblaze_0_M_AXI_DP_RREADY),
        .M_AXI_DP_RRESP(microblaze_0_M_AXI_DP_RRESP),
        .M_AXI_DP_RVALID(microblaze_0_M_AXI_DP_RVALID),
        .M_AXI_DP_WDATA(microblaze_0_M_AXI_DP_WDATA),
        .M_AXI_DP_WREADY(microblaze_0_M_AXI_DP_WREADY),
        .M_AXI_DP_WSTRB(microblaze_0_M_AXI_DP_WSTRB),
        .M_AXI_DP_WVALID(microblaze_0_M_AXI_DP_WVALID),
        .Read_Strobe(microblaze_0_dlmb_1_READSTROBE),
        .Reset(rst_s_axi_aclk_57M_mb_reset),
        .Write_Strobe(microblaze_0_dlmb_1_WRITESTROBE));
  microblaze_0_local_memory_imp_1FP2N28 microblaze_0_local_memory
       (.DLMB_abus(microblaze_0_dlmb_1_ABUS),
        .DLMB_addrstrobe(microblaze_0_dlmb_1_ADDRSTROBE),
        .DLMB_be(microblaze_0_dlmb_1_BE),
        .DLMB_ce(microblaze_0_dlmb_1_CE),
        .DLMB_readdbus(microblaze_0_dlmb_1_READDBUS),
        .DLMB_readstrobe(microblaze_0_dlmb_1_READSTROBE),
        .DLMB_ready(microblaze_0_dlmb_1_READY),
        .DLMB_ue(microblaze_0_dlmb_1_UE),
        .DLMB_wait(microblaze_0_dlmb_1_WAIT),
        .DLMB_writedbus(microblaze_0_dlmb_1_WRITEDBUS),
        .DLMB_writestrobe(microblaze_0_dlmb_1_WRITESTROBE),
        .ILMB_abus(microblaze_0_ilmb_1_ABUS),
        .ILMB_addrstrobe(microblaze_0_ilmb_1_ADDRSTROBE),
        .ILMB_ce(microblaze_0_ilmb_1_CE),
        .ILMB_readdbus(microblaze_0_ilmb_1_READDBUS),
        .ILMB_readstrobe(microblaze_0_ilmb_1_READSTROBE),
        .ILMB_ready(microblaze_0_ilmb_1_READY),
        .ILMB_ue(microblaze_0_ilmb_1_UE),
        .ILMB_wait(microblaze_0_ilmb_1_WAIT),
        .SYS_Rst(rst_s_axi_aclk_57M_bus_struct_reset),
        .s_axi_aclk(s_axi_aclk_1));
  rfdc_ex_rst_s_axi_aclk_57M_0 rst_s_axi_aclk_57M
       (.aux_reset_in(1'b1),
        .bus_struct_reset(rst_s_axi_aclk_57M_bus_struct_reset),
        .dcm_locked(1'b1),
        .ext_reset_in(s_axi_aresetn_1),
        .interconnect_aresetn(rst_s_axi_aclk_57M_interconnect_aresetn),
        .mb_debug_sys_rst(mdm_1_debug_sys_rst),
        .mb_reset(rst_s_axi_aclk_57M_mb_reset),
        .peripheral_aresetn(rst_s_axi_aclk_57M_peripheral_aresetn),
        .slowest_sync_clk(s_axi_aclk_1));
endmodule

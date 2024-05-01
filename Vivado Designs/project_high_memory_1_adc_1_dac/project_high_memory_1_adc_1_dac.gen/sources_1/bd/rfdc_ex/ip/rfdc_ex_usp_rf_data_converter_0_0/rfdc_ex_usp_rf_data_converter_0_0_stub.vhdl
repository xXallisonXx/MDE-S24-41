-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
-- Date        : Thu Mar 21 19:20:34 2024
-- Host        : LAPTOP-L57NIJPM running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_usp_rf_data_converter_0_0/rfdc_ex_usp_rf_data_converter_0_0_stub.vhdl
-- Design      : rfdc_ex_usp_rf_data_converter_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu67dr-fsve1156-2-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rfdc_ex_usp_rf_data_converter_0_0 is
  Port ( 
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC;
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 17 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 17 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    sysref_in_p : in STD_LOGIC;
    sysref_in_n : in STD_LOGIC;
    adc1_clk_p : in STD_LOGIC;
    adc1_clk_n : in STD_LOGIC;
    clk_adc1 : out STD_LOGIC;
    m1_axis_aclk : in STD_LOGIC;
    m1_axis_aresetn : in STD_LOGIC;
    vin10_p : in STD_LOGIC;
    vin10_n : in STD_LOGIC;
    m10_axis_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m10_axis_tvalid : out STD_LOGIC;
    m10_axis_tready : in STD_LOGIC;
    dac0_clk_p : in STD_LOGIC;
    dac0_clk_n : in STD_LOGIC;
    clk_dac0 : out STD_LOGIC;
    s0_axis_aclk : in STD_LOGIC;
    s0_axis_aresetn : in STD_LOGIC;
    vout00_p : out STD_LOGIC;
    vout00_n : out STD_LOGIC;
    s00_axis_tdata : in STD_LOGIC_VECTOR ( 255 downto 0 );
    s00_axis_tvalid : in STD_LOGIC;
    s00_axis_tready : out STD_LOGIC;
    irq : out STD_LOGIC
  );

end rfdc_ex_usp_rf_data_converter_0_0;

architecture stub of rfdc_ex_usp_rf_data_converter_0_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "s_axi_aclk,s_axi_aresetn,s_axi_awaddr[17:0],s_axi_awvalid,s_axi_awready,s_axi_wdata[31:0],s_axi_wstrb[3:0],s_axi_wvalid,s_axi_wready,s_axi_bresp[1:0],s_axi_bvalid,s_axi_bready,s_axi_araddr[17:0],s_axi_arvalid,s_axi_arready,s_axi_rdata[31:0],s_axi_rresp[1:0],s_axi_rvalid,s_axi_rready,sysref_in_p,sysref_in_n,adc1_clk_p,adc1_clk_n,clk_adc1,m1_axis_aclk,m1_axis_aresetn,vin10_p,vin10_n,m10_axis_tdata[127:0],m10_axis_tvalid,m10_axis_tready,dac0_clk_p,dac0_clk_n,clk_dac0,s0_axis_aclk,s0_axis_aresetn,vout00_p,vout00_n,s00_axis_tdata[255:0],s00_axis_tvalid,s00_axis_tready,irq";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "usp_rf_data_converter_v2_6_7,Vivado 2023.2";
begin
end;

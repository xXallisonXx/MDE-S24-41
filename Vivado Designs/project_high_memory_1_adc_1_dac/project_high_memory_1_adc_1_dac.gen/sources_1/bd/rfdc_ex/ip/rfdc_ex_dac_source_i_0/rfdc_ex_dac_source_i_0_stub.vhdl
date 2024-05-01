-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
-- Date        : Thu Mar 21 19:20:02 2024
-- Host        : LAPTOP-L57NIJPM running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_dac_source_i_0/rfdc_ex_dac_source_i_0_stub.vhdl
-- Design      : rfdc_ex_dac_source_i_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu67dr-fsve1156-2-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rfdc_ex_dac_source_i_0 is
  Port ( 
    s_axi_awaddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_awvalid : in STD_LOGIC;
    s_axi_awready : out STD_LOGIC;
    s_axi_wdata : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_wvalid : in STD_LOGIC;
    s_axi_wready : out STD_LOGIC;
    s_axi_wstrb : in STD_LOGIC_VECTOR ( 3 downto 0 );
    s_axi_bresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_bvalid : out STD_LOGIC;
    s_axi_bready : in STD_LOGIC;
    s_axi_araddr : in STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_arvalid : in STD_LOGIC;
    s_axi_arready : out STD_LOGIC;
    s_axi_rdata : out STD_LOGIC_VECTOR ( 31 downto 0 );
    s_axi_rresp : out STD_LOGIC_VECTOR ( 1 downto 0 );
    s_axi_rvalid : out STD_LOGIC;
    s_axi_rready : in STD_LOGIC;
    m00_tdata : out STD_LOGIC_VECTOR ( 255 downto 0 );
    m00_tvalid : out STD_LOGIC;
    m00_tready : in STD_LOGIC;
    s00_user_tdata : in STD_LOGIC_VECTOR ( 255 downto 0 );
    s00_user_tvalid : in STD_LOGIC;
    s00_user_tready : out STD_LOGIC;
    user_select_00 : in STD_LOGIC;
    m0_axis_clock : in STD_LOGIC;
    m0_div2_axis_clock : in STD_LOGIC;
    hw_trigger_0 : in STD_LOGIC;
    hw_trigger_en_0 : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC
  );

end rfdc_ex_dac_source_i_0;

architecture stub of rfdc_ex_dac_source_i_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "s_axi_awaddr[31:0],s_axi_awvalid,s_axi_awready,s_axi_wdata[31:0],s_axi_wvalid,s_axi_wready,s_axi_wstrb[3:0],s_axi_bresp[1:0],s_axi_bvalid,s_axi_bready,s_axi_araddr[31:0],s_axi_arvalid,s_axi_arready,s_axi_rdata[31:0],s_axi_rresp[1:0],s_axi_rvalid,s_axi_rready,m00_tdata[255:0],m00_tvalid,m00_tready,s00_user_tdata[255:0],s00_user_tvalid,s00_user_tready,user_select_00,m0_axis_clock,m0_div2_axis_clock,hw_trigger_0,hw_trigger_en_0,s_axi_aclk,s_axi_aresetn";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "exdes_rfdac_data_bram_stim,Vivado 2023.2";
begin
end;

-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
-- Date        : Thu Mar 21 19:20:10 2024
-- Host        : LAPTOP-L57NIJPM running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_adc_sink_i_0/rfdc_ex_adc_sink_i_0_stub.vhdl
-- Design      : rfdc_ex_adc_sink_i_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xczu67dr-fsve1156-2-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity rfdc_ex_adc_sink_i_0 is
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
    s10_tdata : in STD_LOGIC_VECTOR ( 127 downto 0 );
    s10_tvalid : in STD_LOGIC;
    m10_tdata : out STD_LOGIC_VECTOR ( 127 downto 0 );
    m10_tvalid : out STD_LOGIC;
    m10_tready : in STD_LOGIC;
    s1_axis_clock : in STD_LOGIC;
    s1_div2_axis_clock : in STD_LOGIC;
    hw_trigger_1 : in STD_LOGIC;
    hw_trigger_en_1 : in STD_LOGIC;
    s_axi_aclk : in STD_LOGIC;
    s_axi_aresetn : in STD_LOGIC
  );

end rfdc_ex_adc_sink_i_0;

architecture stub of rfdc_ex_adc_sink_i_0 is
attribute syn_black_box : boolean;
attribute black_box_pad_pin : string;
attribute syn_black_box of stub : architecture is true;
attribute black_box_pad_pin of stub : architecture is "s_axi_awaddr[31:0],s_axi_awvalid,s_axi_awready,s_axi_wdata[31:0],s_axi_wvalid,s_axi_wready,s_axi_wstrb[3:0],s_axi_bresp[1:0],s_axi_bvalid,s_axi_bready,s_axi_araddr[31:0],s_axi_arvalid,s_axi_arready,s_axi_rdata[31:0],s_axi_rresp[1:0],s_axi_rvalid,s_axi_rready,s10_tdata[127:0],s10_tvalid,m10_tdata[127:0],m10_tvalid,m10_tready,s1_axis_clock,s1_div2_axis_clock,hw_trigger_1,hw_trigger_en_1,s_axi_aclk,s_axi_aresetn";
attribute X_CORE_INFO : string;
attribute X_CORE_INFO of stub : architecture is "exdes_rfadc_data_bram_capture,Vivado 2023.2";
begin
end;
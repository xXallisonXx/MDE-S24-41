#----------------------------------------------------------------------
# Title      : Example top level constraints for UltraScale+ RF Data Converter
#----------------------------------------------------------------------
# File       : usp_rf_data_converter_0_example_design.xdc
#----------------------------------------------------------------------
# Description: Xilinx Constraint file for the example design for
#              UltraScale+ RF Data Converter core
#---------------------------------------------------------------------
#
# DISCLAIMER
# This disclaimer is not a license and does not grant any
# rights to the materials distributed herewith. Except as
# otherwise provided in a valid license issued to you by
# Xilinx, and to the maximum extent permitted by applicable
# law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
# WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
# AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
# BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
# INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
# (2) Xilinx shall not be liable (whether in contract or tort,
# including negligence, or under any other theory of
# liability) for any loss or damage of any kind or nature
# related to, arising under or in connection with these
# materials, including for any direct, or any indirect,
# special, incidental, or consequential loss or damage
# (including loss of data, profits, goodwill, or any type of
# loss or damage suffered as a result of any action brought
# by a third party) even if such damage or loss was
# reasonably foreseeable or Xilinx had been advised of the
# possibility of the same.
# 
# CRITICAL APPLICATIONS
# Xilinx products are not designed or intended to be fail-
# safe, or for use in any application requiring fail-safe
# performance, such as life-support or safety devices or
# systems, Class III medical devices, nuclear facilities,
# applications related to the deployment of airbags, or any
# other applications that could lead to death, personal
# injury, or severe property or environmental damage
# (individually and collectively, "Critical
# Applications"). Customer assumes the sole risk and
# liability of any use of Xilinx products in Critical
# Applications, subject only to applicable laws and
# regulations governing limitations on product liability.
# 
# THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
# PART OF THIS FILE AT ALL TIMES. 
#
#---------------------------------------------------------------------

#------------------------------------------
# TIMING CONSTRAINTS
#------------------------------------------
# Set AXI-Lite Clock to 100.0MHz
create_clock -period 10.000 -name usp_rf_data_converter_0_axi_aclk [get_ports s_axi_aclk]

#AXI Streaming Clock for DAC0
create_clock -period 2.500 -name usp_rf_data_converter_0_s0_axis_aclk [get_ports dac0_axis_aclk]

set_multicycle_path -to [get_pins -filter {REF_PIN_NAME== D} -of [get_cells -hier -filter {name =~ *usp_rf_data_converter_0_ex_i/usp_rf_data_converter_0/inst/IP2Bus_Data_reg*}]] -setup 2
set_multicycle_path -to [get_pins -filter {REF_PIN_NAME== D} -of [get_cells -hier -filter {name =~ *usp_rf_data_converter_0_ex_i/usp_rf_data_converter_0/inst/IP2Bus_Data_reg*}]] -hold 1
###############################################################################
# False paths
# For debug in synth use
# report_timing_summary -setup -slack_lesser_than 0
###############################################################################
# Data generator/capture constraints
set rfa_from_list   [get_cells -hier -regexp .*rf(?:da|ad)c_exdes_ctrl_i\/(?:da|ad)c_exdes_cfg_i\/.+num_samples_reg.*]
set rfa_dac_signal_list [get_cells -hier -filter {name=~*dg_slice_00*addrb_reg[*]}]
set_false_path -from $rfa_from_list -to $rfa_dac_signal_list
create_waiver -user USP_RF_DATA_CONVERTER -type CDC -id CDC-1 \
  -description "Number of samples register is a constant during normal operation" \
  -from [list [get_pins -filter {REF_PIN_NAME=~*} -of [get_cells -hier -filter {name=~*c_exdes_cfg_i*num_samples_reg*}]]] \
  -to   [list [get_pins -filter {REF_PIN_NAME==D} -of [get_cells -hier -filter {name=~*dg_slice_00*addrb_reg[*]}]]]
set rfa_dac_signal_list [get_cells -hier -filter {name=~*dg_slice_00*addrbend_reg}]
set_false_path -from $rfa_from_list -to $rfa_dac_signal_list
create_waiver -user USP_RF_DATA_CONVERTER -type CDC -id CDC-1 \
  -description "Number of samples register is a constant during normal operation" \
  -from [list [get_pins -filter {REF_PIN_NAME=~*} -of [get_cells -hier -filter {name=~*c_exdes_cfg_i*num_samples_reg*}]]] \
  -to   [list [get_pins -filter {REF_PIN_NAME==D} -of [get_cells -hier -filter {name=~*dg_slice_00*addrbend_reg}]]]
set rfa_dac_signal_list [get_cells -hier -filter {name=~*dg_slice_01*addrb_reg[*]}]
set_false_path -from $rfa_from_list -to $rfa_dac_signal_list
create_waiver -user USP_RF_DATA_CONVERTER -type CDC -id CDC-1 \
  -description "Number of samples register is a constant during normal operation" \
  -from [list [get_pins -filter {REF_PIN_NAME=~*} -of [get_cells -hier -filter {name=~*c_exdes_cfg_i*num_samples_reg*}]]] \
  -to   [list [get_pins -filter {REF_PIN_NAME==D} -of [get_cells -hier -filter {name=~*dg_slice_01*addrb_reg[*]}]]]
set rfa_dac_signal_list [get_cells -hier -filter {name=~*dg_slice_01*addrbend_reg}]
set_false_path -from $rfa_from_list -to $rfa_dac_signal_list
create_waiver -user USP_RF_DATA_CONVERTER -type CDC -id CDC-1 \
  -description "Number of samples register is a constant during normal operation" \
  -from [list [get_pins -filter {REF_PIN_NAME=~*} -of [get_cells -hier -filter {name=~*c_exdes_cfg_i*num_samples_reg*}]]] \
  -to   [list [get_pins -filter {REF_PIN_NAME==D} -of [get_cells -hier -filter {name=~*dg_slice_01*addrbend_reg}]]]
set rfa_dac_signal_list [get_cells -hier -filter {name=~*dg_slice_02*addrb_reg[*]}]
set_false_path -from $rfa_from_list -to $rfa_dac_signal_list
create_waiver -user USP_RF_DATA_CONVERTER -type CDC -id CDC-1 \
  -description "Number of samples register is a constant during normal operation" \
  -from [list [get_pins -filter {REF_PIN_NAME=~*} -of [get_cells -hier -filter {name=~*c_exdes_cfg_i*num_samples_reg*}]]] \
  -to   [list [get_pins -filter {REF_PIN_NAME==D} -of [get_cells -hier -filter {name=~*dg_slice_02*addrb_reg[*]}]]]
set rfa_dac_signal_list [get_cells -hier -filter {name=~*dg_slice_02*addrbend_reg}]
set_false_path -from $rfa_from_list -to $rfa_dac_signal_list
create_waiver -user USP_RF_DATA_CONVERTER -type CDC -id CDC-1 \
  -description "Number of samples register is a constant during normal operation" \
  -from [list [get_pins -filter {REF_PIN_NAME=~*} -of [get_cells -hier -filter {name=~*c_exdes_cfg_i*num_samples_reg*}]]] \
  -to   [list [get_pins -filter {REF_PIN_NAME==D} -of [get_cells -hier -filter {name=~*dg_slice_02*addrbend_reg}]]]
set rfa_dac_signal_list [get_cells -hier -filter {name=~*dg_slice_03*addrb_reg[*]}]
set_false_path -from $rfa_from_list -to $rfa_dac_signal_list
create_waiver -user USP_RF_DATA_CONVERTER -type CDC -id CDC-1 \
  -description "Number of samples register is a constant during normal operation" \
  -from [list [get_pins -filter {REF_PIN_NAME=~*} -of [get_cells -hier -filter {name=~*c_exdes_cfg_i*num_samples_reg*}]]] \
  -to   [list [get_pins -filter {REF_PIN_NAME==D} -of [get_cells -hier -filter {name=~*dg_slice_03*addrb_reg[*]}]]]
set rfa_dac_signal_list [get_cells -hier -filter {name=~*dg_slice_03*addrbend_reg}]
set_false_path -from $rfa_from_list -to $rfa_dac_signal_list
create_waiver -user USP_RF_DATA_CONVERTER -type CDC -id CDC-1 \
  -description "Number of samples register is a constant during normal operation" \
  -from [list [get_pins -filter {REF_PIN_NAME=~*} -of [get_cells -hier -filter {name=~*c_exdes_cfg_i*num_samples_reg*}]]] \
  -to   [list [get_pins -filter {REF_PIN_NAME==D} -of [get_cells -hier -filter {name=~*dg_slice_03*addrbend_reg}]]]

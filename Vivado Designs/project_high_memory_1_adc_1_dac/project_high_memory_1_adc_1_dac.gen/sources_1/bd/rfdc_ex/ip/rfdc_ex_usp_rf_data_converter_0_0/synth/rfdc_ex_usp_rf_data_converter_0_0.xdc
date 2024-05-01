#----------------------------------------------------------------------
# Title      : Constraints for UltraScale+ RF Data Converter
#----------------------------------------------------------------------
# File       : rfdc_ex_usp_rf_data_converter_0_0_block.xdc
#----------------------------------------------------------------------
# Description: Constraint file for
#              UltraScale+ RF Data Converter core
#---------------------------------------------------------------------
#
# (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# (c) Copyright 2022-2024 Advanced Micro Devices, Inc. All rights reserved.
# 
# This file contains confidential and proprietary information
# of AMD and is protected under U.S. and international copyright
# and other intellectual property laws.
# 
# DISCLAIMER
# This disclaimer is not a license and does not grant any
# rights to the materials distributed herewith. Except as
# otherwise provided in a valid license issued to you by
# AMD, and to the maximum extent permitted by applicable
# law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
# WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
# AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
# BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
# INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
# (2) AMD shall not be liable (whether in contract or tort,
# including negligence, or under any other theory of
# liability) for any loss or damage of any kind or nature
# related to, arising under or in connection with these
# materials, including for any direct, or any indirect,
# special, incidental, or consequential loss or damage
# (including loss of data, profits, goodwill, or any type of
# loss or damage suffered as a result of any action brought
# by a third party) even if such damage or loss was
# reasonably foreseeable or AMD had been advised of the
# possibility of the same.
# 
# CRITICAL APPLICATIONS
# AMD products are not designed or intended to be fail-
# safe, or for use in any application requiring fail-safe
# performance, such as life-support or safety devices or
# systems, Class III medical devices, nuclear facilities,
# applications related to the deployment of airbags, or any
# other applications that could lead to death, personal
# injury, or severe property or environmental damage
# (individually and collectively, "Critical
# Applications"). Customer assumes the sole risk and
# liability of any use of AMD products in Critical
# Applications, subject only to applicable laws and
# regulations governing limitations on product liability.
# 
# THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
# PART OF THIS FILE AT ALL TIMES.
# 
# DO NOT MODIFY THIS FILE.

#
#---------------------------------------------------------------------

#------------------------------------------
# LOCATION CONSTRAINTS
#------------------------------------------
set_property LOC RFADC_X0Y0 [get_cells -hier -filter {name =~ */rx0_u_adc}]
set_property LOC RFADC_X0Y1 [get_cells -hier -filter {name =~ */rx1_u_adc}]
set_property LOC RFADC_X0Y2 [get_cells -hier -filter {name =~ */rx2_u_adc}]
set_property LOC RFDAC_X0Y0 [get_cells -hier -filter {name =~ */tx0_u_dac}]
set_property LOC RFDAC_X0Y1 [get_cells -hier -filter {name =~ */tx1_u_dac}]

#------------------------------------------
# TIMING CONSTRAINTS
#------------------------------------------
set ipif_read   [get_cells -hier -filter {name =~ *IP2Bus_Data_reg* && IS_SEQUENTIAL}]
set rfams_clock_adc0 [get_pins -filter {REF_PIN_NAME==FABRIC_CLK} -of [get_cells rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i/rx0_u_adc]]
set_false_path -through $rfams_clock_adc0 -to $ipif_read
create_waiver -internal -scope -user USP_RF_DATA_CONVERTER -type CDC -id CDC-1 \
  -tags "1033132" \
  -description "Passing ADC outputs to the status registers" \
  -from [list [get_pins -filter {REF_PIN_NAME==FABRIC_CLK} -of [get_cells -hier -filter {name =~ "*rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i/rx0_u_adc"}]]] \
  -to   [list [get_pins -filter {REF_PIN_NAME==D} -of [get_cells -hier -filter {name =~ *IP2Bus_Data_reg* && IS_SEQUENTIAL}]]]
create_waiver -internal -scope -user USP_RF_DATA_CONVERTER -type CDC -id CDC-4 \
  -tags "1033132" \
  -description "Passing ADC outputs to the status registers" \
  -from [list [get_pins -filter {REF_PIN_NAME==FABRIC_CLK} -of [get_cells -hier -filter {name =~ "*rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i/rx0_u_adc"}]]] \
  -to   [list [get_pins -filter {REF_PIN_NAME==D} -of [get_cells -hier -filter {name =~ *IP2Bus_Data_reg* && IS_SEQUENTIAL}]]]
create_waiver -internal -scope -user USP_RF_DATA_CONVERTER -type CDC -id CDC-1 \
  -tags "1033132" \
  -description "Passing ADC outputs to the status registers" \
  -from [list [get_pins -filter {REF_PIN_NAME==INTERNAL_FBRC_DIV2_MUX} -of [get_cells -hier -filter {name =~ "*rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i/rx0_u_adc"}]]] \
  -to   [list [get_pins -filter {REF_PIN_NAME==D} -of [get_cells -hier -filter {name =~ *IP2Bus_Data_reg* && IS_SEQUENTIAL}]]]
create_waiver -internal -scope -user USP_RF_DATA_CONVERTER -type CDC -id CDC-4 \
  -tags "1033132" \
  -description "Passing ADC outputs to the status registers" \
  -from [list [get_pins -filter {REF_PIN_NAME==INTERNAL_FBRC_DIV2_MUX} -of [get_cells -hier -filter {name =~ "*rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i/rx0_u_adc"}]]] \
  -to   [list [get_pins -filter {REF_PIN_NAME==D} -of [get_cells -hier -filter {name =~ *IP2Bus_Data_reg* && IS_SEQUENTIAL}]]]
create_waiver -internal -scope -user USP_RF_DATA_CONVERTER -type CDC -id CDC-1 \
  -tags "1033132" \
  -description "Passing ADC outputs to the status registers" \
  -from [list [get_pins -filter {REF_PIN_NAME==INTERNAL_FBRC_DIV1_MUX} -of [get_cells -hier -filter {name =~ "*rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i/rx0_u_adc"}]]] \
  -to   [list [get_pins -filter {REF_PIN_NAME==D} -of [get_cells -hier -filter {name =~ *IP2Bus_Data_reg* && IS_SEQUENTIAL}]]]
set rfams_clock_adc1 [get_pins -filter {REF_PIN_NAME==FABRIC_CLK} -of [get_cells rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i/rx1_u_adc]]
set_false_path -through $rfams_clock_adc1 -to $ipif_read
create_waiver -internal -scope -user USP_RF_DATA_CONVERTER -type CDC -id CDC-1 \
  -tags "1033132" \
  -description "Passing ADC outputs to the status registers" \
  -from [list [get_pins -filter {REF_PIN_NAME==FABRIC_CLK} -of [get_cells -hier -filter {name =~ "*rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i/rx1_u_adc"}]]] \
  -to   [list [get_pins -filter {REF_PIN_NAME==D} -of [get_cells -hier -filter {name =~ *IP2Bus_Data_reg* && IS_SEQUENTIAL}]]]
create_waiver -internal -scope -user USP_RF_DATA_CONVERTER -type CDC -id CDC-4 \
  -tags "1033132" \
  -description "Passing ADC outputs to the status registers" \
  -from [list [get_pins -filter {REF_PIN_NAME==FABRIC_CLK} -of [get_cells -hier -filter {name =~ "*rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i/rx1_u_adc"}]]] \
  -to   [list [get_pins -filter {REF_PIN_NAME==D} -of [get_cells -hier -filter {name =~ *IP2Bus_Data_reg* && IS_SEQUENTIAL}]]]
create_waiver -internal -scope -user USP_RF_DATA_CONVERTER -type CDC -id CDC-1 \
  -tags "1033132" \
  -description "Passing ADC outputs to the status registers" \
  -from [list [get_pins -filter {REF_PIN_NAME==INTERNAL_FBRC_DIV2_MUX} -of [get_cells -hier -filter {name =~ "*rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i/rx1_u_adc"}]]] \
  -to   [list [get_pins -filter {REF_PIN_NAME==D} -of [get_cells -hier -filter {name =~ *IP2Bus_Data_reg* && IS_SEQUENTIAL}]]]
create_waiver -internal -scope -user USP_RF_DATA_CONVERTER -type CDC -id CDC-4 \
  -tags "1033132" \
  -description "Passing ADC outputs to the status registers" \
  -from [list [get_pins -filter {REF_PIN_NAME==INTERNAL_FBRC_DIV2_MUX} -of [get_cells -hier -filter {name =~ "*rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i/rx1_u_adc"}]]] \
  -to   [list [get_pins -filter {REF_PIN_NAME==D} -of [get_cells -hier -filter {name =~ *IP2Bus_Data_reg* && IS_SEQUENTIAL}]]]
create_waiver -internal -scope -user USP_RF_DATA_CONVERTER -type CDC -id CDC-1 \
  -tags "1033132" \
  -description "Passing ADC outputs to the status registers" \
  -from [list [get_pins -filter {REF_PIN_NAME==INTERNAL_FBRC_DIV1_MUX} -of [get_cells -hier -filter {name =~ "*rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i/rx1_u_adc"}]]] \
  -to   [list [get_pins -filter {REF_PIN_NAME==D} -of [get_cells -hier -filter {name =~ *IP2Bus_Data_reg* && IS_SEQUENTIAL}]]]
set rfams_clock_adc2 [get_pins -filter {REF_PIN_NAME==FABRIC_CLK} -of [get_cells rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i/rx2_u_adc]]
set_false_path -through $rfams_clock_adc2 -to $ipif_read
create_waiver -internal -scope -user USP_RF_DATA_CONVERTER -type CDC -id CDC-1 \
  -tags "1033132" \
  -description "Passing ADC outputs to the status registers" \
  -from [list [get_pins -filter {REF_PIN_NAME==FABRIC_CLK} -of [get_cells -hier -filter {name =~ "*rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i/rx2_u_adc"}]]] \
  -to   [list [get_pins -filter {REF_PIN_NAME==D} -of [get_cells -hier -filter {name =~ *IP2Bus_Data_reg* && IS_SEQUENTIAL}]]]
create_waiver -internal -scope -user USP_RF_DATA_CONVERTER -type CDC -id CDC-4 \
  -tags "1033132" \
  -description "Passing ADC outputs to the status registers" \
  -from [list [get_pins -filter {REF_PIN_NAME==FABRIC_CLK} -of [get_cells -hier -filter {name =~ "*rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i/rx2_u_adc"}]]] \
  -to   [list [get_pins -filter {REF_PIN_NAME==D} -of [get_cells -hier -filter {name =~ *IP2Bus_Data_reg* && IS_SEQUENTIAL}]]]
create_waiver -internal -scope -user USP_RF_DATA_CONVERTER -type CDC -id CDC-1 \
  -tags "1033132" \
  -description "Passing ADC outputs to the status registers" \
  -from [list [get_pins -filter {REF_PIN_NAME==INTERNAL_FBRC_DIV2_MUX} -of [get_cells -hier -filter {name =~ "*rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i/rx2_u_adc"}]]] \
  -to   [list [get_pins -filter {REF_PIN_NAME==D} -of [get_cells -hier -filter {name =~ *IP2Bus_Data_reg* && IS_SEQUENTIAL}]]]
create_waiver -internal -scope -user USP_RF_DATA_CONVERTER -type CDC -id CDC-4 \
  -tags "1033132" \
  -description "Passing ADC outputs to the status registers" \
  -from [list [get_pins -filter {REF_PIN_NAME==INTERNAL_FBRC_DIV2_MUX} -of [get_cells -hier -filter {name =~ "*rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i/rx2_u_adc"}]]] \
  -to   [list [get_pins -filter {REF_PIN_NAME==D} -of [get_cells -hier -filter {name =~ *IP2Bus_Data_reg* && IS_SEQUENTIAL}]]]
create_waiver -internal -scope -user USP_RF_DATA_CONVERTER -type CDC -id CDC-1 \
  -tags "1033132" \
  -description "Passing ADC outputs to the status registers" \
  -from [list [get_pins -filter {REF_PIN_NAME==INTERNAL_FBRC_DIV1_MUX} -of [get_cells -hier -filter {name =~ "*rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i/rx2_u_adc"}]]] \
  -to   [list [get_pins -filter {REF_PIN_NAME==D} -of [get_cells -hier -filter {name =~ *IP2Bus_Data_reg* && IS_SEQUENTIAL}]]]

set rfams_clock_dac0 [get_pins -filter {REF_PIN_NAME==FABRIC_CLK} -of [get_cells rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i/tx0_u_dac]]
set_false_path -through $rfams_clock_dac0 -to $ipif_read
create_waiver -internal -scope -user USP_RF_DATA_CONVERTER -type CDC -id CDC-1 \
  -tags "1033132" \
  -description "Passing DAC outputs to the status registers" \
  -from [list [get_pins -filter {REF_PIN_NAME==FABRIC_CLK} -of [get_cells -hier -filter {name =~ "*rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i/tx0_u_dac"}]]] \
  -to   [list [get_pins -filter {REF_PIN_NAME==D} -of [get_cells -hier -filter {name =~ *IP2Bus_Data_reg* && IS_SEQUENTIAL}]]]
create_waiver -internal -scope -user USP_RF_DATA_CONVERTER -type CDC -id CDC-4 \
  -tags "1033132" \
  -description "Passing DAC outputs to the status registers" \
  -from [list [get_pins -filter {REF_PIN_NAME==FABRIC_CLK} -of [get_cells -hier -filter {name =~ "*rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i/tx0_u_dac"}]]] \
  -to   [list [get_pins -filter {REF_PIN_NAME==D} -of [get_cells -hier -filter {name =~ *IP2Bus_Data_reg* && IS_SEQUENTIAL}]]]
create_waiver -internal -scope -user USP_RF_DATA_CONVERTER -type CDC -id CDC-1 \
  -tags "1033132" \
  -description "Passing DAC outputs to the status registers" \
  -from [list [get_pins -filter {REF_PIN_NAME==INTERNAL_FBRC_MUX} -of [get_cells -hier -filter {name =~ "*rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i/tx0_u_dac"}]]] \
  -to   [list [get_pins -filter {REF_PIN_NAME==D} -of [get_cells -hier -filter {name =~ *IP2Bus_Data_reg* && IS_SEQUENTIAL}]]]
create_waiver -internal -scope -user USP_RF_DATA_CONVERTER -type CDC -id CDC-4 \
  -tags "1033132" \
  -description "Passing DAC outputs to the status registers" \
  -from [list [get_pins -filter {REF_PIN_NAME==INTERNAL_FBRC_MUX} -of [get_cells -hier -filter {name =~ "*rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i/tx0_u_dac"}]]] \
  -to   [list [get_pins -filter {REF_PIN_NAME==D} -of [get_cells -hier -filter {name =~ *IP2Bus_Data_reg* && IS_SEQUENTIAL}]]]
set rfams_clock_dac1 [get_pins -filter {REF_PIN_NAME==FABRIC_CLK} -of [get_cells rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i/tx1_u_dac]]
set_false_path -through $rfams_clock_dac1 -to $ipif_read
create_waiver -internal -scope -user USP_RF_DATA_CONVERTER -type CDC -id CDC-1 \
  -tags "1033132" \
  -description "Passing DAC outputs to the status registers" \
  -from [list [get_pins -filter {REF_PIN_NAME==FABRIC_CLK} -of [get_cells -hier -filter {name =~ "*rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i/tx1_u_dac"}]]] \
  -to   [list [get_pins -filter {REF_PIN_NAME==D} -of [get_cells -hier -filter {name =~ *IP2Bus_Data_reg* && IS_SEQUENTIAL}]]]
create_waiver -internal -scope -user USP_RF_DATA_CONVERTER -type CDC -id CDC-4 \
  -tags "1033132" \
  -description "Passing DAC outputs to the status registers" \
  -from [list [get_pins -filter {REF_PIN_NAME==FABRIC_CLK} -of [get_cells -hier -filter {name =~ "*rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i/tx1_u_dac"}]]] \
  -to   [list [get_pins -filter {REF_PIN_NAME==D} -of [get_cells -hier -filter {name =~ *IP2Bus_Data_reg* && IS_SEQUENTIAL}]]]
create_waiver -internal -scope -user USP_RF_DATA_CONVERTER -type CDC -id CDC-1 \
  -tags "1033132" \
  -description "Passing DAC outputs to the status registers" \
  -from [list [get_pins -filter {REF_PIN_NAME==INTERNAL_FBRC_MUX} -of [get_cells -hier -filter {name =~ "*rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i/tx1_u_dac"}]]] \
  -to   [list [get_pins -filter {REF_PIN_NAME==D} -of [get_cells -hier -filter {name =~ *IP2Bus_Data_reg* && IS_SEQUENTIAL}]]]
create_waiver -internal -scope -user USP_RF_DATA_CONVERTER -type CDC -id CDC-4 \
  -tags "1033132" \
  -description "Passing DAC outputs to the status registers" \
  -from [list [get_pins -filter {REF_PIN_NAME==INTERNAL_FBRC_MUX} -of [get_cells -hier -filter {name =~ "*rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i/tx1_u_dac"}]]] \
  -to   [list [get_pins -filter {REF_PIN_NAME==D} -of [get_cells -hier -filter {name =~ *IP2Bus_Data_reg* && IS_SEQUENTIAL}]]]


###############################################################################
# Fabric clock timing constraints
###############################################################################
set rfdc_ex_usp_rf_data_converter_0_0_axi_aclk  [get_clocks -of_objects [get_ports s_axi_aclk]]

# Workaround to exclude paths that are wrongly related to DRP clock
set_false_path -from $rfdc_ex_usp_rf_data_converter_0_0_axi_aclk -through [get_pins -filter {REF_PIN_NAME =~ DATA_ADC*} -of [get_cells rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i/rx1_u_adc]]
create_waiver -internal -scope -user USP_RF_DATA_CONVERTER -type CDC -id CDC-1 \
  -tags "1033132" \
  -description "Paths wrongly related to DRP clock" \
  -from [list [get_pins -filter {REF_PIN_NAME =~ DCLK} -of [get_cells rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i/rx1_u_adc]]] \
  -to   [list [get_pins -filter {REF_PIN_NAME =~ DATA_ADC*} -of [get_cells rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i/rx1_u_adc]]]

# Workaround to exclude paths that are wrongly related to DCLK
set_false_path -from $rfdc_ex_usp_rf_data_converter_0_0_axi_aclk -through [get_pins -filter {REF_PIN_NAME =~ DATA_DAC*} -of [get_cells rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i/tx0_u_dac]]
create_waiver -internal -scope -user USP_RF_DATA_CONVERTER -type CDC -id CDC-1 \
  -tags "1033132" \
  -description "Paths wrongly related to DRP clock" \
  -from [list [get_pins -filter {REF_PIN_NAME =~ DCLK} -of [get_cells rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i/tx0_u_dac]]] \
  -to   [list [get_pins -filter {REF_PIN_NAME =~ DATA_DAC*} -of [get_cells rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i/tx0_u_dac]]]

# To path not found in RFADC and RFDAC
#set_multicycle_path -from [get_pins -filter {REF_PIN_NAME==C} -of [get_cells -hier -filter {name =~  *tile_config/ram/data_reg[*]}]] -to [get_pins -filter {REF_PIN_NAME=~DI[*]} -of [get_cells -hier -filter {name =~ *rf_wrapper_i/*_u_*c}]] -setup 3
#set_multicycle_path -from [get_pins -filter {REF_PIN_NAME==C} -of [get_cells -hier -filter {name =~  *tile_config/ram/data_reg[*]}]] -to [get_pins -filter {REF_PIN_NAME=~DI[*]} -of [get_cells -hier -filter {name =~ *rf_wrapper_i/*_u_*c}]] -hold  2
#set_multicycle_path -from [get_pins -filter {REF_PIN_NAME==C} -of [get_cells -hier -filter {name =~  *tile_config/ram/data_reg[*]}]] -to [get_pins -hierarchical -regexp {.*rf_wrapper_i\/.*_u_.*c\/DADDR\[[0-9][0]*\]}] -setup 3
#set_multicycle_path -from [get_pins -filter {REF_PIN_NAME==C} -of [get_cells -hier -filter {name =~  *tile_config/ram/data_reg[*]}]] -to [get_pins -hierarchical -regexp {.*rf_wrapper_i\/.*_u_.*c\/DADDR\[[0-9][0]*\]}] -hold  2


//----------------------------------------------------------------------------
// Title : ROM for tile configuration
// Project : Ultrascale+ RF Data Converter Subsystem
//----------------------------------------------------------------------------
//
// (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// (c) Copyright 2022-2024 Advanced Micro Devices, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


`timescale 1ps/1ps

module rfdc_ex_usp_rf_data_converter_0_0_device_rom (
    aux_clk,
    data_index,
    data_out,
    addr_out,
    tile_out
  );

    input aux_clk;

    input [10:0] data_index;

    output [15:0] data_out;
    output [10:0] addr_out;
    output [2:0]  tile_out;

    reg [29:0] data;

    // The 30-bit data in the array follows the format below:
    // 29:27 |  26:24  |    23:16    |    15:0
    // Tile  |  Slice  | DRP Address |  DRP Data

    (* rom_style = "distributed" *) reg [29:0] data_array [0:93] = '{
       30'h07280600,  // SYSREF Distribution (ADC0)
       30'h00740080,  // RX_PAIR_MC_CONFIG0 (ADC00)
       30'h01740080,  // RX_PAIR_MC_CONFIG0 (ADC01)
       30'h02740080,  // RX_PAIR_MC_CONFIG0 (ADC02)
       30'h03740080,  // RX_PAIR_MC_CONFIG0 (ADC03)
       30'h0f230000,  // Clock Network Control 0 (ADC1)
       30'h0f240000,  // Clock Network Control 1 (ADC1)
       30'h0f222000,  // Clock Distribution Control (ADC1)
       30'h08740080,  // RX_PAIR_MC_CONFIG0 (ADC10)
       30'h09740080,  // RX_PAIR_MC_CONFIG0 (ADC11)
       30'h0a740080,  // RX_PAIR_MC_CONFIG0 (ADC12)
       30'h0b740080,  // RX_PAIR_MC_CONFIG0 (ADC13)
       30'h0f17001c,  // PLL FB Div (ADC1)
       30'h0f0c00c1,  // PLL Output Divide (ADC1)
       30'h0f100010,  // PLL Ref clock divide (ADC1)
       30'h0f000080,  // PLL SDM CONFIG0 (ADC1)
       30'h0f060111,  // PLL SDM seed (ADC1)
       30'h0f070011,  // PLL SDM seed setup (ADC1)
       30'h0f0e0d37,  // PLL ChargePump setup (ADC1)
       30'h0f0f2080,  // PLL temprature sensor control (ADC1)
       30'h0f12ffff,  // PLL ChargePump setup (ADC1)
       30'h0f137f99,  // PLL loop filter setup (ADC1)
       30'h0f140006,  // PLL loop filter setup (ADC1)
       30'h0f155800,  // PLL VCO setup (ADC1)
       30'h0f160008,  // PLL VCO setup (ADC1)
       30'h0f0a7a20,  // PLL Coarse Frequency setup (ADC1)
       30'h0f0b7008,  // PLL Coarse Frequency setup (ADC1)
       30'h0f11002d,  // PLL Voltage Regulator setup (ADC1)
       30'h0f2c0025,  // CLK_DIV (ADC1)
       30'h0f288880,  // SYSREF Distribution (ADC1)
       30'h0f2dfffc,  // HSCOM_PWR_MASK (ADC1)
       30'h0f310062,  // CLOCK_DETECT_CTRL0 (ADC1)
       30'h0f320032,  // CLOCK_DETECT_CTRL1 (ADC1)
       30'h0f300040,  // FIFO_START (ADC1)
       30'h08020801,  // ADC10 Data Width
       30'h08100000,  // ADC10 Decimation Config
       30'h08110008,  // ADC10 Decimation Mode
       30'h08200000,  // ADC10 Mixer Config 0
       30'h08210924,  // ADC10 Mixer Config 1
       30'h083a0000,  // ADC10 Switch Matrix Config
       30'h087121e1,  // ADC10 RX MC Config 0
       30'h08780002,  // ADC10 DSA Control
       30'h085181c3,  // ADC10 TI_DCB_CTRL0
       30'h0855d44c,  // ADC10 TI_TIME_SKEW_CTRL0
       30'h085a0001,  // ADC10 TI_TIME_SKEW_CTRL5
       30'h081d001c,  // ADC10 CAL_FREEZE_MASK
       30'h08450091,  // ADC10_SIG_DET_CTRL
       30'h08460148,  // ADC10_SIG_DET_THRESHOLD_LEVEL0
       30'h0847012c,  // ADC10_SIG_DET_THRESHOLD_LEVEL0_CNT_ON
       30'h0848012c,  // ADC10_SIG_DET_THRESHOLD_LEVEL0_CNT_OFF
       30'h08060008,  // ADC10 FABRIC_DEBUG
       30'h17281700,  // SYSREF Distribution (ADC2)
       30'h1f230000,  // Clock Network Control 0 (DAC0)
       30'h1f240000,  // Clock Network Control 1 (DAC0)
       30'h1f222000,  // Clock Distribution Control (DAC0)
       30'h1f17001e,  // PLL FB Div (DAC0)
       30'h1f0c0040,  // PLL Output Divide (DAC0)
       30'h1f100010,  // PLL Ref clock divide (DAC0)
       30'h1f000080,  // PLL SDM CONFIG0 (DAC0)
       30'h1f060111,  // PLL SDM seed (DAC0)
       30'h1f070011,  // PLL SDM seed setup (DAC0)
       30'h1f0e0d37,  // PLL ChargePump setup (DAC0)
       30'h1f0f2080,  // PLL temprature sensor control (DAC0)
       30'h1f12ffff,  // PLL ChargePump setup (DAC0)
       30'h1f137fee,  // PLL loop filter setup (DAC0)
       30'h1f140006,  // PLL loop filter setup (DAC0)
       30'h1f155f03,  // PLL VCO setup (DAC0)
       30'h1f160008,  // PLL VCO setup (DAC0)
       30'h1f0a7a20,  // PLL Coarse Frequency setup (DAC0)
       30'h1f0b7008,  // PLL Coarse Frequency setup (DAC0)
       30'h1f11002d,  // PLL Voltage Regulator setup (DAC0)
       30'h1f2c0015,  // CLK_DIV (DAC0)
       30'h1f28c980,  // SYSREF Distribution (DAC0)
       30'h1f2dfffc,  // HSCOM_PWR_MASK (DAC0)
       30'h1f3103e6,  // CLOCK_DETECT_CTRL0 (DAC0)
       30'h1f3204e1,  // CLOCK_DETECT_CTRL1 (DAC0)
       30'h18020210,  // DAC00 Data Width
       30'h18100808,  // DAC00 Interpolation Control
       30'h18110001,  // DAC00 Interpolation Data
       30'h18200410,  // DAC00 Mixer Config 0
       30'h18210410,  // DAC00 Mixer Config 1
       30'h18300000,  // DAC00 Inv Sinc Filter
       30'h18310040,  // DAC00 Multiband Config
       30'h18600009,  // DAC00 Decoder Control
       30'h18610001,  // DAC00 Decoder Clock Enable
       30'h1871a002,  // DAC00 MC_CONFIG0
       30'h1873aa53,  // DAC00 MC_CONFIG2
       30'h18746a45,  // DAC00 MC_CONFIG3
       30'h18660001,  // DAC00 VOP_CTRL
       30'h180d0000,  // DAC00 DATAPATH
       30'h18040000,  // DAC00 FIFO_START
       30'h18070002,  // DAC00 FABRIC_DEBUG
       30'h27280100,  // SYSREF Distribution (DAC1)
       30'h00000000};

    //-------------------------------------------------------------------------
    // Output the tile number, address and data for the DRP writes
    // depending on the data_index input
    //-------------------------------------------------------------------------
    always @(posedge aux_clk)
    begin
      data <= data_array[data_index];
    end

    assign data_out = data[15:0];
    assign addr_out = data[26:16];
    assign tile_out = data[29:27];

endmodule

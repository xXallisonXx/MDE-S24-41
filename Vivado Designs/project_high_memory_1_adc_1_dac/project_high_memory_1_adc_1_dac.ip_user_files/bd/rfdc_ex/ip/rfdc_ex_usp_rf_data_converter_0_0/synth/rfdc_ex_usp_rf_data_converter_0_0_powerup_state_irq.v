//----------------------------------------------------------------------------
// Title : Over Voltage IRQ Set and Clear Module
// Project : Ultrascale+ RF Data Converter Subsystem
//----------------------------------------------------------------------------
// File : rfdc_ex_usp_rf_data_converter_0_0"_powerup_state_irq.v
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


`timescale 1ns / 1ps

module rfdc_ex_usp_rf_data_converter_0_0_powerup_state_irq (
  input            adc0_read_req,
  input            adc0_powerup_state_in,
  output           adc0_powerup_state_ack,
  output reg       adc0_powerup_state_out,
  
  input            adc1_read_req,
  input            adc1_powerup_state_in,
  output           adc1_powerup_state_ack,
  output reg       adc1_powerup_state_out,
  
  input            adc2_read_req,
  input            adc2_powerup_state_in,
  output           adc2_powerup_state_ack,
  output reg       adc2_powerup_state_out,
  
  input            dac0_read_req,
  input            dac0_powerup_state_in,
  output           dac0_powerup_state_ack,
  output reg       dac0_powerup_state_out,
  
  input            dac1_read_req,
  input            dac1_powerup_state_in,
  output           dac1_powerup_state_ack,
  output reg       dac1_powerup_state_out,
  
  input            adc0_restart,
  input            adc1_restart,
  input            adc2_restart,
  input            dac0_restart,
  input            dac1_restart,
  input            clk,
  input            rst
);
  
// Generate a signal to indicate powerup_state IRQ
always @(posedge clk)
  if (rst) begin
    adc0_powerup_state_out <= 1'b0;
  end
  else begin
    if (adc0_restart == 1'b1) begin
      adc0_powerup_state_out <= 1'b0;
    end
    else if (adc0_powerup_state_ack) begin
      adc0_powerup_state_out <= 1'b0;
    end
    else if (adc0_powerup_state_in == 1'b1)begin
      adc0_powerup_state_out <= 1'b1;
    end
  end

rfdc_ex_usp_rf_data_converter_0_0_irq_req_ack i_adc0_powerup_state_ack
(
  .clk                 (clk),
  .reset               (rst),
  .axi_read_req        (adc0_read_req),
  .read_ack            (adc0_powerup_state_ack)
);

always @(posedge clk)
  if (rst) begin
    adc1_powerup_state_out <= 1'b0;
  end
  else begin
    if (adc1_restart == 1'b1) begin
      adc1_powerup_state_out <= 1'b0;
    end
    else if (adc1_powerup_state_ack) begin
      adc1_powerup_state_out <= 1'b0;
    end
    else if (adc1_powerup_state_in == 1'b1)begin
      adc1_powerup_state_out <= 1'b1;
    end
  end

rfdc_ex_usp_rf_data_converter_0_0_irq_req_ack i_adc1_powerup_state_ack
(
  .clk                 (clk),
  .reset               (rst),
  .axi_read_req        (adc1_read_req),
  .read_ack            (adc1_powerup_state_ack)
);

always @(posedge clk)
  if (rst) begin
    adc2_powerup_state_out <= 1'b0;
  end
  else begin
    if (adc2_restart == 1'b1) begin
      adc2_powerup_state_out <= 1'b0;
    end
    else if (adc2_powerup_state_ack) begin
      adc2_powerup_state_out <= 1'b0;
    end
    else if (adc2_powerup_state_in == 1'b1)begin
      adc2_powerup_state_out <= 1'b1;
    end
  end

rfdc_ex_usp_rf_data_converter_0_0_irq_req_ack i_adc2_powerup_state_ack
(
  .clk                 (clk),
  .reset               (rst),
  .axi_read_req        (adc2_read_req),
  .read_ack            (adc2_powerup_state_ack)
);

always @(posedge clk)
  if (rst) begin
    dac0_powerup_state_out <= 1'b0;
  end
  else begin
    if (dac0_restart == 1'b1) begin
      dac0_powerup_state_out <= 1'b0;
    end
    else if (dac0_powerup_state_ack) begin
      dac0_powerup_state_out <= 1'b0;
    end
    else if (dac0_powerup_state_in == 1'b1)begin
      dac0_powerup_state_out <= 1'b1;
    end
  end

rfdc_ex_usp_rf_data_converter_0_0_irq_req_ack i_dac0_powerup_state_ack
(
  .clk                 (clk),
  .reset               (rst),
  .axi_read_req        (dac0_read_req),
  .read_ack            (dac0_powerup_state_ack)
);

always @(posedge clk)
  if (rst) begin
    dac1_powerup_state_out <= 1'b0;
  end
  else begin
    if (dac1_restart == 1'b1) begin
      dac1_powerup_state_out <= 1'b0;
    end
    else if (dac1_powerup_state_ack) begin
      dac1_powerup_state_out <= 1'b0;
    end
    else if (dac1_powerup_state_in == 1'b1)begin
      dac1_powerup_state_out <= 1'b1;
    end
  end

rfdc_ex_usp_rf_data_converter_0_0_irq_req_ack i_dac1_powerup_state_ack
(
  .clk                 (clk),
  .reset               (rst),
  .axi_read_req        (dac1_read_req),
  .read_ack            (dac1_powerup_state_ack)
);

endmodule

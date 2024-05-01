//----------------------------------------------------------------------------
// Title : Over Voltage IRQ Set and Clear Module
// Project : Ultrascale+ RF Data Converter Subsystem
//----------------------------------------------------------------------------
// File : rfdc_ex_usp_rf_data_converter_0_0"_overvol_irq.v
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

module rfdc_ex_usp_rf_data_converter_0_0_overvol_irq (
  input            adc00_read_req,
  input            adc00_overvol_in,
  input            adc00_cm_overvol_in,
  input            adc00_cm_undervol_in,
  output           adc00_ack,
  output reg       adc00_overvol_out,
  output reg       adc00_cm_overvol_out,
  output reg       adc00_cm_undervol_out,
  
  input            adc01_read_req,
  input            adc01_overvol_in,
  input            adc01_cm_overvol_in,
  input            adc01_cm_undervol_in,
  output           adc01_ack,
  output reg       adc01_overvol_out,
  output reg       adc01_cm_overvol_out,
  output reg       adc01_cm_undervol_out,
  
  input            adc02_read_req,
  input            adc02_overvol_in,
  input            adc02_cm_overvol_in,
  input            adc02_cm_undervol_in,
  output           adc02_ack,
  output reg       adc02_overvol_out,
  output reg       adc02_cm_overvol_out,
  output reg       adc02_cm_undervol_out,
  
  input            adc03_read_req,
  input            adc03_overvol_in,
  input            adc03_cm_overvol_in,
  input            adc03_cm_undervol_in,
  output           adc03_ack,
  output reg       adc03_overvol_out,
  output reg       adc03_cm_overvol_out,
  output reg       adc03_cm_undervol_out,
  
  input            adc10_read_req,
  input            adc10_overvol_in,
  input            adc10_cm_overvol_in,
  input            adc10_cm_undervol_in,
  output           adc10_ack,
  output reg       adc10_overvol_out,
  output reg       adc10_cm_overvol_out,
  output reg       adc10_cm_undervol_out,
  
  input            adc11_read_req,
  input            adc11_overvol_in,
  input            adc11_cm_overvol_in,
  input            adc11_cm_undervol_in,
  output           adc11_ack,
  output reg       adc11_overvol_out,
  output reg       adc11_cm_overvol_out,
  output reg       adc11_cm_undervol_out,
  
  input            adc12_read_req,
  input            adc12_overvol_in,
  input            adc12_cm_overvol_in,
  input            adc12_cm_undervol_in,
  output           adc12_ack,
  output reg       adc12_overvol_out,
  output reg       adc12_cm_overvol_out,
  output reg       adc12_cm_undervol_out,
  
  input            adc13_read_req,
  input            adc13_overvol_in,
  input            adc13_cm_overvol_in,
  input            adc13_cm_undervol_in,
  output           adc13_ack,
  output reg       adc13_overvol_out,
  output reg       adc13_cm_overvol_out,
  output reg       adc13_cm_undervol_out,
  
  input            adc20_read_req,
  input            adc20_overvol_in,
  input            adc20_cm_overvol_in,
  input            adc20_cm_undervol_in,
  output           adc20_ack,
  output reg       adc20_overvol_out,
  output reg       adc20_cm_overvol_out,
  output reg       adc20_cm_undervol_out,
  
  input            adc21_read_req,
  input            adc21_overvol_in,
  input            adc21_cm_overvol_in,
  input            adc21_cm_undervol_in,
  output           adc21_ack,
  output reg       adc21_overvol_out,
  output reg       adc21_cm_overvol_out,
  output reg       adc21_cm_undervol_out,
  
  input            adc22_read_req,
  input            adc22_overvol_in,
  input            adc22_cm_overvol_in,
  input            adc22_cm_undervol_in,
  output           adc22_ack,
  output reg       adc22_overvol_out,
  output reg       adc22_cm_overvol_out,
  output reg       adc22_cm_undervol_out,
  
  input            adc23_read_req,
  input            adc23_overvol_in,
  input            adc23_cm_overvol_in,
  input            adc23_cm_undervol_in,
  output           adc23_ack,
  output reg       adc23_overvol_out,
  output reg       adc23_cm_overvol_out,
  output reg       adc23_cm_undervol_out,
  
  input            adc0_done,
  input            adc1_done,
  input            adc2_done,
  input            clk,
  input            rst
);
  
// Generate a signal to indicate overvoltage IRQ
always @(posedge clk)
  if (rst) begin
    adc00_overvol_out <= 1'b0;
  end
  else begin
    if (adc0_done == 1'b0) begin
      adc00_overvol_out <= 1'b0;
    end
    else if (adc00_ack) begin
      adc00_overvol_out <= 1'b0;
    end
    else if (adc00_overvol_in == 1'b1)begin
      adc00_overvol_out <= 1'b1;
    end
  end
always @(posedge clk)
  if (rst) begin
    adc00_cm_overvol_out <= 1'b0;
  end
  else begin
    if (adc0_done == 1'b0) begin
      adc00_cm_overvol_out <= 1'b0;
    end
    else if (adc00_ack) begin
      adc00_cm_overvol_out <= 1'b0;
    end
    else if (adc00_cm_overvol_in == 1'b1)begin
      adc00_cm_overvol_out <= 1'b1;
    end
  end
  
 always @(posedge clk)
  if (rst) begin
    adc00_cm_undervol_out <= 1'b0;
  end
  else begin
    if (adc0_done == 1'b0) begin
      adc00_cm_undervol_out <= 1'b0;
    end
    else if (adc00_ack) begin
      adc00_cm_undervol_out <= 1'b0;
    end
    else if (adc00_overvol_in == 1'b1)begin
      adc00_cm_undervol_out <= 1'b1;
    end
  end

rfdc_ex_usp_rf_data_converter_0_0_irq_req_ack i_adc00_overvol_ack
(
  .clk                 (clk),
  .reset               (rst),
  .axi_read_req        (adc00_read_req),
  .read_ack            (adc00_ack)
);

always @(posedge clk)
  if (rst) begin
    adc01_overvol_out <= 1'b0;
  end
  else begin
    if (adc0_done == 1'b0) begin
      adc01_overvol_out <= 1'b0;
    end
    else if (adc01_ack) begin
      adc01_overvol_out <= 1'b0;
    end
    else if (adc01_overvol_in == 1'b1)begin
      adc01_overvol_out <= 1'b1;
    end
  end
always @(posedge clk)
  if (rst) begin
    adc01_cm_overvol_out <= 1'b0;
  end
  else begin
    if (adc0_done == 1'b0) begin
      adc01_cm_overvol_out <= 1'b0;
    end
    else if (adc01_ack) begin
      adc01_cm_overvol_out <= 1'b0;
    end
    else if (adc01_cm_overvol_in == 1'b1)begin
      adc01_cm_overvol_out <= 1'b1;
    end
  end
  
 always @(posedge clk)
  if (rst) begin
    adc01_cm_undervol_out <= 1'b0;
  end
  else begin
    if (adc0_done == 1'b0) begin
      adc01_cm_undervol_out <= 1'b0;
    end
    else if (adc01_ack) begin
      adc01_cm_undervol_out <= 1'b0;
    end
    else if (adc01_overvol_in == 1'b1)begin
      adc01_cm_undervol_out <= 1'b1;
    end
  end

rfdc_ex_usp_rf_data_converter_0_0_irq_req_ack i_adc01_overvol_ack
(
  .clk                 (clk),
  .reset               (rst),
  .axi_read_req        (adc01_read_req),
  .read_ack            (adc01_ack)
);

always @(posedge clk)
  if (rst) begin
    adc02_overvol_out <= 1'b0;
  end
  else begin
    if (adc0_done == 1'b0) begin
      adc02_overvol_out <= 1'b0;
    end
    else if (adc02_ack) begin
      adc02_overvol_out <= 1'b0;
    end
    else if (adc02_overvol_in == 1'b1)begin
      adc02_overvol_out <= 1'b1;
    end
  end
always @(posedge clk)
  if (rst) begin
    adc02_cm_overvol_out <= 1'b0;
  end
  else begin
    if (adc0_done == 1'b0) begin
      adc02_cm_overvol_out <= 1'b0;
    end
    else if (adc02_ack) begin
      adc02_cm_overvol_out <= 1'b0;
    end
    else if (adc02_cm_overvol_in == 1'b1)begin
      adc02_cm_overvol_out <= 1'b1;
    end
  end
  
 always @(posedge clk)
  if (rst) begin
    adc02_cm_undervol_out <= 1'b0;
  end
  else begin
    if (adc0_done == 1'b0) begin
      adc02_cm_undervol_out <= 1'b0;
    end
    else if (adc02_ack) begin
      adc02_cm_undervol_out <= 1'b0;
    end
    else if (adc02_overvol_in == 1'b1)begin
      adc02_cm_undervol_out <= 1'b1;
    end
  end

rfdc_ex_usp_rf_data_converter_0_0_irq_req_ack i_adc02_overvol_ack
(
  .clk                 (clk),
  .reset               (rst),
  .axi_read_req        (adc02_read_req),
  .read_ack            (adc02_ack)
);

always @(posedge clk)
  if (rst) begin
    adc03_overvol_out <= 1'b0;
  end
  else begin
    if (adc0_done == 1'b0) begin
      adc03_overvol_out <= 1'b0;
    end
    else if (adc03_ack) begin
      adc03_overvol_out <= 1'b0;
    end
    else if (adc03_overvol_in == 1'b1)begin
      adc03_overvol_out <= 1'b1;
    end
  end
always @(posedge clk)
  if (rst) begin
    adc03_cm_overvol_out <= 1'b0;
  end
  else begin
    if (adc0_done == 1'b0) begin
      adc03_cm_overvol_out <= 1'b0;
    end
    else if (adc03_ack) begin
      adc03_cm_overvol_out <= 1'b0;
    end
    else if (adc03_cm_overvol_in == 1'b1)begin
      adc03_cm_overvol_out <= 1'b1;
    end
  end
  
 always @(posedge clk)
  if (rst) begin
    adc03_cm_undervol_out <= 1'b0;
  end
  else begin
    if (adc0_done == 1'b0) begin
      adc03_cm_undervol_out <= 1'b0;
    end
    else if (adc03_ack) begin
      adc03_cm_undervol_out <= 1'b0;
    end
    else if (adc03_overvol_in == 1'b1)begin
      adc03_cm_undervol_out <= 1'b1;
    end
  end

rfdc_ex_usp_rf_data_converter_0_0_irq_req_ack i_adc03_overvol_ack
(
  .clk                 (clk),
  .reset               (rst),
  .axi_read_req        (adc03_read_req),
  .read_ack            (adc03_ack)
);

always @(posedge clk)
  if (rst) begin
    adc10_overvol_out <= 1'b0;
  end
  else begin
    if (adc1_done == 1'b0) begin
      adc10_overvol_out <= 1'b0;
    end
    else if (adc10_ack) begin
      adc10_overvol_out <= 1'b0;
    end
    else if (adc10_overvol_in == 1'b1)begin
      adc10_overvol_out <= 1'b1;
    end
  end
always @(posedge clk)
  if (rst) begin
    adc10_cm_overvol_out <= 1'b0;
  end
  else begin
    if (adc1_done == 1'b0) begin
      adc10_cm_overvol_out <= 1'b0;
    end
    else if (adc10_ack) begin
      adc10_cm_overvol_out <= 1'b0;
    end
    else if (adc10_cm_overvol_in == 1'b1)begin
      adc10_cm_overvol_out <= 1'b1;
    end
  end
  
 always @(posedge clk)
  if (rst) begin
    adc10_cm_undervol_out <= 1'b0;
  end
  else begin
    if (adc1_done == 1'b0) begin
      adc10_cm_undervol_out <= 1'b0;
    end
    else if (adc10_ack) begin
      adc10_cm_undervol_out <= 1'b0;
    end
    else if (adc10_overvol_in == 1'b1)begin
      adc10_cm_undervol_out <= 1'b1;
    end
  end

rfdc_ex_usp_rf_data_converter_0_0_irq_req_ack i_adc10_overvol_ack
(
  .clk                 (clk),
  .reset               (rst),
  .axi_read_req        (adc10_read_req),
  .read_ack            (adc10_ack)
);

always @(posedge clk)
  if (rst) begin
    adc11_overvol_out <= 1'b0;
  end
  else begin
    if (adc1_done == 1'b0) begin
      adc11_overvol_out <= 1'b0;
    end
    else if (adc11_ack) begin
      adc11_overvol_out <= 1'b0;
    end
    else if (adc11_overvol_in == 1'b1)begin
      adc11_overvol_out <= 1'b1;
    end
  end
always @(posedge clk)
  if (rst) begin
    adc11_cm_overvol_out <= 1'b0;
  end
  else begin
    if (adc1_done == 1'b0) begin
      adc11_cm_overvol_out <= 1'b0;
    end
    else if (adc11_ack) begin
      adc11_cm_overvol_out <= 1'b0;
    end
    else if (adc11_cm_overvol_in == 1'b1)begin
      adc11_cm_overvol_out <= 1'b1;
    end
  end
  
 always @(posedge clk)
  if (rst) begin
    adc11_cm_undervol_out <= 1'b0;
  end
  else begin
    if (adc1_done == 1'b0) begin
      adc11_cm_undervol_out <= 1'b0;
    end
    else if (adc11_ack) begin
      adc11_cm_undervol_out <= 1'b0;
    end
    else if (adc11_overvol_in == 1'b1)begin
      adc11_cm_undervol_out <= 1'b1;
    end
  end

rfdc_ex_usp_rf_data_converter_0_0_irq_req_ack i_adc11_overvol_ack
(
  .clk                 (clk),
  .reset               (rst),
  .axi_read_req        (adc11_read_req),
  .read_ack            (adc11_ack)
);

always @(posedge clk)
  if (rst) begin
    adc12_overvol_out <= 1'b0;
  end
  else begin
    if (adc1_done == 1'b0) begin
      adc12_overvol_out <= 1'b0;
    end
    else if (adc12_ack) begin
      adc12_overvol_out <= 1'b0;
    end
    else if (adc12_overvol_in == 1'b1)begin
      adc12_overvol_out <= 1'b1;
    end
  end
always @(posedge clk)
  if (rst) begin
    adc12_cm_overvol_out <= 1'b0;
  end
  else begin
    if (adc1_done == 1'b0) begin
      adc12_cm_overvol_out <= 1'b0;
    end
    else if (adc12_ack) begin
      adc12_cm_overvol_out <= 1'b0;
    end
    else if (adc12_cm_overvol_in == 1'b1)begin
      adc12_cm_overvol_out <= 1'b1;
    end
  end
  
 always @(posedge clk)
  if (rst) begin
    adc12_cm_undervol_out <= 1'b0;
  end
  else begin
    if (adc1_done == 1'b0) begin
      adc12_cm_undervol_out <= 1'b0;
    end
    else if (adc12_ack) begin
      adc12_cm_undervol_out <= 1'b0;
    end
    else if (adc12_overvol_in == 1'b1)begin
      adc12_cm_undervol_out <= 1'b1;
    end
  end

rfdc_ex_usp_rf_data_converter_0_0_irq_req_ack i_adc12_overvol_ack
(
  .clk                 (clk),
  .reset               (rst),
  .axi_read_req        (adc12_read_req),
  .read_ack            (adc12_ack)
);

always @(posedge clk)
  if (rst) begin
    adc13_overvol_out <= 1'b0;
  end
  else begin
    if (adc1_done == 1'b0) begin
      adc13_overvol_out <= 1'b0;
    end
    else if (adc13_ack) begin
      adc13_overvol_out <= 1'b0;
    end
    else if (adc13_overvol_in == 1'b1)begin
      adc13_overvol_out <= 1'b1;
    end
  end
always @(posedge clk)
  if (rst) begin
    adc13_cm_overvol_out <= 1'b0;
  end
  else begin
    if (adc1_done == 1'b0) begin
      adc13_cm_overvol_out <= 1'b0;
    end
    else if (adc13_ack) begin
      adc13_cm_overvol_out <= 1'b0;
    end
    else if (adc13_cm_overvol_in == 1'b1)begin
      adc13_cm_overvol_out <= 1'b1;
    end
  end
  
 always @(posedge clk)
  if (rst) begin
    adc13_cm_undervol_out <= 1'b0;
  end
  else begin
    if (adc1_done == 1'b0) begin
      adc13_cm_undervol_out <= 1'b0;
    end
    else if (adc13_ack) begin
      adc13_cm_undervol_out <= 1'b0;
    end
    else if (adc13_overvol_in == 1'b1)begin
      adc13_cm_undervol_out <= 1'b1;
    end
  end

rfdc_ex_usp_rf_data_converter_0_0_irq_req_ack i_adc13_overvol_ack
(
  .clk                 (clk),
  .reset               (rst),
  .axi_read_req        (adc13_read_req),
  .read_ack            (adc13_ack)
);

always @(posedge clk)
  if (rst) begin
    adc20_overvol_out <= 1'b0;
  end
  else begin
    if (adc2_done == 1'b0) begin
      adc20_overvol_out <= 1'b0;
    end
    else if (adc20_ack) begin
      adc20_overvol_out <= 1'b0;
    end
    else if (adc20_overvol_in == 1'b1)begin
      adc20_overvol_out <= 1'b1;
    end
  end
always @(posedge clk)
  if (rst) begin
    adc20_cm_overvol_out <= 1'b0;
  end
  else begin
    if (adc2_done == 1'b0) begin
      adc20_cm_overvol_out <= 1'b0;
    end
    else if (adc20_ack) begin
      adc20_cm_overvol_out <= 1'b0;
    end
    else if (adc20_cm_overvol_in == 1'b1)begin
      adc20_cm_overvol_out <= 1'b1;
    end
  end
  
 always @(posedge clk)
  if (rst) begin
    adc20_cm_undervol_out <= 1'b0;
  end
  else begin
    if (adc2_done == 1'b0) begin
      adc20_cm_undervol_out <= 1'b0;
    end
    else if (adc20_ack) begin
      adc20_cm_undervol_out <= 1'b0;
    end
    else if (adc20_overvol_in == 1'b1)begin
      adc20_cm_undervol_out <= 1'b1;
    end
  end

rfdc_ex_usp_rf_data_converter_0_0_irq_req_ack i_adc20_overvol_ack
(
  .clk                 (clk),
  .reset               (rst),
  .axi_read_req        (adc20_read_req),
  .read_ack            (adc20_ack)
);

always @(posedge clk)
  if (rst) begin
    adc21_overvol_out <= 1'b0;
  end
  else begin
    if (adc2_done == 1'b0) begin
      adc21_overvol_out <= 1'b0;
    end
    else if (adc21_ack) begin
      adc21_overvol_out <= 1'b0;
    end
    else if (adc21_overvol_in == 1'b1)begin
      adc21_overvol_out <= 1'b1;
    end
  end
always @(posedge clk)
  if (rst) begin
    adc21_cm_overvol_out <= 1'b0;
  end
  else begin
    if (adc2_done == 1'b0) begin
      adc21_cm_overvol_out <= 1'b0;
    end
    else if (adc21_ack) begin
      adc21_cm_overvol_out <= 1'b0;
    end
    else if (adc21_cm_overvol_in == 1'b1)begin
      adc21_cm_overvol_out <= 1'b1;
    end
  end
  
 always @(posedge clk)
  if (rst) begin
    adc21_cm_undervol_out <= 1'b0;
  end
  else begin
    if (adc2_done == 1'b0) begin
      adc21_cm_undervol_out <= 1'b0;
    end
    else if (adc21_ack) begin
      adc21_cm_undervol_out <= 1'b0;
    end
    else if (adc21_overvol_in == 1'b1)begin
      adc21_cm_undervol_out <= 1'b1;
    end
  end

rfdc_ex_usp_rf_data_converter_0_0_irq_req_ack i_adc21_overvol_ack
(
  .clk                 (clk),
  .reset               (rst),
  .axi_read_req        (adc21_read_req),
  .read_ack            (adc21_ack)
);

always @(posedge clk)
  if (rst) begin
    adc22_overvol_out <= 1'b0;
  end
  else begin
    if (adc2_done == 1'b0) begin
      adc22_overvol_out <= 1'b0;
    end
    else if (adc22_ack) begin
      adc22_overvol_out <= 1'b0;
    end
    else if (adc22_overvol_in == 1'b1)begin
      adc22_overvol_out <= 1'b1;
    end
  end
always @(posedge clk)
  if (rst) begin
    adc22_cm_overvol_out <= 1'b0;
  end
  else begin
    if (adc2_done == 1'b0) begin
      adc22_cm_overvol_out <= 1'b0;
    end
    else if (adc22_ack) begin
      adc22_cm_overvol_out <= 1'b0;
    end
    else if (adc22_cm_overvol_in == 1'b1)begin
      adc22_cm_overvol_out <= 1'b1;
    end
  end
  
 always @(posedge clk)
  if (rst) begin
    adc22_cm_undervol_out <= 1'b0;
  end
  else begin
    if (adc2_done == 1'b0) begin
      adc22_cm_undervol_out <= 1'b0;
    end
    else if (adc22_ack) begin
      adc22_cm_undervol_out <= 1'b0;
    end
    else if (adc22_overvol_in == 1'b1)begin
      adc22_cm_undervol_out <= 1'b1;
    end
  end

rfdc_ex_usp_rf_data_converter_0_0_irq_req_ack i_adc22_overvol_ack
(
  .clk                 (clk),
  .reset               (rst),
  .axi_read_req        (adc22_read_req),
  .read_ack            (adc22_ack)
);

always @(posedge clk)
  if (rst) begin
    adc23_overvol_out <= 1'b0;
  end
  else begin
    if (adc2_done == 1'b0) begin
      adc23_overvol_out <= 1'b0;
    end
    else if (adc23_ack) begin
      adc23_overvol_out <= 1'b0;
    end
    else if (adc23_overvol_in == 1'b1)begin
      adc23_overvol_out <= 1'b1;
    end
  end
always @(posedge clk)
  if (rst) begin
    adc23_cm_overvol_out <= 1'b0;
  end
  else begin
    if (adc2_done == 1'b0) begin
      adc23_cm_overvol_out <= 1'b0;
    end
    else if (adc23_ack) begin
      adc23_cm_overvol_out <= 1'b0;
    end
    else if (adc23_cm_overvol_in == 1'b1)begin
      adc23_cm_overvol_out <= 1'b1;
    end
  end
  
 always @(posedge clk)
  if (rst) begin
    adc23_cm_undervol_out <= 1'b0;
  end
  else begin
    if (adc2_done == 1'b0) begin
      adc23_cm_undervol_out <= 1'b0;
    end
    else if (adc23_ack) begin
      adc23_cm_undervol_out <= 1'b0;
    end
    else if (adc23_overvol_in == 1'b1)begin
      adc23_cm_undervol_out <= 1'b1;
    end
  end

rfdc_ex_usp_rf_data_converter_0_0_irq_req_ack i_adc23_overvol_ack
(
  .clk                 (clk),
  .reset               (rst),
  .axi_read_req        (adc23_read_req),
  .read_ack            (adc23_ack)
);

endmodule

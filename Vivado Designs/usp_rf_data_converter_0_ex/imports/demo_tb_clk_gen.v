`timescale 1ps / 1ps
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES. 

module demo_tb_clk_gen #(
  
  parameter clkdac_0_fab_delay   = 100  , // Clock startup delay
  parameter clkdac_0_ref_delay   = 100  , // Clock startup delay
  parameter axi_reset_cycles     = 100 , // 
  parameter axi_clk_delay        = 100  // Clock startup delay

) (

    input  wire [31:0] axi_clk_phase, // Clock phase
    input  wire [31:0] pl_clk_phase,  // PL Clock phase for MTS

    input  wire [63:0] clkdac_0_fab_freq , // 
    input  wire [63:0] clkdac_0_ref_freq , //
    input  wire        clkdac_0_enable    , // 

    output reg         clkdac_0_fab       , // 
    output reg         clkdac_0_ref       , // 
    output reg         axi_resetn=0       , // 
    output reg         axi_reset=1        , //
    output reg         pl_clk_p           , //
    output reg         clk_axi              // 

);

integer reset_counter = axi_reset_cycles;

//////////////////////////////////////////////////////////////////////////////////
// AXI Clock generator. 
// Generate a POS and Negedge reset for use if required
//////////////////////////////////////////////////////////////////////////////////
initial
  begin
     clk_axi <= 1'b0;
     #(axi_clk_delay);
     forever
     begin
        clk_axi <= 1'b0;
        #(axi_clk_phase[31:16]);
        clk_axi <= 1'b1;
        #(axi_clk_phase[15:0]);
     end
  end

always @(posedge clk_axi) begin
   if (reset_counter != 0)
      reset_counter <= reset_counter - 1;
end

always @(posedge clk_axi) begin
   if (reset_counter == 0) begin
      axi_resetn <= 1;
      axi_reset  <= 0;
   end
end

//////////////////////////////////////////////////////////////////////////////////
// PL Clock generator for MTS. 
//////////////////////////////////////////////////////////////////////////////////
initial
  begin
     pl_clk_p <= 1'b0;
     forever
     begin
        pl_clk_p <= 1'b0;
        #(pl_clk_phase[31:16]);
        pl_clk_p <= 1'b1;
        #(pl_clk_phase[15:0]);
     end
  end

//////////////////////////////////////////////////////////////////////////////////
// Slice dac_0
//////////////////////////////////////////////////////////////////////////////////
real     fab_period_ps_dac_0;
real     fab_mhz_dac_0;
integer  fab_int_dac_0;
real     fab_frac_dac_0;
integer  fab_frac_inc_dac_0 = 0;
real     fab_frac_count_dac_0 = 0.0;

always @(*) begin
  fab_mhz_dac_0 = clkdac_0_fab_freq / 1000.0;
  if (clkdac_0_fab_freq != 64'd0) begin
    fab_period_ps_dac_0 = 1000000.0 / fab_mhz_dac_0;
    fab_int_dac_0 = fab_period_ps_dac_0 / 2;
    fab_frac_dac_0 = (fab_period_ps_dac_0 / 2.0) - fab_int_dac_0;
  end
end

initial begin
  forever begin
    if (clkdac_0_enable == 1'b1) begin
      clkdac_0_fab = 0;
      #(fab_int_dac_0 + fab_frac_inc_dac_0); 
      clkdac_0_fab = 1;
      #(fab_int_dac_0 + fab_frac_inc_dac_0);
    end
    else begin
      @(posedge clkdac_0_enable);
    end
  end
end

always @(clkdac_0_fab) begin
  if (fab_frac_dac_0 > 0.0) begin
    if (fab_frac_count_dac_0 + fab_frac_dac_0 > 1.0) begin
      fab_frac_count_dac_0 <= fab_frac_count_dac_0 + fab_frac_dac_0 - 1.0;
      fab_frac_inc_dac_0 <= 1;
    end
    else begin
      fab_frac_count_dac_0 <= fab_frac_count_dac_0 + fab_frac_dac_0;
      fab_frac_inc_dac_0 <= 0;
    end
  end
  else begin
    if (fab_frac_count_dac_0 + fab_frac_dac_0 < -1.0) begin
      fab_frac_count_dac_0 <= fab_frac_count_dac_0 + fab_frac_dac_0 + 1.0;
      fab_frac_inc_dac_0 <= -1;
    end
    else begin
      fab_frac_count_dac_0 <= fab_frac_count_dac_0 + fab_frac_dac_0;
      fab_frac_inc_dac_0 <= 0;
    end
  end
end

real     ref_period_ps_dac_0;
real     ref_mhz_dac_0;
integer  ref_int_dac_0;
real     ref_frac_dac_0;
integer  ref_frac_inc_dac_0 = 0;
real     ref_frac_count_dac_0 = 0.0;

always @(*) begin
  ref_mhz_dac_0 = clkdac_0_ref_freq / 1000.0;
  if (clkdac_0_ref_freq != 64'd0) begin
    ref_period_ps_dac_0 = 1000000.0 / ref_mhz_dac_0;
    ref_int_dac_0 = ref_period_ps_dac_0 / 2;
    ref_frac_dac_0 = (ref_period_ps_dac_0 / 2.0) - ref_int_dac_0;
  end
end

initial begin
  forever begin
    if (clkdac_0_enable == 1'b1) begin
      clkdac_0_ref = 0;
      #(ref_int_dac_0 + ref_frac_inc_dac_0); 
      clkdac_0_ref = 1;
      #(ref_int_dac_0 + ref_frac_inc_dac_0);
    end
    else begin
      @(posedge clkdac_0_enable);
    end
  end
end

always @(clkdac_0_ref) begin
  if (ref_frac_dac_0 > 0.0) begin
    if (ref_frac_count_dac_0 + ref_frac_dac_0 > 1.0) begin
      ref_frac_count_dac_0 <= ref_frac_count_dac_0 + ref_frac_dac_0 - 1.0;
      ref_frac_inc_dac_0 <= 1;
    end
    else begin
      ref_frac_count_dac_0 <= ref_frac_count_dac_0 + ref_frac_dac_0;
      ref_frac_inc_dac_0 <= 0;
    end
  end
  else begin
    if (ref_frac_count_dac_0 + ref_frac_dac_0 < -1.0) begin
      ref_frac_count_dac_0 <= ref_frac_count_dac_0 + ref_frac_dac_0 + 1.0;
      ref_frac_inc_dac_0 <= -1;
    end
    else begin
      ref_frac_count_dac_0 <= ref_frac_count_dac_0 + ref_frac_dac_0;
      ref_frac_inc_dac_0 <= 0;
    end
  end
end

endmodule

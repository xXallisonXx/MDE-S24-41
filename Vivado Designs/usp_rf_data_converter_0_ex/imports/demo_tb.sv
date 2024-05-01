//----------------------------------------------------------------------------
// Title : Demo Testbench
// Project : Ultrascale+ RF Data Converter Subsystem
//----------------------------------------------------------------------------
// File : demo_tb.v
//----------------------------------------------------------------------------
//
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
//
//----------------------------------------------------------------------------

`timescale 1ps / 1ps
// List of instance paths used in the AXI transaction messaging blocks
`define DUT_AXI_PATH     dut_and_data_i.DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst

// Allow hierarchial probing of the design. Use in functional simulation only
`define ENABLE_VERILOG_HIER_PROBES
// `define ENABLE_VERILOG_SM_PROBES

module demo_tb ;

//-----------------------------------------------------------------------------
// declare TB signals
//-----------------------------------------------------------------------------
wire           s_axi_aclk    ; //
wire           s_axi_aresetn ; //
wire           s_axi_tb_aresetn ; //
wire [34:0]    s_axi_awaddr  ; //
wire           s_axi_awvalid ; //
wire           s_axi_awready ; //
wire [31:0]    s_axi_wdata   ; //
wire           s_axi_wvalid  ; //
wire           s_axi_wready  ; //
wire [ 1:0]    s_axi_bresp   ; //
wire           s_axi_bvalid  ; //
wire           s_axi_bready  ; //
wire [34:0]    s_axi_araddr  ; //
wire           s_axi_arvalid ; //
wire           s_axi_arready ; //
wire [31:0]    s_axi_rdata   ; //
wire [ 1:0]    s_axi_rresp   ; //
wire           s_axi_rvalid  ; //
wire           s_axi_rready  ; //
wire           seq_done      ; // Sequencer done flag
wire           dac_sink_error_flag; //
wire           dac_sink_done_flag ; //
wire           adc_sink_error_flag; //
wire           adc_sink_done_flag ; //
wire [3:0]     external_signal_bus; //
wire [7:0]     tile_clock_enable;   //
wire [255:0]   data_samples_in[15:0];
wire           data_samples_req[3:0];
wire  [31:0]   data_samples_out[1023:0];
wire  [31:0]   data_samples_out_q[1023:0];

//-----------------------------------------------------------------------------
// Sequencer to generate AXI control to exdes and textbench
// Refer to demo_tb_axi4l_nano_seq.v to modify the AXI test sequence.
//-----------------------------------------------------------------------------
demo_tb_axi4l_nano_seq sequencer_i (

   .axi_awaddr             (s_axi_awaddr       ) , //
   .axi_awvalid            (s_axi_awvalid      ) , //
   .axi_awready            (s_axi_awready      ) , //
   .axi_wdata              (s_axi_wdata        ) , //
   .axi_wvalid             (s_axi_wvalid       ) , //
   .axi_wready             (s_axi_wready       ) , //
   .axi_bresp              (s_axi_bresp        ) , //
   .axi_bvalid             (s_axi_bvalid       ) , //
   .axi_bready             (s_axi_bready       ) , //
   .axi_araddr             (s_axi_araddr       ) , //
   .axi_arvalid            (s_axi_arvalid      ) , //
   .axi_arready            (s_axi_arready      ) , //
   .axi_rdata              (s_axi_rdata        ) , //
   .axi_rresp              (s_axi_rresp        ) , //
   .axi_rvalid             (s_axi_rvalid       ) , //
   .axi_rready             (s_axi_rready       ) , //

   .data_samples_in        (data_samples_in),
   .data_samples_req       (data_samples_req),
   .data_samples_out       (data_samples_out),
   .data_samples_out_q     (data_samples_out_q),

   .clk                    (s_axi_aclk         ) , //
   .reset                  (1'd0               ) , //
   .axi_message_enable     (axi_message_enable ),
   .external_signal_bus    (external_signal_bus) , //
   .tile_clock_enable      (tile_clock_enable  ) , //
   .rising_stop_trigger    (seq_done           ) , //
   .axi_aresetn            (                   ) , //
   .int_axi_aresetn        (s_axi_aresetn      ) , //
   .int_tb_aresetn         (s_axi_tb_aresetn   ) , //
   .seq_done               (seq_done           )   //
);

assign external_signal_bus[0] = dac_sink_error_flag;
assign external_signal_bus[1] = adc_sink_error_flag;
assign external_signal_bus[2] = dac_sink_done_flag;
assign external_signal_bus[3] = adc_sink_done_flag;

//-----------------------------------------------------------------------------
// This block contains the DUT and the real number sink/sources for the AMS IP.
//-----------------------------------------------------------------------------
demo_tb_dut_checker dut_and_data_i (

   .s_axi_awaddr           (s_axi_awaddr      ) , //
   .s_axi_awvalid          (s_axi_awvalid     ) , //
   .s_axi_awready          (s_axi_awready     ) , //
   .s_axi_wdata            (s_axi_wdata       ) , //
   .s_axi_wstrb            (4'hf              ) , //
   .s_axi_wvalid           (s_axi_wvalid      ) , //
   .s_axi_wready           (s_axi_wready      ) , //
   .s_axi_bresp            (s_axi_bresp       ) , //
   .s_axi_bvalid           (s_axi_bvalid      ) , //
   .s_axi_bready           (s_axi_bready      ) , //
   .s_axi_araddr           (s_axi_araddr      ) , //
   .s_axi_arvalid          (s_axi_arvalid     ) , //
   .s_axi_arready          (s_axi_arready     ) , //
   .s_axi_rdata            (s_axi_rdata       ) , //
   .s_axi_rresp            (s_axi_rresp       ) , //
   .s_axi_rvalid           (s_axi_rvalid      ) , //
   .s_axi_rready           (s_axi_rready      ) , //

   .tile_clock_enable      (tile_clock_enable ) , //
   .clock_enable_reg       (),

   .dac_sink_error_flag    (dac_sink_error_flag),
   .dac_sink_done_flag     (dac_sink_done_flag ),
   .adc_sink_error_flag    (adc_sink_error_flag),
   .adc_sink_done_flag     (adc_sink_done_flag ),
   .data_samples_out       (data_samples_in),
   .data_samples_req       (data_samples_req),
   .data_samples_in        (data_samples_out),
   .data_samples_in_q      (data_samples_out_q),

   .s_axi_aclk             (s_axi_aclk        ) , //
   .s_axi_aresetn          (s_axi_aresetn     ) , //
   .s_axi_tb_aresetn       (s_axi_tb_aresetn  )   //
);

//-----------------------------------------------------------------------------
// Decodes AXI transaction to the IP and "pretty" prints message to the screen
//-----------------------------------------------------------------------------
`ifdef ENABLE_VERILOG_HIER_PROBES
demo_tb_axi_transaction_decode_hsams transaction_decode_i (
   .s_axi_aclk             ( `DUT_AXI_PATH.s_axi_aclk           ),
   .s_axi_aresetn          ( `DUT_AXI_PATH.s_axi_aresetn        ),
   .enable                 (  axi_message_enable                ),
   .s_axi_awaddr           ( {14'd0,`DUT_AXI_PATH.s_axi_awaddr} ),
   .s_axi_awvalid          ( `DUT_AXI_PATH.s_axi_awvalid        ),
   .s_axi_awready          ( `DUT_AXI_PATH.s_axi_awready        ),
   .s_axi_wdata            ( `DUT_AXI_PATH.s_axi_wdata          ),
   .s_axi_wvalid           ( `DUT_AXI_PATH.s_axi_wvalid         ),
   .s_axi_wready           ( `DUT_AXI_PATH.s_axi_wready         ),
   .s_axi_bresp            ( `DUT_AXI_PATH.s_axi_bresp          ),
   .s_axi_bvalid           ( `DUT_AXI_PATH.s_axi_bvalid         ),
   .s_axi_bready           ( `DUT_AXI_PATH.s_axi_bready         ),
   .s_axi_araddr           ( {14'd0,`DUT_AXI_PATH.s_axi_araddr} ),
   .s_axi_arvalid          ( `DUT_AXI_PATH.s_axi_arvalid        ),
   .s_axi_arready          ( `DUT_AXI_PATH.s_axi_arready        ),
   .s_axi_rdata            ( `DUT_AXI_PATH.s_axi_rdata          ),
   .s_axi_rresp            ( `DUT_AXI_PATH.s_axi_rresp          ),
   .s_axi_rvalid           ( `DUT_AXI_PATH.s_axi_rvalid         ),
   .s_axi_rready           ( `DUT_AXI_PATH.s_axi_rready         )
);
`endif

//-----------------------------------------------------------------------------
// Interface signal range measurement
//-----------------------------------------------------------------------------
demo_tb_signal_ranges sig_range_stats (

   .seq_done_adc           (adc_sink_done_flag),
   .seq_done_dac           (dac_sink_done_flag)

);

//-----------------------------------------------------------------------------
// RFAMS Analog Real pins for easy reference
//-----------------------------------------------------------------------------
`ifndef DO_NOT_USE_RFAMS_REAL_SIGNAL_FORCE

// DAC
real dac00_p;
real dac00_n;
real dac01_p;
real dac01_n;
real dac02_p;
real dac02_n;
real dac03_p;
real dac03_n;

always @ (*) begin
   // Map the DAC signals to the top level
   dac00_p = dut_and_data_i.DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.tx0_u_dac.generate_block1.SIP_RFDAC_INST.VOUT0_P;
   dac00_n = dut_and_data_i.DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.tx0_u_dac.generate_block1.SIP_RFDAC_INST.VOUT0_N;
   sig_range_stats.dac00_a.sig_p = dac00_p;
   sig_range_stats.dac00_a.sig_n = dac00_n;
   dac01_p = dut_and_data_i.DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.tx0_u_dac.generate_block1.SIP_RFDAC_INST.VOUT1_P;
   dac01_n = dut_and_data_i.DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.tx0_u_dac.generate_block1.SIP_RFDAC_INST.VOUT1_N;
   sig_range_stats.dac01_a.sig_p = dac01_p;
   sig_range_stats.dac01_a.sig_n = dac01_n;
   dac02_p = dut_and_data_i.DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.tx0_u_dac.generate_block1.SIP_RFDAC_INST.VOUT2_P;
   dac02_n = dut_and_data_i.DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.tx0_u_dac.generate_block1.SIP_RFDAC_INST.VOUT2_N;
   sig_range_stats.dac02_a.sig_p = dac02_p;
   sig_range_stats.dac02_a.sig_n = dac02_n;
   dac03_p = dut_and_data_i.DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.tx0_u_dac.generate_block1.SIP_RFDAC_INST.VOUT3_P;
   dac03_n = dut_and_data_i.DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.tx0_u_dac.generate_block1.SIP_RFDAC_INST.VOUT3_N;
   sig_range_stats.dac03_a.sig_p = dac03_p;
   sig_range_stats.dac03_a.sig_n = dac03_n;
end
`endif

//-----------------------------------------------------------------------------
// Probe data interfaces for EOU
//-----------------------------------------------------------------------------
`ifdef ENABLE_VERILOG_HIER_PROBES
// ADC - 
// DAC - 00 01 02 03
reg [255:0] dac00_axis_tdata ; //
reg         dac00_axis_tvalid; //
reg         dac00_axis_tready; //

reg [255:0] dac01_axis_tdata ; //
reg         dac01_axis_tvalid; //
reg         dac01_axis_tready; //

reg [255:0] dac02_axis_tdata ; //
reg         dac02_axis_tvalid; //
reg         dac02_axis_tready; //

reg [255:0] dac03_axis_tdata ; //
reg         dac03_axis_tvalid; //
reg         dac03_axis_tready; //

always @ (*) begin
   dac00_axis_tdata  = dut_and_data_i.DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.s00_axis_tdata;
   dac00_axis_tvalid = dut_and_data_i.DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.s00_axis_tvalid;
   dac00_axis_tready = dut_and_data_i.DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.s00_axis_tready;
   sig_range_stats.dac00_x.sig_axis_tdata = dac00_axis_tdata;
   sig_range_stats.dac00_x.sig_axis_valid = dac00_axis_tvalid & dac00_axis_tready;
   dac01_axis_tdata  = dut_and_data_i.DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.s01_axis_tdata;
   dac01_axis_tvalid = dut_and_data_i.DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.s01_axis_tvalid;
   dac01_axis_tready = dut_and_data_i.DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.s01_axis_tready;
   sig_range_stats.dac01_x.sig_axis_tdata = dac01_axis_tdata;
   sig_range_stats.dac01_x.sig_axis_valid = dac01_axis_tvalid & dac01_axis_tready;
   dac02_axis_tdata  = dut_and_data_i.DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.s02_axis_tdata;
   dac02_axis_tvalid = dut_and_data_i.DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.s02_axis_tvalid;
   dac02_axis_tready = dut_and_data_i.DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.s02_axis_tready;
   sig_range_stats.dac02_x.sig_axis_tdata = dac02_axis_tdata;
   sig_range_stats.dac02_x.sig_axis_valid = dac02_axis_tvalid & dac02_axis_tready;
   dac03_axis_tdata  = dut_and_data_i.DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.s03_axis_tdata;
   dac03_axis_tvalid = dut_and_data_i.DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.s03_axis_tvalid;
   dac03_axis_tready = dut_and_data_i.DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.s03_axis_tready;
   sig_range_stats.dac03_x.sig_axis_tdata = dac03_axis_tdata;
   sig_range_stats.dac03_x.sig_axis_valid = dac03_axis_tvalid & dac03_axis_tready;
end
`endif

endmodule

//-----------------------------------------------------------------------------
// Module to report signal ranges
//-----------------------------------------------------------------------------
module demo_tb_signal_ranges #(
   parameter p_data_width = 16
) (
   input wire seq_done_adc,
   input wire seq_done_dac
);

//-----------------------------------------------------------------------------
// Probe analog interfaces for EOU
//-----------------------------------------------------------------------------
// DAC - 00 01 02 03
dtb_sig_range_analog #(.p_id("       ----->> DAC00"),.p_code_w(14)) dac00_a (.seq_done(seq_done_dac), .enable_toggle_time(1'd1));
dtb_sig_range_analog #(.p_id("       ----->> DAC01"),.p_code_w(14)) dac01_a (.seq_done(seq_done_dac), .enable_toggle_time(1'd1));
dtb_sig_range_analog #(.p_id("       ----->> DAC02"),.p_code_w(14)) dac02_a (.seq_done(seq_done_dac), .enable_toggle_time(1'd1));
dtb_sig_range_analog #(.p_id("       ----->> DAC03"),.p_code_w(14)) dac03_a (.seq_done(seq_done_dac), .enable_toggle_time(1'd1));

//-----------------------------------------------------------------------------
// Probe data interfaces for EOU
//-----------------------------------------------------------------------------
dtb_sig_range_axis   #(.p_id("       ----->> DAC00"))  dac00_x (.seq_done(seq_done_dac), .enable_toggle_time(1'd0));
dtb_sig_range_axis   #(.p_id("       ----->> DAC01"))  dac01_x (.seq_done(seq_done_dac), .enable_toggle_time(1'd0));
dtb_sig_range_axis   #(.p_id("       ----->> DAC02"))  dac02_x (.seq_done(seq_done_dac), .enable_toggle_time(1'd0));
dtb_sig_range_axis   #(.p_id("       ----->> DAC03"))  dac03_x (.seq_done(seq_done_dac), .enable_toggle_time(1'd0));

endmodule

//-----------------------------------------------------------------------------
// Module to report AXI Stream code range
//-----------------------------------------------------------------------------
module dtb_sig_range_axis #(
   parameter p_data_width = 16,
   parameter p_id = ""
) (
   input wire seq_done,
   input wire enable_toggle_time
);

reg     [255:0] sig_axis_tdata ; //
reg             sig_axis_valid; //

integer         transitions = 0; //
integer         sig_axis_tdata_maxval = 0; //
integer         sig_axis_tdata_minval = (2**31)-1; //
integer         sig_axis_tdata_sign_extended; //
integer         sig_axis_tdata_made_positive; //

localparam p_transition_limit = 20;

always @ (sig_axis_tdata) begin
   if (sig_axis_valid & enable_toggle_time)
      transitions = transitions + 'd1;
end

`ifdef QUESTA_REPORT_UTC_TIME
always @ (posedge (transitions == p_transition_limit)) begin
   $write("%s AXI-Stream started @", p_id);
   $system("date -u +%Y%m%d_%H%M%S");
end
`endif

always @ (*) begin

   // Perform a "cast" from the 16 bit net to an integer to get +-values for GT/LT comparrisons.
   sig_axis_tdata_sign_extended = {{32 - p_data_width{sig_axis_tdata[p_data_width-1]}},(sig_axis_tdata[p_data_width-1:0])};

end

always @ (*) begin

   // Then make +ve by adding the half the bit range
   sig_axis_tdata_made_positive = sig_axis_tdata_sign_extended + (2**(p_data_width - 1));

end

always @ (*) begin

   if (sig_axis_valid) begin
      if ((sig_axis_tdata_made_positive > sig_axis_tdata_maxval) ) begin
         #1 sig_axis_tdata_maxval = sig_axis_tdata_made_positive;
      end
   end

end

always @ (*) begin

   if (sig_axis_valid) begin
      if ((sig_axis_tdata_made_positive < sig_axis_tdata_minval) ) begin
         #1 sig_axis_tdata_minval = sig_axis_tdata_made_positive;
      end
   end

end

always @(posedge seq_done)
   $display("%s AXI-Stream range = %d", p_id, sig_axis_tdata_maxval - sig_axis_tdata_minval);

endmodule

//-----------------------------------------------------------------------------
// Module to calculate analog signal code range
//-----------------------------------------------------------------------------
module dtb_sig_range_analog #(
   parameter p_code_w     = 16,
   parameter p_max_r      = 1.12/2,
   parameter p_id         = "",
   parameter p_tcount_max = 20
) (
   input wire seq_done,
   input wire enable_toggle_time
);

localparam plsb_value = p_max_r/(2**p_code_w);

//-----------------------------------------------------------------------------
// Mechanism for displaying ranges on the DAC
//-----------------------------------------------------------------------------
// DAC
real sig_p;
real sig_n;
real sig_p_maxval=0;
real sig_p_minval=1;
real range;
real codes;

integer transition_count = 0;

always @ (*) begin

   if (transition_count > p_tcount_max) begin
      if ((sig_p > sig_p_maxval) ) begin
         #1 sig_p_maxval = sig_p;
      end

       if(sig_p == 0)
         sig_p_minval = 1;
       else
         if ((sig_p < sig_p_minval) ) begin
            #1 sig_p_minval = sig_p;
         end // else do nothing
   end

   transition_count = transition_count + 1;

end

`ifdef QUESTA_REPORT_UTC_TIME
always @ (posedge ((transition_count == p_tcount_max) & enable_toggle_time)) begin
   $write("%s Analog REAL started @", p_id);
   $system("date -u +%Y%m%d_%H%M%S");
end
`endif

always @(posedge seq_done) begin
   range = sig_p_maxval - sig_p_minval;
   codes = range/plsb_value;
   $display("%s Analog range = %.3f @%dbit = %.1f codes (%.1f%%)", p_id, range, p_code_w, codes, 100*codes/(2**p_code_w));
   end

endmodule

//-----------------------------------------------------------------------------
// Wrapper for the clock block. Allows direct USE in IPI with correct
// frequencies. Note Clocks are generated from multiples of the sample rate in
// ps for correct operation in the simulator. The IPI clock frequencies are
// generated his the High and Low phases in PS.
//-----------------------------------------------------------------------------
module demo_tb_clk_gen_wrap #( parameter axi_reset_cycles   = 100 )(

  input  wire [7:0]     tile_clock_enable,

  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 dac0_axis_aclk CLK" *)
  (* X_INTERFACE_PARAMETER = "FREQ_HZ 400000000" *)
  output wire           dac0_axis_aclk      ,
  output wire           dac0_clk_p          ,

  // AXI-Lite Control/Status
   (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 axi_resetn RST" *)
   (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW" *)
  output wire           axi_resetn ,
   (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 axi_reset  RST" *)
   (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_HIGH" *)
  output wire           axi_reset  ,
  output wire           s_axi_aclk

) ;

//-----------------------------------------------------------------------------
// Clock generator block
// This is wrapped with the port settings fixed so this block can be used
// directly in IPI
//-----------------------------------------------------------------------------
demo_tb_clk_gen # ( .axi_reset_cycles (axi_reset_cycles) ) clocks_i(

   .axi_clk_phase         ({16'd5000, 16'd5000} ), // AXI CLK 100.0MHz
   .pl_clk_phase          ({16'd5000, 16'd5000} ), // PL CLK 100.0MHz
   .clkdac_0_fab_freq     (64'd400000),
   .clkdac_0_ref_freq     (64'd6400000),
   .clkdac_0_enable       (tile_clock_enable[0] ), //


   .clkdac_0_fab          (dac0_axis_aclk       ),
   .clkdac_0_ref          (dac0_clk_p           ),
   .axi_resetn             (axi_resetn ), //
   .axi_reset              (axi_reset  ), //
   .pl_clk_p               (),
   .clk_axi                (s_axi_aclk )  //

);

endmodule

//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// This testbench layer wraps the real data generation/checking with the DUT
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
module demo_tb_dut_checker(

  // AXI-Lite clock/reset
  output wire           s_axi_aclk   ,
  input  wire           s_axi_aresetn,
  input  wire           s_axi_tb_aresetn,

  output wire           dac_sink_error_flag,
  output wire           dac_sink_done_flag ,
  output wire           adc_sink_error_flag,
  output wire           adc_sink_done_flag ,

  input  wire [7:0]     tile_clock_enable,
  output wire [15:0]    clock_enable_reg,
  output wire [255:0]   data_samples_out[15:0],
  output wire [255:0]   data_samples_out_q[15:0],
  input  wire           data_samples_req[3:0],
  input  wire  [31:0]   data_samples_in[1023:0],
  input  wire  [31:0]   data_samples_in_q[1023:0],

  // AXI-Lite Control/Status
  input  wire [34:0]    s_axi_awaddr ,
  input  wire           s_axi_awvalid,
  output wire           s_axi_awready,
  input  wire [31:0]    s_axi_wdata  ,
  input  wire  [3:0]    s_axi_wstrb  ,
  input  wire           s_axi_wvalid ,
  output wire           s_axi_wready ,
  output wire  [1:0]    s_axi_bresp  ,
  output wire           s_axi_bvalid ,
  input  wire           s_axi_bready ,
  input  wire [34:0]    s_axi_araddr ,
  input  wire           s_axi_arvalid,
  output wire           s_axi_arready,
  output wire [31:0]    s_axi_rdata  ,
  output wire  [1:0]    s_axi_rresp  ,
  output wire           s_axi_rvalid ,
  input  wire           s_axi_rready

) ;

//-----------------------------------------------------------------------------
// Wires for ADC sample generation High[31:16]/Low[15:0] phase
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// Clock declarations
//-----------------------------------------------------------------------------
wire         dac0_clk_p    ; //
wire         dac0_axis_aclk; //

//-----------------------------------------------------------------------------
// Declare AXI decoder wires
//-----------------------------------------------------------------------------
// AXI M 0
wire [31:0]  m_exdes_axi_awaddr  ; //
wire         m_exdes_axi_awvalid ; //
wire         m_exdes_axi_awready ; //
wire [31:0]  m_exdes_axi_wdata   ; //
wire  [3:0]  m_exdes_axi_wstrb   ; //
wire         m_exdes_axi_wvalid  ; //
wire         m_exdes_axi_wready  ; //
wire  [1:0]  m_exdes_axi_bresp   ; //
wire         m_exdes_axi_bvalid  ; //
wire         m_exdes_axi_bready  ; //
wire [31:0]  m_exdes_axi_araddr  ; //
wire         m_exdes_axi_arvalid ; //
wire         m_exdes_axi_arready ; //
wire [31:0]  m_exdes_axi_rdata   ; //
wire  [1:0]  m_exdes_axi_rresp   ; //
wire         m_exdes_axi_rvalid  ; //
wire         m_exdes_axi_rready  ; //

// AXI M 1
wire [19:0]  m_tbsrc_axi_awaddr  ; //
wire         m_tbsrc_axi_awvalid ; //
wire         m_tbsrc_axi_awready ; //
wire [31:0]  m_tbsrc_axi_wdata   ; //
wire  [3:0]  m_tbsrc_axi_wstrb   ; //
wire         m_tbsrc_axi_wvalid  ; //
wire         m_tbsrc_axi_wready  ; //
wire  [1:0]  m_tbsrc_axi_bresp   ; //
wire         m_tbsrc_axi_bvalid  ; //
wire         m_tbsrc_axi_bready  ; //
wire [19:0]  m_tbsrc_axi_araddr  ; //
wire         m_tbsrc_axi_arvalid ; //
wire         m_tbsrc_axi_arready ; //
wire [31:0]  m_tbsrc_axi_rdata   ; //
wire  [1:0]  m_tbsrc_axi_rresp   ; //
wire         m_tbsrc_axi_rvalid  ; //
wire         m_tbsrc_axi_rready  ; //

// AXI M 2
wire [19:0]  m_tbsnk_axi_awaddr  ; //
wire         m_tbsnk_axi_awvalid ; //
wire         m_tbsnk_axi_awready ; //
wire [31:0]  m_tbsnk_axi_wdata   ; //
wire  [3:0]  m_tbsnk_axi_wstrb   ; //
wire         m_tbsnk_axi_wvalid  ; //
wire         m_tbsnk_axi_wready  ; //
wire  [1:0]  m_tbsnk_axi_bresp   ; //
wire         m_tbsnk_axi_bvalid  ; //
wire         m_tbsnk_axi_bready  ; //
wire [19:0]  m_tbsnk_axi_araddr  ; //
wire         m_tbsnk_axi_arvalid ; //
wire         m_tbsnk_axi_arready ; //
wire [31:0]  m_tbsnk_axi_rdata   ; //
wire  [1:0]  m_tbsnk_axi_rresp   ; //
wire         m_tbsnk_axi_rvalid  ; //
wire         m_tbsnk_axi_rready  ; //

// AXI M 3
wire [19:0]  m_tbgen_axi_awaddr  ; //
wire         m_tbgen_axi_awvalid ; //
wire         m_tbgen_axi_awready ; //
wire [31:0]  m_tbgen_axi_wdata   ; //
wire  [3:0]  m_tbgen_axi_wstrb   ; //
wire         m_tbgen_axi_wvalid  ; //
wire         m_tbgen_axi_wready  ; //
wire  [1:0]  m_tbgen_axi_bresp   ; //
wire         m_tbgen_axi_bvalid  ; //
wire         m_tbgen_axi_bready  ; //
wire [19:0]  m_tbgen_axi_araddr  ; //
wire         m_tbgen_axi_arvalid ; //
wire         m_tbgen_axi_arready ; //
wire [31:0]  m_tbgen_axi_rdata   ; //
wire  [1:0]  m_tbgen_axi_rresp   ; //
wire         m_tbgen_axi_rvalid  ; //
wire         m_tbgen_axi_rready  ; //

// AXI M 4
wire [19:0]  m_tbcap_axi_awaddr  ; //
wire         m_tbcap_axi_awvalid ; //
wire         m_tbcap_axi_awready ; //
wire [31:0]  m_tbcap_axi_wdata   ; //
wire  [3:0]  m_tbcap_axi_wstrb   ; //
wire         m_tbcap_axi_wvalid  ; //
wire         m_tbcap_axi_wready  ; //
wire  [1:0]  m_tbcap_axi_bresp   ; //
wire         m_tbcap_axi_bvalid  ; //
wire         m_tbcap_axi_bready  ; //
wire [19:0]  m_tbcap_axi_araddr  ; //
wire         m_tbcap_axi_arvalid ; //
wire         m_tbcap_axi_arready ; //
wire [31:0]  m_tbcap_axi_rdata   ; //
wire  [1:0]  m_tbcap_axi_rresp   ; //
wire         m_tbcap_axi_rvalid  ; //
wire         m_tbcap_axi_rready  ; //
wire [31:0]  s_axi_rdata_i;
reg   [9:0]  sample_addr = 0;

//-----------------------------------------------------------------------------
// Clock generator wrapper block, improved IPI EOU
//-----------------------------------------------------------------------------
demo_tb_clk_gen_wrap clocks_w_i(

   .dac0_axis_aclk         (dac0_axis_aclk      ), // clkdac_0_fab
   .dac0_clk_p             (dac0_clk_p          ), // clkdac_0_ref

   .tile_clock_enable      (tile_clock_enable   ),
   .axi_resetn             (),
   .axi_reset              (),
   .s_axi_aclk             (s_axi_aclk          )  //

);


//-----------------------------------------------------------------------------
// RFAMS Example Design
//-----------------------------------------------------------------------------
usp_rf_data_converter_0_example_design DUT(
  // External SYSREF input
   .sysref_in_p            (),
   .sysref_in_n            (),
   .dac0_clk_p             (dac0_clk_p       ), // DAC Reference Clock for Tile 0
   .dac0_clk_n             (~dac0_clk_p      ),

   .dac0_axis_aclk         (dac0_axis_aclk   ), // DAC AXI Streaming Clock and Reset for DAC0
   .dac0_axis_aresetn      (1'b1),


   .vout00_p               ( ),
   .vout00_n               ( ),
   .vout01_p               ( ),
   .vout01_n               ( ),
   .vout02_p               ( ),
   .vout02_n               ( ),
   .vout03_p               ( ),
   .vout03_n               ( ),

   .s_axi_aclk             (s_axi_aclk              ), //
   .s_axi_aresetn          (s_axi_aresetn           ), //
   .s_axi_awaddr           (m_exdes_axi_awaddr[23:0]), //
   .s_axi_awvalid          (m_exdes_axi_awvalid     ), //
   .s_axi_awready          (m_exdes_axi_awready     ), //
   .s_axi_wdata            (m_exdes_axi_wdata[31:0] ), //
   .s_axi_wvalid           (m_exdes_axi_wvalid      ), //
   .s_axi_wready           (m_exdes_axi_wready      ), //
   .s_axi_bresp            (m_exdes_axi_bresp       ), //
   .s_axi_bvalid           (m_exdes_axi_bvalid      ), //
   .s_axi_bready           (m_exdes_axi_bready      ), //
   .s_axi_araddr           (m_exdes_axi_araddr[23:0]), //
   .s_axi_arvalid          (m_exdes_axi_arvalid     ), //
   .s_axi_arready          (m_exdes_axi_arready     ), //
   .s_axi_rdata            (s_axi_rdata_i           ), //
   .s_axi_rresp            (m_exdes_axi_rresp       ), //
   .s_axi_rvalid           (m_exdes_axi_rvalid      ), //
   .s_axi_rready           (m_exdes_axi_rready      ), //

   .irq                    ()
);
  assign m_exdes_axi_rdata = s_axi_rdata_i[31:0];       // Full width data bus

//-----------------------------------------------------------------------------
// Decoder for the AXI4 bus. The REAL source/sink blocks also have processor
// interfaces for configuration
//-----------------------------------------------------------------------------
demo_tb_axi4l_decode #(.loweraddrwidth_i(32),
                       .strobewidth(5))
  axi4l_decoder_tb_i (

   // AXI M 0
   .m0_axi_awaddr          (m_exdes_axi_awaddr  ), //
   .m0_axi_awvalid         (m_exdes_axi_awvalid ), //
   .m0_axi_awready         (m_exdes_axi_awready ), //
   .m0_axi_wdata           (m_exdes_axi_wdata   ), //
   .m0_axi_wstrb           (m_exdes_axi_wstrb   ), //
   .m0_axi_wvalid          (m_exdes_axi_wvalid  ), //
   .m0_axi_wready          (m_exdes_axi_wready  ), //
   .m0_axi_bresp           (m_exdes_axi_bresp   ), //
   .m0_axi_bvalid          (m_exdes_axi_bvalid  ), //
   .m0_axi_bready          (m_exdes_axi_bready  ), //
   .m0_axi_araddr          (m_exdes_axi_araddr  ), //
   .m0_axi_arvalid         (m_exdes_axi_arvalid ), //
   .m0_axi_arready         (m_exdes_axi_arready ), //
   .m0_axi_rdata           (m_exdes_axi_rdata   ), //
   .m0_axi_rresp           (m_exdes_axi_rresp   ), //
   .m0_axi_rvalid          (m_exdes_axi_rvalid  ), //
   .m0_axi_rready          (m_exdes_axi_rready  ), //

   // AXI M 1
   .m1_axi_awaddr          (m_tbsrc_axi_awaddr  ), //
   .m1_axi_awvalid         (m_tbsrc_axi_awvalid ), //
   .m1_axi_awready         (m_tbsrc_axi_awready ), //
   .m1_axi_wdata           (m_tbsrc_axi_wdata   ), //
   .m1_axi_wstrb           (m_tbsrc_axi_wstrb   ), //
   .m1_axi_wvalid          (m_tbsrc_axi_wvalid  ), //
   .m1_axi_wready          (m_tbsrc_axi_wready  ), //
   .m1_axi_bresp           (m_tbsrc_axi_bresp   ), //
   .m1_axi_bvalid          (m_tbsrc_axi_bvalid  ), //
   .m1_axi_bready          (m_tbsrc_axi_bready  ), //
   .m1_axi_araddr          (m_tbsrc_axi_araddr  ), //
   .m1_axi_arvalid         (m_tbsrc_axi_arvalid ), //
   .m1_axi_arready         (m_tbsrc_axi_arready ), //
   .m1_axi_rdata           (m_tbsrc_axi_rdata   ), //
   .m1_axi_rresp           (m_tbsrc_axi_rresp   ), //
   .m1_axi_rvalid          (m_tbsrc_axi_rvalid  ), //
   .m1_axi_rready          (m_tbsrc_axi_rready  ), //

   // AXI M 2
   .m2_axi_awaddr          (m_tbsnk_axi_awaddr  ), //
   .m2_axi_awvalid         (m_tbsnk_axi_awvalid ), //
   .m2_axi_awready         (m_tbsnk_axi_awready ), //
   .m2_axi_wdata           (m_tbsnk_axi_wdata   ), //
   .m2_axi_wstrb           (m_tbsnk_axi_wstrb   ), //
   .m2_axi_wvalid          (m_tbsnk_axi_wvalid  ), //
   .m2_axi_wready          (m_tbsnk_axi_wready  ), //
   .m2_axi_bresp           (m_tbsnk_axi_bresp   ), //
   .m2_axi_bvalid          (m_tbsnk_axi_bvalid  ), //
   .m2_axi_bready          (m_tbsnk_axi_bready  ), //
   .m2_axi_araddr          (m_tbsnk_axi_araddr  ), //
   .m2_axi_arvalid         (m_tbsnk_axi_arvalid ), //
   .m2_axi_arready         (m_tbsnk_axi_arready ), //
   .m2_axi_rdata           (m_tbsnk_axi_rdata   ), //
   .m2_axi_rresp           (m_tbsnk_axi_rresp   ), //
   .m2_axi_rvalid          (m_tbsnk_axi_rvalid  ), //
   .m2_axi_rready          (m_tbsnk_axi_rready  ), //

    // AXI M 3
   .m3_axi_awaddr          (m_tbgen_axi_awaddr  ), //
   .m3_axi_awvalid         (m_tbgen_axi_awvalid ), //
   .m3_axi_awready         (m_tbgen_axi_awready ), //
   .m3_axi_wdata           (m_tbgen_axi_wdata   ), //
   .m3_axi_wstrb           (m_tbgen_axi_wstrb   ), //
   .m3_axi_wvalid          (m_tbgen_axi_wvalid  ), //
   .m3_axi_wready          (m_tbgen_axi_wready  ), //
   .m3_axi_bresp           (m_tbgen_axi_bresp   ), //
   .m3_axi_bvalid          (m_tbgen_axi_bvalid  ), //
   .m3_axi_bready          (m_tbgen_axi_bready  ), //
   .m3_axi_araddr          (m_tbgen_axi_araddr  ), //
   .m3_axi_arvalid         (m_tbgen_axi_arvalid ), //
   .m3_axi_arready         (m_tbgen_axi_arready ), //
   .m3_axi_rdata           (m_tbgen_axi_rdata   ), //
   .m3_axi_rresp           (m_tbgen_axi_rresp   ), //
   .m3_axi_rvalid          (m_tbgen_axi_rvalid  ), //
   .m3_axi_rready          (m_tbgen_axi_rready  ), //

   // AXI M 4
   .m4_axi_awaddr          (m_tbcap_axi_awaddr  ), //
   .m4_axi_awvalid         (m_tbcap_axi_awvalid ), //
   .m4_axi_awready         (m_tbcap_axi_awready ), //
   .m4_axi_wdata           (m_tbcap_axi_wdata   ), //
   .m4_axi_wstrb           (m_tbcap_axi_wstrb   ), //
   .m4_axi_wvalid          (m_tbcap_axi_wvalid  ), //
   .m4_axi_wready          (m_tbcap_axi_wready  ), //
   .m4_axi_bresp           (m_tbcap_axi_bresp   ), //
   .m4_axi_bvalid          (m_tbcap_axi_bvalid  ), //
   .m4_axi_bready          (m_tbcap_axi_bready  ), //
   .m4_axi_araddr          (m_tbcap_axi_araddr  ), //
   .m4_axi_arvalid         (m_tbcap_axi_arvalid ), //
   .m4_axi_arready         (m_tbcap_axi_arready ), //
   .m4_axi_rdata           (m_tbcap_axi_rdata   ), //
   .m4_axi_rresp           (m_tbcap_axi_rresp   ), //
   .m4_axi_rvalid          (m_tbcap_axi_rvalid  ), //
   .m4_axi_rready          (m_tbcap_axi_rready  ), //

   // AXI-Lite Interface
   .s_axi_awaddr           (s_axi_awaddr  ), //
   .s_axi_awvalid          (s_axi_awvalid ), //
   .s_axi_awready          (s_axi_awready ), //
   .s_axi_wdata            (s_axi_wdata   ), //
   .s_axi_wstrb            (4'hF          ), //
   .s_axi_wvalid           (s_axi_wvalid  ), //
   .s_axi_wready           (s_axi_wready  ), //
   .s_axi_bresp            (s_axi_bresp   ), //
   .s_axi_bvalid           (s_axi_bvalid  ), //
   .s_axi_bready           (s_axi_bready  ), //
   .s_axi_araddr           (s_axi_araddr  ), //
   .s_axi_arvalid          (s_axi_arvalid ), //
   .s_axi_arready          (s_axi_arready ), //
   .s_axi_rdata            (s_axi_rdata   ), //
   .s_axi_rresp            (s_axi_rresp   ), //
   .s_axi_rvalid           (s_axi_rvalid  ), //
   .s_axi_rready           (s_axi_rready  ),  //

   .clk                    (s_axi_aclk    ) ,
   .s_axi_aresetn          (s_axi_tb_aresetn )

);

//-----------------------------------------------------------------------------
// Demo testbench real data source, with processor configuration interface.
// Forces are used to apply real data from the DAC onto these pins
//-----------------------------------------------------------------------------
demo_tb_rfdac_data_sink dac_sink(

   .s_axi_awaddr           (m_tbsnk_axi_awaddr[17:0]), //
   .s_axi_awvalid          (m_tbsnk_axi_awvalid), //
   .s_axi_awready          (m_tbsnk_axi_awready), //
   .s_axi_wdata            (m_tbsnk_axi_wdata  ), //
   .s_axi_wvalid           (m_tbsnk_axi_wvalid ), //
   .s_axi_wready           (m_tbsnk_axi_wready ), //
   .s_axi_bresp            (m_tbsnk_axi_bresp  ), //
   .s_axi_bvalid           (m_tbsnk_axi_bvalid ), //
   .s_axi_bready           (m_tbsnk_axi_bready ), //
   .s_axi_araddr           (m_tbsnk_axi_araddr[17:0]), //
   .s_axi_arvalid          (m_tbsnk_axi_arvalid), //
   .s_axi_arready          (m_tbsnk_axi_arready), //
   .s_axi_rdata            (m_tbsnk_axi_rdata  ), //
   .s_axi_rresp            (m_tbsnk_axi_rresp  ), //
   .s_axi_rvalid           (m_tbsnk_axi_rvalid ), //
   .s_axi_rready           (m_tbsnk_axi_rready ),  //

   .vin_00_p               ( ),
   .vin_00_n               ( ),
   .vin_01_p               ( ),
   .vin_01_n               ( ),
   .vin_02_p               ( ),
   .vin_02_n               ( ),
   .vin_03_p               ( ),
   .vin_03_n               ( ),
   .sample_rate0_clk       (dac0_clk_p  ),
   .fabric_rate0_clk       (dac0_axis_aclk),

   .done_flag              (dac_sink_done_flag ),
   .error_flag             (dac_sink_error_flag),
   .clock_enable_reg       (clock_enable_reg   ),

   // AXI-Lite Clock/Reset
   .s_axi_aclk             (s_axi_aclk         ) ,
   .s_axi_aresetn          (s_axi_tb_aresetn   )

  );

//-----------------------------------------------------------------------------
// Demo testbench real data generation, with processor configuration interface.
// Forces are used to apply real data to the ADC.
//-----------------------------------------------------------------------------

demo_tb_rfadc_data_source adc_source(

   .s_axi_awaddr           (m_tbsrc_axi_awaddr[17:0]), //
   .s_axi_awvalid          (m_tbsrc_axi_awvalid), //
   .s_axi_awready          (m_tbsrc_axi_awready), //
   .s_axi_wdata            (m_tbsrc_axi_wdata  ), //
   .s_axi_wvalid           (m_tbsrc_axi_wvalid ), //
   .s_axi_wready           (m_tbsrc_axi_wready ), //
   .s_axi_bresp            (m_tbsrc_axi_bresp  ), //
   .s_axi_bvalid           (m_tbsrc_axi_bvalid ), //
   .s_axi_bready           (m_tbsrc_axi_bready ), //
   .s_axi_araddr           (m_tbsrc_axi_araddr[17:0]), //
   .s_axi_arvalid          (m_tbsrc_axi_arvalid), //
   .s_axi_arready          (m_tbsrc_axi_arready), //
   .s_axi_rdata            (m_tbsrc_axi_rdata  ), //
   .s_axi_rresp            (m_tbsrc_axi_rresp  ), //
   .s_axi_rvalid           (m_tbsrc_axi_rvalid ), //
   .s_axi_rready           (m_tbsrc_axi_rready ),  //

   // AXI-Lite Clock/Reset
   .s_axi_aclk             (s_axi_aclk         ) ,
   .s_axi_aresetn          (s_axi_tb_aresetn   )

  );

//-----------------------------------------------------------------------------
// Force the analog signals.
//-----------------------------------------------------------------------------
`ifndef DO_NOT_USE_RFAMS_REAL_SIGNAL_FORCE
// Map the walking one to a 32 bit window to allow a covergroup binding
reg  [31:0]     adc_wo_driver_remap=0;
reg  [31:0]     adc_wo_endpoint_remap=0;


// DAC
real dac00_p;
real dac00_n;
real dac01_p;
real dac01_n;
real dac02_p;
real dac02_n;
real dac03_p;
real dac03_n;

always @ (*) begin
   // Map the DAC signals to the top level
   dac00_p = DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.tx0_u_dac.generate_block1.SIP_RFDAC_INST.VOUT0_P;
   dac00_n = DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.tx0_u_dac.generate_block1.SIP_RFDAC_INST.VOUT0_N;
   dac01_p = DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.tx0_u_dac.generate_block1.SIP_RFDAC_INST.VOUT1_P;
   dac01_n = DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.tx0_u_dac.generate_block1.SIP_RFDAC_INST.VOUT1_N;
   dac02_p = DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.tx0_u_dac.generate_block1.SIP_RFDAC_INST.VOUT2_P;
   dac02_n = DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.tx0_u_dac.generate_block1.SIP_RFDAC_INST.VOUT2_N;
   dac03_p = DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.tx0_u_dac.generate_block1.SIP_RFDAC_INST.VOUT3_P;
   dac03_n = DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.tx0_u_dac.generate_block1.SIP_RFDAC_INST.VOUT3_N;

   // force the DAC output onto the DAC sink
   force dac_sink.vin_00_p = $realtobits(dac00_p);
   force dac_sink.vin_00_n = $realtobits(dac00_n);
   force dac_sink.vin_01_p = $realtobits(dac01_p);
   force dac_sink.vin_01_n = $realtobits(dac01_n);
   force dac_sink.vin_02_p = $realtobits(dac02_p);
   force dac_sink.vin_02_n = $realtobits(dac02_n);
   force dac_sink.vin_03_p = $realtobits(dac03_p);
   force dac_sink.vin_03_n = $realtobits(dac03_n);

end

initial begin
   force DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.tx0_u_dac.generate_block1.SIP_RFDAC_INST._vterm_tx0 = 3.0;
   force DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.tx0_u_dac.generate_block1.SIP_RFDAC_INST._vterm_tx1 = 3.0;
   force DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.tx0_u_dac.generate_block1.SIP_RFDAC_INST._vterm_tx2 = 3.0;
   force DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.tx0_u_dac.generate_block1.SIP_RFDAC_INST._vterm_tx3 = 3.0;
end
`endif


//-----------------------------------------------------------------------------
// POR SM state probes
//-----------------------------------------------------------------------------
`ifdef ENABLE_VERILOG_SM_PROBES
wire [12:0] dgb_por_sm_dac0;


assign dgb_por_sm_dac0 = {
                           DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.por_state_machine_i.por_fsm_dac0.done,
                           DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.por_state_machine_i.por_fsm_dac0.status,
                           DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.por_state_machine_i.por_fsm_dac0.start_stage,
                           DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.por_state_machine_i.por_fsm_dac0.end_stage
                         };

`endif

//-----------------------------------------------------------------------------
// Probe data interfaces for EOU
//-----------------------------------------------------------------------------
`ifdef ENABLE_VERILOG_HIER_PROBES
// ADC - 
// DAC - 00 01 02 03
reg [255:0] dac00_axis_tdata ; //
reg         dac00_axis_tvalid; //
reg         dac00_axis_tready; //

reg [255:0] dac01_axis_tdata ; //
reg         dac01_axis_tvalid; //
reg         dac01_axis_tready; //

reg [255:0] dac02_axis_tdata ; //
reg         dac02_axis_tvalid; //
reg         dac02_axis_tready; //

reg [255:0] dac03_axis_tdata ; //
reg         dac03_axis_tvalid; //
reg         dac03_axis_tready; //

always @ (*) begin
   dac00_axis_tdata  = DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.s00_axis_tdata;
   dac00_axis_tvalid = DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.s00_axis_tvalid;
   dac00_axis_tready = DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.s00_axis_tready;
   dac01_axis_tdata  = DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.s01_axis_tdata;
   dac01_axis_tvalid = DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.s01_axis_tvalid;
   dac01_axis_tready = DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.s01_axis_tready;
   dac02_axis_tdata  = DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.s02_axis_tdata;
   dac02_axis_tvalid = DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.s02_axis_tvalid;
   dac02_axis_tready = DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.s02_axis_tready;
   dac03_axis_tdata  = DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.s03_axis_tdata;
   dac03_axis_tvalid = DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.s03_axis_tvalid;
   dac03_axis_tready = DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.s03_axis_tready;
end




//-----------------------------------------------------------------------------
// Monitors for the AMS DRP bus. Force these in the simulator to display.
// Example command for Questa
// force -freeze sim:/demo_tb/dut_and_data_i/hsadc_drp_decode_i/enable 1'h1 0
//-----------------------------------------------------------------------------
rfdac_drp_decode z_dac_drp_decode_0_i (

   .marker      (8'd0),
   .enable      (1'd0),
   .drp_clk     (DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.tx0_u_dac.generate_block1.SIP_RFDAC_INST.DCLK  ),
   .drp_addr    (DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.tx0_u_dac.generate_block1.SIP_RFDAC_INST.DADDR ),
   .drp_we      (DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.tx0_u_dac.generate_block1.SIP_RFDAC_INST.DWE   ),
   .drp_di      (DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.tx0_u_dac.generate_block1.SIP_RFDAC_INST.DI    ),
   .drp_en      (DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.tx0_u_dac.generate_block1.SIP_RFDAC_INST.DEN   ),
   .drp_rdy     (DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.tx0_u_dac.generate_block1.SIP_RFDAC_INST.DRDY  ),
   .drp_do      (DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.tx0_u_dac.generate_block1.SIP_RFDAC_INST.DOUT  )
);

rfdac_drp_decode z_dac_drp_decode_1_i (

   .marker      (8'd1),
   .enable      (1'd0),
   .drp_clk     (DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.tx1_u_dac.generate_block1.SIP_RFDAC_INST.DCLK  ),
   .drp_addr    (DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.tx1_u_dac.generate_block1.SIP_RFDAC_INST.DADDR ),
   .drp_we      (DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.tx1_u_dac.generate_block1.SIP_RFDAC_INST.DWE   ),
   .drp_di      (DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.tx1_u_dac.generate_block1.SIP_RFDAC_INST.DI    ),
   .drp_en      (DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.tx1_u_dac.generate_block1.SIP_RFDAC_INST.DEN   ),
   .drp_rdy     (DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.tx1_u_dac.generate_block1.SIP_RFDAC_INST.DRDY  ),
   .drp_do      (DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.tx1_u_dac.generate_block1.SIP_RFDAC_INST.DOUT  )
);

rfadc_drp_decode z_adc_drp_decode_0_i (

   .marker      (8'd0),
   .enable      (1'd0),
   .drp_clk     (DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.rx0_u_adc.generate_block1.SIP_RFADC_INST.DCLK  ),
   .drp_addr    (DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.rx0_u_adc.generate_block1.SIP_RFADC_INST.DADDR ),
   .drp_we      (DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.rx0_u_adc.generate_block1.SIP_RFADC_INST.DWE   ),
   .drp_di      (DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.rx0_u_adc.generate_block1.SIP_RFADC_INST.DI    ),
   .drp_en      (DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.rx0_u_adc.generate_block1.SIP_RFADC_INST.DEN   ),
   .drp_rdy     (DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.rx0_u_adc.generate_block1.SIP_RFADC_INST.DRDY  ),
   .drp_do      (DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.rx0_u_adc.generate_block1.SIP_RFADC_INST.DOUT  )
);

rfadc_drp_decode z_adc_drp_decode_1_i (

   .marker      (8'd1),
   .enable      (1'd0),
   .drp_clk     (DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.rx1_u_adc.generate_block1.SIP_RFADC_INST.DCLK  ),
   .drp_addr    (DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.rx1_u_adc.generate_block1.SIP_RFADC_INST.DADDR ),
   .drp_we      (DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.rx1_u_adc.generate_block1.SIP_RFADC_INST.DWE   ),
   .drp_di      (DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.rx1_u_adc.generate_block1.SIP_RFADC_INST.DI    ),
   .drp_en      (DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.rx1_u_adc.generate_block1.SIP_RFADC_INST.DEN   ),
   .drp_rdy     (DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.rx1_u_adc.generate_block1.SIP_RFADC_INST.DRDY  ),
   .drp_do      (DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.rx1_u_adc.generate_block1.SIP_RFADC_INST.DOUT  )
);

rfadc_drp_decode z_adc_drp_decode_2_i (

   .marker      (8'd2),
   .enable      (1'd0),
   .drp_clk     (DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.rx2_u_adc.generate_block1.SIP_RFADC_INST.DCLK  ),
   .drp_addr    (DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.rx2_u_adc.generate_block1.SIP_RFADC_INST.DADDR ),
   .drp_we      (DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.rx2_u_adc.generate_block1.SIP_RFADC_INST.DWE   ),
   .drp_di      (DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.rx2_u_adc.generate_block1.SIP_RFADC_INST.DI    ),
   .drp_en      (DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.rx2_u_adc.generate_block1.SIP_RFADC_INST.DEN   ),
   .drp_rdy     (DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.rx2_u_adc.generate_block1.SIP_RFADC_INST.DRDY  ),
   .drp_do      (DUT.usp_rf_data_converter_0_ex_i.usp_rf_data_converter_0.inst.rfdc_ex_usp_rf_data_converter_0_0_rf_wrapper_i.rx2_u_adc.generate_block1.SIP_RFADC_INST.DOUT  )
);

`endif
//-----------------------------------------------------------------------------
// Data source block
//-----------------------------------------------------------------------------
demo_tb_rfdac_data_source #(
   .enable_override          (1'd0)
) dac_source_i (

   // AXI-Lite Interface
   .s_axi_awaddr          (m_tbgen_axi_awaddr[17:0] ), //
   .s_axi_awvalid         (m_tbgen_axi_awvalid), //
   .s_axi_awready         (m_tbgen_axi_awready), //
   .s_axi_wdata           (m_tbgen_axi_wdata  ), //
   .s_axi_wvalid          (m_tbgen_axi_wvalid ), //
   .s_axi_wready          (m_tbgen_axi_wready ), //
   .s_axi_bresp           (m_tbgen_axi_bresp  ), //
   .s_axi_bvalid          (m_tbgen_axi_bvalid ), //
   .s_axi_bready          (m_tbgen_axi_bready ), //
   .s_axi_araddr          (m_tbgen_axi_araddr[17:0] ), //
   .s_axi_arvalid         (m_tbgen_axi_arvalid), //
   .s_axi_arready         (m_tbgen_axi_arready), //
   .s_axi_rdata           (m_tbgen_axi_rdata  ), //
   .s_axi_rresp           (m_tbgen_axi_rresp  ), //
   .s_axi_rvalid          (m_tbgen_axi_rvalid ), //
   .s_axi_rready          (m_tbgen_axi_rready ),  //

   .m00_tdata             (data_samples_out[0][255:0]   ),
   .m00_tvalid            (),
   .m00_tready            (1'b1),

   .m01_tdata             (data_samples_out[1][255:0]   ),
   .m01_tvalid            (),
   .m01_tready            (1'b1),

   .m02_tdata             (data_samples_out[2][255:0]   ),
   .m02_tvalid            (),
   .m02_tready            (1'b1),

   .m03_tdata             (data_samples_out[3][255:0]   ),
   .m03_tvalid            (),
   .m03_tready            (1'b1),

   .m0_axis_clock         (data_samples_req[0]   ), //

  .s_axi_aclk             (s_axi_aclk),
  .s_axi_aresetn          (s_axi_tb_aresetn)
  );

endmodule

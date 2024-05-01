# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
namespace eval ::optrace {
  variable script "c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.runs/synth_1/usp_rf_data_converter_0_example_design.tcl"
  variable category "vivado_synth"
}

# Try to connect to running dispatch if we haven't done so already.
# This code assumes that the Tcl interpreter is not using threads,
# since the ::dispatch::connected variable isn't mutex protected.
if {![info exists ::dispatch::connected]} {
  namespace eval ::dispatch {
    variable connected false
    if {[llength [array get env XILINX_CD_CONNECT_ID]] > 0} {
      set result "true"
      if {[catch {
        if {[lsearch -exact [package names] DispatchTcl] < 0} {
          set result [load librdi_cd_clienttcl[info sharedlibextension]] 
        }
        if {$result eq "false"} {
          puts "WARNING: Could not load dispatch client library"
        }
        set connect_id [ ::dispatch::init_client -mode EXISTING_SERVER ]
        if { $connect_id eq "" } {
          puts "WARNING: Could not initialize dispatch client"
        } else {
          puts "INFO: Dispatch client connection id - $connect_id"
          set connected true
        }
      } catch_res]} {
        puts "WARNING: failed to connect to dispatch server - $catch_res"
      }
    }
  }
}
if {$::dispatch::connected} {
  # Remove the dummy proc if it exists.
  if { [expr {[llength [info procs ::OPTRACE]] > 0}] } {
    rename ::OPTRACE ""
  }
  proc ::OPTRACE { task action {tags {} } } {
    ::vitis_log::op_trace "$task" $action -tags $tags -script $::optrace::script -category $::optrace::category
  }
  # dispatch is generic. We specifically want to attach logging.
  ::vitis_log::connect_client
} else {
  # Add dummy proc if it doesn't exist.
  if { [expr {[llength [info procs ::OPTRACE]] == 0}] } {
    proc ::OPTRACE {{arg1 \"\" } {arg2 \"\"} {arg3 \"\" } {arg4 \"\"} {arg5 \"\" } {arg6 \"\"}} {
        # Do nothing
    }
  }
}

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
OPTRACE "synth_1" START { ROLLUP_AUTO }
set_param chipscope.maxJobs 4
set_msg_config -id {Common 17-41} -limit 10000000
set_msg_config -id {HDL-1065} -limit 10000
OPTRACE "Creating in-memory project" START { }
create_project -in_memory -part xczu67dr-fsve1156-2-i

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.cache/wt [current_project]
set_property parent.project_path c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_FIFO XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part xilinx.com:zcu670:part0:2.0 [current_project]
set_property ip_output_repo c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
OPTRACE "Creating in-memory project" END { }
OPTRACE "Adding files" START { }
add_files c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/imports/data/startup.elf
set_property SCOPED_TO_REF rfdc_ex [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/imports/data/startup.elf]
set_property SCOPED_TO_CELLS microblaze_0 [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/imports/data/startup.elf]
read_verilog -library xil_defaultlib c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/imports/usp_rf_data_converter_0_example_design.v
add_files c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.srcs/sources_1/bd/rfdc_ex/rfdc_ex.bd
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_1/bd_a15e_psr_aclk_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_1/bd_a15e_psr_aclk_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_2/bd_a15e_arinsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_3/bd_a15e_rinsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_4/bd_a15e_awinsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_5/bd_a15e_winsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_6/bd_a15e_binsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_7/bd_a15e_aroutsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_8/bd_a15e_routsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_9/bd_a15e_awoutsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_10/bd_a15e_woutsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_11/bd_a15e_boutsw_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_12/bd_a15e_arni_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_12/bd_a15e_arni_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_13/bd_a15e_rni_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_13/bd_a15e_rni_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_14/bd_a15e_awni_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_14/bd_a15e_awni_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_15/bd_a15e_wni_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_15/bd_a15e_wni_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_16/bd_a15e_bni_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_16/bd_a15e_bni_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_20/bd_a15e_s00a2s_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_21/bd_a15e_sarn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_21/bd_a15e_sarn_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_22/bd_a15e_srn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_22/bd_a15e_srn_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_23/bd_a15e_sawn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_23/bd_a15e_sawn_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_24/bd_a15e_swn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_24/bd_a15e_swn_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_25/bd_a15e_sbn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_25/bd_a15e_sbn_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_29/bd_a15e_s01a2s_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_30/bd_a15e_sarn_1_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_30/bd_a15e_sarn_1_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_31/bd_a15e_srn_1_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_31/bd_a15e_srn_1_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_32/bd_a15e_sawn_1_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_32/bd_a15e_sawn_1_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_33/bd_a15e_swn_1_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_33/bd_a15e_swn_1_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_34/bd_a15e_sbn_1_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_34/bd_a15e_sbn_1_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_35/bd_a15e_m00s2a_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_36/bd_a15e_m00arn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_36/bd_a15e_m00arn_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_37/bd_a15e_m00rn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_37/bd_a15e_m00rn_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_38/bd_a15e_m00awn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_38/bd_a15e_m00awn_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_39/bd_a15e_m00wn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_39/bd_a15e_m00wn_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_40/bd_a15e_m00bn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_40/bd_a15e_m00bn_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_42/bd_a15e_m01s2a_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_43/bd_a15e_m01arn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_43/bd_a15e_m01arn_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_44/bd_a15e_m01rn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_44/bd_a15e_m01rn_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_45/bd_a15e_m01awn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_45/bd_a15e_m01awn_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_46/bd_a15e_m01wn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_46/bd_a15e_m01wn_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_47/bd_a15e_m01bn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_47/bd_a15e_m01bn_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_49/bd_a15e_m02s2a_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_50/bd_a15e_m02arn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_50/bd_a15e_m02arn_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_51/bd_a15e_m02rn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_51/bd_a15e_m02rn_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_52/bd_a15e_m02awn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_52/bd_a15e_m02awn_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_53/bd_a15e_m02wn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_53/bd_a15e_m02wn_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_54/bd_a15e_m02bn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_54/bd_a15e_m02bn_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_56/bd_a15e_m03s2a_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_57/bd_a15e_m03arn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_57/bd_a15e_m03arn_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_58/bd_a15e_m03rn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_58/bd_a15e_m03rn_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_59/bd_a15e_m03awn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_59/bd_a15e_m03awn_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_60/bd_a15e_m03wn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_60/bd_a15e_m03wn_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_61/bd_a15e_m03bn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_61/bd_a15e_m03bn_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_63/bd_a15e_m04s2a_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_64/bd_a15e_m04arn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_64/bd_a15e_m04arn_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_65/bd_a15e_m04rn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_65/bd_a15e_m04rn_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_66/bd_a15e_m04awn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_66/bd_a15e_m04awn_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_67/bd_a15e_m04wn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_67/bd_a15e_m04wn_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_68/bd_a15e_m04bn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_68/bd_a15e_m04bn_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_70/bd_a15e_m05s2a_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_71/bd_a15e_m05arn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_71/bd_a15e_m05arn_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_72/bd_a15e_m05rn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_72/bd_a15e_m05rn_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_73/bd_a15e_m05awn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_73/bd_a15e_m05awn_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_74/bd_a15e_m05wn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_74/bd_a15e_m05wn_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_75/bd_a15e_m05bn_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/bd_0/ip/ip_75/bd_a15e_m05bn_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_smartconnect_0_0/smartconnect.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_usp_rf_data_converter_0_0/synth/rfdc_ex_usp_rf_data_converter_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_usp_rf_data_converter_0_0/synth/rfdc_ex_usp_rf_data_converter_0_0_clocks.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_usp_rf_data_converter_0_0/synth/rfdc_ex_usp_rf_data_converter_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_jtag_axi_0_0/constraints/jtag_axi.xdc]
set_property used_in_synthesis false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_jtag_axi_0_0/constraints/rfdc_ex_jtag_axi_0_0_impl.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_jtag_axi_0_0/constraints/rfdc_ex_jtag_axi_0_0_impl.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_jtag_axi_0_0/rfdc_ex_jtag_axi_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_microblaze_0_0/rfdc_ex_microblaze_0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_microblaze_0_0/rfdc_ex_microblaze_0_0_ooc_debug.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_microblaze_0_0/rfdc_ex_microblaze_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_mdm_1_0/rfdc_ex_mdm_1_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_mdm_1_0/rfdc_ex_mdm_1_0_ooc_trace.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_mdm_1_0/rfdc_ex_mdm_1_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_dlmb_bram_if_cntlr_0/rfdc_ex_dlmb_bram_if_cntlr_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_dlmb_v10_0/rfdc_ex_dlmb_v10_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_ilmb_bram_if_cntlr_0/rfdc_ex_ilmb_bram_if_cntlr_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_ilmb_v10_0/rfdc_ex_ilmb_v10_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_lmb_bram_0/rfdc_ex_lmb_bram_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_rst_s_axi_aclk_57M_0/rfdc_ex_rst_s_axi_aclk_57M_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_rst_s_axi_aclk_57M_0/rfdc_ex_rst_s_axi_aclk_57M_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_rst_s_axi_aclk_57M_0/rfdc_ex_rst_s_axi_aclk_57M_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_clk_wiz_dac0_0/rfdc_ex_clk_wiz_dac0_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_clk_wiz_dac0_0/rfdc_ex_clk_wiz_dac0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_clk_wiz_dac0_0/rfdc_ex_clk_wiz_dac0_0_late.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_clk_wiz_dac0_0/rfdc_ex_clk_wiz_dac0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_clk_wiz_adc0_0/rfdc_ex_clk_wiz_adc0_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_clk_wiz_adc0_0/rfdc_ex_clk_wiz_adc0_0.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_clk_wiz_adc0_0/rfdc_ex_clk_wiz_adc0_0_late.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_clk_wiz_adc0_0/rfdc_ex_clk_wiz_adc0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/rfdc_ex_ooc.xdc]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_usp_rf_data_converter_0_0/data/startup.elf]
set_property used_in_implementation false [get_files -all c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.gen/sources_1/bd/rfdc_ex/ip/rfdc_ex_microblaze_0_0/data/mb_bootloop_le.elf]

OPTRACE "Adding files" END { }
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/imports/usp_rf_data_converter_0_example_design.xdc
set_property used_in_implementation false [get_files c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/imports/usp_rf_data_converter_0_example_design.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
set_param ips.enableIPCacheLiteLoad 1

read_checkpoint -auto_incremental -incremental c:/Users/tommy/RfSoc/usp_rf_data_converter_0_ex/usp_rf_data_converter_0_ex.srcs/utils_1/imports/synth_1/usp_rf_data_converter_0_example_design.dcp
close [open __synthesis_is_running__ w]

OPTRACE "synth_design" START { }
synth_design -top usp_rf_data_converter_0_example_design -part xczu67dr-fsve1156-2-i
OPTRACE "synth_design" END { }
if { [get_msg_config -count -severity {CRITICAL WARNING}] > 0 } {
 send_msg_id runtcl-6 info "Synthesis results are not added to the cache due to CRITICAL_WARNING"
}


OPTRACE "write_checkpoint" START { CHECKPOINT }
# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef usp_rf_data_converter_0_example_design.dcp
OPTRACE "write_checkpoint" END { }
OPTRACE "synth reports" START { REPORT }
create_report "synth_1_synth_report_utilization_0" "report_utilization -file usp_rf_data_converter_0_example_design_utilization_synth.rpt -pb usp_rf_data_converter_0_example_design_utilization_synth.pb"
OPTRACE "synth reports" END { }
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
OPTRACE "synth_1" END { }
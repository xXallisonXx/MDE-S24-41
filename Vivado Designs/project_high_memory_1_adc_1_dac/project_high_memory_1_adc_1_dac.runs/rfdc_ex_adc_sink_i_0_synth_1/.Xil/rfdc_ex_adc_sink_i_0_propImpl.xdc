set_property SRC_FILE_INFO {cfile:C:/Xilinx/Vivado/2023.2/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl rfile:../../../../../../../Xilinx/Vivado/2023.2/data/ip/xpm/xpm_memory/tcl/xpm_memory_xdc.tcl id:1 order:LATE scoped_inst:inst/ds_slice_10/exdes_xpm_mem_ds_i/xpm_mem_ds_wrap2_i/xpm_mem_dg_sdpram_wrap_i/Ixpm_memory_tdpram unmanaged:yes} [current_design]
current_instance inst/ds_slice_10/exdes_xpm_mem_ds_i/xpm_mem_ds_wrap2_i/xpm_mem_dg_sdpram_wrap_i/Ixpm_memory_tdpram
set_property src_info {type:SCOPED_XDC file:1 line:55 export:INPUT save:NONE read:READ} [current_design]
set my_var [get_property dram_emb_xdc [get_cells -quiet -hier -filter {PRIMITIVE_SUBGROUP==LUTRAM || PRIMITIVE_SUBGROUP==dram || PRIMITIVE_SUBGROUP==uram || PRIMITIVE_SUBGROUP==BRAM}]]

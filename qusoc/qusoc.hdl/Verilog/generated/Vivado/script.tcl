# inspired by https://github.com/missinglinkelectronics/vivado-build-system/blob/master/build.tcl

proc exitIfFailed {} {
	set project_dir "[pwd]"
	set viv_log_file "[file normalize "${project_dir}/vivado.log"]"
	puts "Log file: ${viv_log_file}"
	set viv_log [split [read [open "${viv_log_file}" r]] "\n"]
	set vmcerr [llength [lsearch -all -regexp $viv_log "^ERROR:"]]
	set vmcwarn [llength [lsearch -all -regexp $viv_log "^CRITICAL WARNING:"]]
	set vmwarn [llength [lsearch -all -regexp $viv_log "Failed run(s):"]]


	if {$vmcwarn > 0} {
		puts "Found critical warnings: ${vmcwarn}"
		exit 1
	}

	if {$vmcerr > 0} {
		puts "Found errors: ${vmcerr}"
		exit 1
	}

	if {$vmwarn > 0} {
		puts "Found failed runs: ${vmcerr}"
		exit 1
	}
}

set_msg_config -id {filemgmt 20-742} -new_severity ERROR
set_msg_config -id {Vivado 12-3645} -new_severity WARNING
create_project -part xc7z020clg400-1 -verbose test
set_property target_language Verilog [current_project]
set_property board_part digilentinc.com:arty-z7-20:part0:1.0 [current_project]
set_property platform.board_id arty-z7-20 [current_project]
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_AutoIncrementCounter.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_AutoIncrementCounter_axiSlave.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_AXI4AutoDecrementRegister.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_AXI4AutoDecrementRegister_axiSlave.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Button0.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Button0_axiSlave.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Button1.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Button1_axiSlave.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Button2.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Button2_axiSlave.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Button3.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Button3_axiSlave.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_CPU0.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_CPU0_CPU.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_CPU0_CPU_ALU.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_CPU0_CPU_CMP.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_CPU0_CPU_ID.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_CPU0_CPU_Regs.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_CPU0_CPU_State_CSR.hex}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_CPU0_Master.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_CPU1.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_CPU1_CPU.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_CPU1_CPU_ALU.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_CPU1_CPU_CMP.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_CPU1_CPU_ID.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_CPU1_CPU_Regs.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_CPU1_CPU_State_CSR.hex}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_CPU1_Master.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_CPU2.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_CPU2_CPU.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_CPU2_CPU_ALU.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_CPU2_CPU_CMP.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_CPU2_CPU_ID.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_CPU2_CPU_Regs.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_CPU2_CPU_State_CSR.hex}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_CPU2_Master.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_CPU3.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_CPU3_CPU.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_CPU3_CPU_ALU.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_CPU3_CPU_CMP.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_CPU3_CPU_ID.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_CPU3_CPU_Regs.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_CPU3_CPU_State_CSR.hex}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_CPU3_Master.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_DuplexMux.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_Encoder.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray0.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray0_encoder.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray0_rangeDetectors0.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray0_rangeDetectors1.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray0_rangeDetectors10.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray0_rangeDetectors11.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray0_rangeDetectors12.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray0_rangeDetectors2.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray0_rangeDetectors3.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray0_rangeDetectors4.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray0_rangeDetectors5.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray0_rangeDetectors6.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray0_rangeDetectors7.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray0_rangeDetectors8.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray0_rangeDetectors9.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray1.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray1_encoder.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray1_rangeDetectors0.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray1_rangeDetectors1.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray1_rangeDetectors10.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray1_rangeDetectors11.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray1_rangeDetectors12.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray1_rangeDetectors2.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray1_rangeDetectors3.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray1_rangeDetectors4.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray1_rangeDetectors5.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray1_rangeDetectors6.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray1_rangeDetectors7.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray1_rangeDetectors8.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray1_rangeDetectors9.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray2.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray2_encoder.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray2_rangeDetectors0.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray2_rangeDetectors1.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray2_rangeDetectors10.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray2_rangeDetectors11.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray2_rangeDetectors12.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray2_rangeDetectors2.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray2_rangeDetectors3.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray2_rangeDetectors4.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray2_rangeDetectors5.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray2_rangeDetectors6.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray2_rangeDetectors7.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray2_rangeDetectors8.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray2_rangeDetectors9.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray3.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray3_encoder.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray3_rangeDetectors0.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray3_rangeDetectors1.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray3_rangeDetectors10.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray3_rangeDetectors11.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray3_rangeDetectors12.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray3_rangeDetectors2.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray3_rangeDetectors3.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray3_rangeDetectors4.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray3_rangeDetectors5.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray3_rangeDetectors6.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray3_rangeDetectors7.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray3_rangeDetectors8.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_rangeDetectorArray3_rangeDetectors9.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_TransactionDetectors0.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_TransactionDetectors1.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_TransactionDetectors2.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_readInterconnect_TransactionDetectors3.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_DuplexMux.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_Encoder.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray0.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray0_encoder.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray0_rangeDetectors0.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray0_rangeDetectors1.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray0_rangeDetectors10.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray0_rangeDetectors11.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray0_rangeDetectors12.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray0_rangeDetectors2.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray0_rangeDetectors3.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray0_rangeDetectors4.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray0_rangeDetectors5.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray0_rangeDetectors6.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray0_rangeDetectors7.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray0_rangeDetectors8.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray0_rangeDetectors9.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray1.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray1_encoder.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray1_rangeDetectors0.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray1_rangeDetectors1.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray1_rangeDetectors10.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray1_rangeDetectors11.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray1_rangeDetectors12.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray1_rangeDetectors2.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray1_rangeDetectors3.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray1_rangeDetectors4.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray1_rangeDetectors5.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray1_rangeDetectors6.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray1_rangeDetectors7.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray1_rangeDetectors8.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray1_rangeDetectors9.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray2.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray2_encoder.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray2_rangeDetectors0.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray2_rangeDetectors1.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray2_rangeDetectors10.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray2_rangeDetectors11.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray2_rangeDetectors12.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray2_rangeDetectors2.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray2_rangeDetectors3.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray2_rangeDetectors4.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray2_rangeDetectors5.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray2_rangeDetectors6.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray2_rangeDetectors7.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray2_rangeDetectors8.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray2_rangeDetectors9.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray3.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray3_encoder.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray3_rangeDetectors0.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray3_rangeDetectors1.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray3_rangeDetectors10.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray3_rangeDetectors11.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray3_rangeDetectors12.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray3_rangeDetectors2.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray3_rangeDetectors3.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray3_rangeDetectors4.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray3_rangeDetectors5.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray3_rangeDetectors6.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray3_rangeDetectors7.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray3_rangeDetectors8.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_rangeDetectorArray3_rangeDetectors9.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_TransactionDetectors0.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_TransactionDetectors1.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_TransactionDetectors2.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Interconnect_writeInterconnect_TransactionDetectors3.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_ioGateway.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_ioInterconnect.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_ioInterconnect_readInterconnect.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_ioInterconnect_readInterconnect_DuplexMux.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_ioInterconnect_readInterconnect_Encoder.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_ioInterconnect_readInterconnect_rangeDetectorArray0.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_ioInterconnect_readInterconnect_rangeDetectorArray0_encoder.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_ioInterconnect_readInterconnect_rangeDetectorArray0_rangeDetectors0.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_ioInterconnect_readInterconnect_rangeDetectorArray0_rangeDetectors1.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_ioInterconnect_readInterconnect_rangeDetectorArray0_rangeDetectors2.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_ioInterconnect_readInterconnect_rangeDetectorArray0_rangeDetectors3.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_ioInterconnect_readInterconnect_rangeDetectorArray0_rangeDetectors4.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_ioInterconnect_readInterconnect_rangeDetectorArray0_rangeDetectors5.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_ioInterconnect_readInterconnect_rangeDetectorArray0_rangeDetectors6.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_ioInterconnect_readInterconnect_TransactionDetectors0.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_ioInterconnect_writeInterconnect.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_ioInterconnect_writeInterconnect_DuplexMux.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_ioInterconnect_writeInterconnect_Encoder.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_ioInterconnect_writeInterconnect_rangeDetectorArray0.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_ioInterconnect_writeInterconnect_rangeDetectorArray0_encoder.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_ioInterconnect_writeInterconnect_rangeDetectorArray0_rangeDetectors0.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_ioInterconnect_writeInterconnect_rangeDetectorArray0_rangeDetectors1.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_ioInterconnect_writeInterconnect_rangeDetectorArray0_rangeDetectors2.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_ioInterconnect_writeInterconnect_rangeDetectorArray0_rangeDetectors3.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_ioInterconnect_writeInterconnect_rangeDetectorArray0_rangeDetectors4.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_ioInterconnect_writeInterconnect_rangeDetectorArray0_rangeDetectors5.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_ioInterconnect_writeInterconnect_rangeDetectorArray0_rangeDetectors6.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_ioInterconnect_writeInterconnect_TransactionDetectors0.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Memory.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Memory_axiSlave.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Memory_State_buff0.hex}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Memory_State_buff1.hex}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Memory_State_buff2.hex}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Memory_State_buff3.hex}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Reg0.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Reg0_axiSlave.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Reg1.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Reg1_axiSlave.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Reg2.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Reg2_axiSlave.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Reg3.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Reg3_axiSlave.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Switch0.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Switch0_axiSlave.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Switch1.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_Switch1_axiSlave.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_uart.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_uart_axiSlave.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_uart_uartReceiver.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/AXISoCQuadCoreModule_TopLevel_uart_uartTransmitter.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/Quokka.v}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/ALUModuleInputs.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/AXI4AutoDecrementRegisterModuleInput.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/AXI4AutoDecrementRegisterModuleInputs.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/AXI4AutoDecrementRegisterModuleState.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/AXI4AutoIncrementCounterModuleInputs.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/AXI4AutoIncrementCounterModuleState.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/AXI4EncoderModuleInputs.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/AXI4GatewayModuleInputs.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/AXI4InteconnectModuleInputs.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/AXI4MasterModuleInput.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/AXI4MasterModuleInputs.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/AXI4MasterModuleState.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/AXI4MemoryModuleInputs.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/AXI4MemoryModuleState.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/AXI4NonBufferedSlaveModuleInputs.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/AXI4NonBufferedSlaveModuleState.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/AXI4RegisterModuleInput.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/AXI4RegisterModuleInputs.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/AXI4RegisterModuleState.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/AXI4RISCVModuleInputs.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/AXI4SignalBufferModuleInput.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/AXI4SignalBufferModuleInputs.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/AXI4SignalBufferModuleState.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/AXI4UARTModuleInputs.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/AXI4UARTModuleState.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/AXI4_M2S.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/AXI4_M2S_R.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/AXI4_M2S_W.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/AXI4_M_AR.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/AXI4_M_AW.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/AXI4_M_B.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/AXI4_M_R.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/AXI4_M_W.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/AXI4_S2M.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/AXI4_S2M_R.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/AXI4_S2M_W.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/AXI4_S_AR.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/AXI4_S_AW.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/AXI4_S_B.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/AXI4_S_R.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/AXI4_S_W.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/AXISoCQuadCoreModuleInputs.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/CompareModuleInputs.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/CPUModuleState.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/FullDuplexMuxModuleInputs_2.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/InstructionDecoderInputs.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/InterconnectModuleInputs_2.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/InterconnectModuleState.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/RangeDetectorArrayModuleInputs.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/RangeDetectorModuleInputs.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/RegistersModuleInput.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/RegistersRAMModuleState.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/RISCVModuleInputs.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/TransactionDetectorModuleInputs.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/TransactionDetectorModuleState.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/UARTReceiverModuleInputs.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/UARTReceiverModuleState.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/UARTTransmitterModuleInputs.txt}
add_files {C:/code/qusoc/qusoc/qusoc.demos/../qusoc.hdl/verilog/generated/AXISoCQuadCoreModule/signals/UARTTransmitterModuleState.txt}
add_files {C:/code/qusoc/qusoc/qusoc.extensions/assets/AXISoCQuadCoreModule/Arty-Z7-20-Master.xdc}
add_files {C:/code/qusoc/qusoc/qusoc.extensions/assets/AXISoCQuadCoreModule/top.v}
update_compile_order -fileset sources_1
set_property top top [current_fileset]
set_property SOURCE_SET sources_1 [get_filesets sim_1]
launch_runs -jobs 4 -to_step write_bitstream impl_1
wait_on_run impl_1
exitIfFailed

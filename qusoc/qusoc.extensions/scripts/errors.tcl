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

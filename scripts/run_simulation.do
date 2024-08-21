vlog alu_package.sv top.sv +cover
vsim -batch top -cover
run -all
coverage report -codeAll -cvg -verbose -file coverage_report.txt
set projDir "C:/Users/user/Desktop/test/work/vivado"
set projName "test"
set topName top
set device xc7a35tftg256-1
if {[file exists "$projDir/$projName"]} { file delete -force "$projDir/$projName" }
create_project $projName "$projDir/$projName" -part $device
set_property design_mode RTL [get_filesets sources_1]
set verilogSources [list "C:/Users/user/Desktop/test/work/verilog/au_top_0.v" "C:/Users/user/Desktop/test/work/verilog/counter_1.v" "C:/Users/user/Desktop/test/work/verilog/autotest_2.v" "C:/Users/user/Desktop/test/work/verilog/alu_3.v" "C:/Users/user/Desktop/test/work/verilog/reset_conditioner_4.v" "C:/Users/user/Desktop/test/work/verilog/counter_5.v" "C:/Users/user/Desktop/test/work/verilog/adder_6.v" "C:/Users/user/Desktop/test/work/verilog/shifter_7.v" "C:/Users/user/Desktop/test/work/verilog/comparator_8.v" "C:/Users/user/Desktop/test/work/verilog/boolean_9.v" ]
import_files -fileset [get_filesets sources_1] -force -norecurse $verilogSources
set xdcSources [list "D:/Program\ File\ D/library/components/au.xdc" "C:/Users/user/Desktop/test/work/constraint/alchitry.xdc" "C:/Users/user/Desktop/test/work/constraint/io.xdc" ]
read_xdc $xdcSources
set_property STEPS.WRITE_BITSTREAM.ARGS.BIN_FILE true [get_runs impl_1]
update_compile_order -fileset sources_1
launch_runs -runs synth_1 -jobs 8
wait_on_run synth_1
launch_runs impl_1 -to_step write_bitstream -jobs 8
wait_on_run impl_1

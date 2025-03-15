onerror {quit -f}
vlib work
vlog -work work ControlAscensor.vo
vlog -work work ControlAscensor.vt
vsim -novopt -c -t 1ps -L cycloneii_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.ControlAscensor_vlg_vec_tst
vcd file -direction ControlAscensor.msim.vcd
vcd add -internal ControlAscensor_vlg_vec_tst/*
vcd add -internal ControlAscensor_vlg_vec_tst/i1/*
add wave /*
run -all

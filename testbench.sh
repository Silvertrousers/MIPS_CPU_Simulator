#!/bin/bash
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/j_ds.bin")
echo $?
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/add_bt.bin")
echo $?
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/lb_sb_bt.bin")
echo $?
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/sll_bt.bin")
echo $?
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/lb_i.bin")
echo $?
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/sb_o.bin")
echo $?
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/jr_bt.bin")
echo $?
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/j_bt.bin")
echo $?
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/srl_bt.bin")
echo $?
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/lw_sw_bt.bin")
echo $?

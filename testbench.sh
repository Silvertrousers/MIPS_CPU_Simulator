#!/bin/bash
dt="_$(date +%d.%m.%Y_%H:%M:%S).txt"
touch ./test/output/"$dt"
# OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/bgez_bt.bin")
# if test $? = 1
# then
#     echo "testID: bgez_bt.bin, Instr: BGEZ, Status: PASS, Author: $USER, Notes: ----, " | paste -sd ' ' >> ./test/output/"$dt"
# elif test $? = 2
# then
#     echo "testID: bgez_bt.bin, Instr: BGEZ, Status: FAIL, Author: $USER, Notes: Branched relative to branch instr not the delay slot instr, " | paste -sd ' ' >> ./test/output/"$dt"
# elif test $? = 0
# then
#     echo "testID: bgez_bt.bin, Instr: BGEZ, Status: FAIL, Author: $USER, Notes: No branch occured, " | paste -sd ' ' >> ./test/output/"$dt"
# else
#     echo "testID: bgez_bt.bin, Instr: BGEZ, Status: FAIL, Author: $USER, Notes: No idea why it failed, " | paste -sd ' ' >> ./test/output/"$dt"
# fi
# OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/bgez_illegal_back.bin")
# if test $? = 245
# then
#     echo "testID: bgez_illegal_back, Instr: BGEZ, Status: PASS, Author: $USER, Notes: ----, "  | paste -sd ' ' >> ./test/output/"$dt"
# else
#     echo "testID: bgez_illegal_back, Instr: BGEZ, Status: FAIL, Author: $USER, Notes: didnt return the correct error, " | paste -sd ' ' >> ./test/output/"$dt"
# fi
# OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/bgezal_bt.bin")
# if test $? = 2
# then
#     echo "testID: bgezal_bt.bin, Instr: BGEZAL, Status: PASS, Author: $USER, Notes: branch returned to correct place " | paste -sd ' ' >> ./test/output/"$dt"
# elif test $? = 3
# then
#     echo "testID: BGEZAL_bt.bin, Instr: BGEZAL, Status: FAIL, Author: $USER, Notes: Returned to delay slot instr instead of one in front or no branch occured, see bgez_bt, " | paste -sd ' ' >> ./test/output/"$dt"
# else
#     echo "testID: bgezal_bt.bin, Instr: BGEZAL, Status: FAIL, Author: $USER, Notes: No idea why it failed, " | paste -sd ' ' >> ./test/output/"$dt"
# fi
# OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/beq_bt.bin")
# if test $? = 1
# then
#     echo "testID: beq_bt.bin, Instr: BEQ, Status: PASS, Author: $USER, Notes: ----, " | paste -sd ' ' >> ./test/output/"$dt"
# elif test $? = 2
# then
#     echo "testID: beq_bt.bin, Instr: BEQ, Status: FAIL, Author: $USER, Notes: Branched relative to branch instr not the delay slot instr, " | paste -sd ' ' >> ./test/output/"$dt"
# elif test $? = 0
# then
#     echo "testID: beq_bt.bin, Instr: BEQ, Status: FAIL, Author: $USER, Notes: No branch occured, " | paste -sd ' ' >> ./test/output/"$dt"
# else
#     echo "testID: beq_bt.bin, Instr: BEQ, Status: FAIL, Author: $USER, Notes: No idea why it failed, " | paste -sd ' ' >> ./test/output/"$dt"
# fi
# OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/beq_illegal_back.bin")
# if test $? = 245
# then
#     echo "testID: beq_illegal_back, Instr: BEQ, Status: PASS, Author: $USER, Notes: ----, "  | paste -sd ' ' >> ./test/output/"$dt"
# else
#     echo "testID: beq_illegal_back, Instr: BEQ, Status: FAIL, Author: $USER, Notes: didnt return the correct error, " | paste -sd ' ' >> ./test/output/"$dt"
# fi
# OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/j_ds.bin")
# if test $? = 1
# then
#     echo "testID: j_ds.bin, Instr: J, Status: PASS, Author: $USER, Notes: ----, " | paste -sd ' ' >> ./test/output/"$dt"
# elif test $? = 0
# then
#     echo "testID: j_ds.bin, Instr: J, Status: FAIL, Author: $USER, Notes: Delay slot instr not executing, " | paste -sd ' ' >> ./test/output/"$dt"
# else
#     echo "testID: j_ds.bin, Instr: J, Status: FAIL, Author: $USER, Notes: No idea why it failed, " | paste -sd ' ' >> ./test/output/"$dt"
# fi
# OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/jal_bt.bin")
# if test $? = 3
# then
#     echo "testID: jal_bt.bin, Instr: JAL, Status: PASS, Author: $USER, Notes: link returns to correct place, " | paste -sd ' ' >> ./test/output/"$dt"
# elif test $? = 4
# then
#     echo "testID: jal_bt.bin, Instr: JAL, Status: FAIL, Author: $USER, Notes: link returns to delay slot instr (not correct return address), " | paste -sd ' ' >> ./test/output/"$dt"
# elif test $? = 2
# then
#     echo "testID: jal_bt.bin, Instr: JAL, Status: FAIL, Author: $USER, Notes: link returns to instr 2 after the delays slot instr (too far), " | paste -sd ' ' >> ./test/output/"$dt"
# else
#     echo "testID: jal_bt.bin, Instr: JAL, Status: FAIL, Author: $USER, Notes: not sure hats wrong here, " | paste -sd ' ' >> ./test/output/"$dt"
#
# fi
# OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/jalr_bt.bin")
# if test $? = 3
# then
#     echo "testID: jalr_bt.bin, Instr: JALR, Status: PASS, Author: $USER, Notes: link returns to correct place, " | paste -sd ' ' >> ./test/output/"$dt"
# elif test $? = 4
# then
#     echo ass
#     echo "testID: jalr_bt.bin, Instr: JALR, Status: FAIL, Author: $USER, Notes: link returns to delay slot instr (not correct return address), " | paste -sd ' ' >> ./test/output/"$dt"
# elif test $? = 2
# then
#     echo "testID: jalr_bt.bin, Instr: JALR, Status: FAIL, Author: $USER, Notes: link returns to instr 2 after the delays slot instr (too far), " | paste -sd ' ' >> ./test/output/"$dt"
# else
#     echo "testID: jalr_bt.bin, Instr: JALR, Status: FAIL, Author: $USER, Notes: not sure hats wrong here, " | paste -sd ' ' >> ./test/output/"$dt"
#
# fi
# OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/jr_bt.bin")
# if test $? = 0
# then
#     echo "testID: jr_bt.bin, Instr: JR, Status: PASS, Author: $USER, Notes: ----, " | paste -sd ' ' >> ./test/output/"$dt"
# else
#     echo "testID: jr_bt.bin, Instr: JR, Status: FAIL, Author: $USER, Notes: No idea why it failed, " | paste -sd ' ' >> ./test/output/"$dt"
# fi
# OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/j_bt.bin")
# if test $? = 0
# then
#     echo "testID: j_bt.bin, Instr: J, Status: PASS, Author: $USER, Notes: ----, " | paste -sd ' ' >> ./test/output/"$dt"
# elif test $? = 1
# then
#     echo "testID: j_bt.bin, Instr: J, Status: FAIL, Author: $USER, Notes: Jump went one instruction too far, " | paste -sd ' ' >> ./test/output/"$dt"
# else
#     echo "testID: j_bt.bin, Instr: J, Status: FAIL, Author: $USER, Notes: No idea why it failed, " | paste -sd ' ' >> ./test/output/"$dt"
# fi
# OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/lbu_bt.bin")
# if test $? = 16
# then
#     echo "testID: lbu_bt.bin, Instr: LBU, Status: PASS, Author: $USER, Notes: loads correct byte without sign extension, " | paste -sd ' ' >> ./test/output/"$dt"
# elif test $? = 240
# then
#     echo "testID: lbu_bt.bin, Instr: LBU, Status: FAIL, Author: $USER, Notes: loads correct byte but has sign extension, " | paste -sd ' ' >> ./test/output/"$dt"
# else
#     echo "testID: lbu_bt.bin, Instr: LBU, Status: FAIL, Author: $USER, Notes: loads wrong byte, " | paste -sd ' ' >> ./test/output/"$dt"
# fi
# OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/lb_bt.bin")
# if test $? = 240
# then
#     echo "testID: lb_bt.bin, Instr: LB, Status: PASS, Author: $USER, Notes: loads correct byte with sign extension, " | paste -sd ' ' >> ./test/output/"$dt"
# elif test $? = 16
# then
#     echo "testID: lb_bt.bin, Instr: LB, Status: FAIL, Author: $USER, Notes: loads correct byte but has no sign extension, " | paste -sd ' ' >> ./test/output/"$dt"
# else
#     echo "testID: lb_bt.bin, Instr: LB, Status: FAIL, Author: $USER, Notes: loads wrong byte, " | paste -sd ' ' >> ./test/output/"$dt"
# fi
# OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/lhu_bt.bin")
# if test $? = 16
# then
#     echo "testID: lhu_bt.bin, Instr: LHU, Status: PASS, Author: $USER, Notes: loads correct byte without sign extension, " | paste -sd ' ' >> ./test/output/"$dt"
# elif test $? = 240
# then
#     echo "testID: lhu_bt.bin, Instr: LHU, Status: FAIL, Author: $USER, Notes: loads correct byte but has sign extension, " | paste -sd ' ' >> ./test/output/"$dt"
# else
#     echo "testID: lhu_bt.bin, Instr: LHU, Status: FAIL, Author: $USER, Notes: loads wrong byte, " | paste -sd ' ' >> ./test/output/"$dt"
# fi
# OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/lhu_unaligned.bin")
# if test $? = 245
# then
#     echo "testID: lhu_unaligned.bin, Instr: LHU, Status: PASS, Author: $USER, Notes: detects unaligned address correctly, " | paste -sd ' ' >> ./test/output/"$dt"
# else
#     echo "testID: lhu_unaligned.bin, Instr: LHU, Status: FAIL, Author: $USER, Notes: doesn't catch unaligned sequence, " | paste -sd ' ' >> ./test/output/"$dt"
# fi
# OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/lh_bt.bin")
# if test $? = 240
# then
#     echo "testID: lh_bt.bin, Instr: LH, Status: PASS, Author: $USER, Notes: loads correct byte with sign extension, " | paste -sd ' ' >> ./test/output/"$dt"
# elif test $? = 16
# then
#     echo "testID: lh_bt.bin, Instr: LHU, Status: FAIL, Author: $USER, Notes: loads correct byte but has no sign extension, " | paste -sd ' ' >> ./test/output/"$dt"
# else
#     echo "testID: lh_bt.bin, Instr: LHU, Status: FAIL, Author: $USER, Notes: loads wrong byte, " | paste -sd ' ' >> ./test/output/"$dt"
# fi
# OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/lh_unaligned.bin")
# if test $? = 245
# then
#     echo "testID: lh_unaligned.bin, Instr: LH, Status: PASS, Author: $USER, Notes: detects unaligned address correctly, " | paste -sd ' ' >> ./test/output/"$dt"
# else
#     echo "testID: lh_unaligned.bin, Instr: LH, Status: FAIL, Author: $USER, Notes: doesn't catch unaligned sequence, " | paste -sd ' ' >> ./test/output/"$dt"
# fi
# OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/lb_sb_bt.bin")
# if test $? = 3
# then
#     echo "testID: lb_sb_bt.bin, Instr: SB, Status: PASS, Author: $USER, Notes: ----, " | paste -sd ' ' >> ./test/output/"$dt"
# else
#     echo "testID: lb_sb_bt.bin, Instr: SB, Status: FAIL, Author: $USER, Notes: No idea why it failed, " | paste -sd ' ' >> ./test/output/"$dt"
# fi
OUTPUT=$(echo 1 | sudo ./bin/mips_simulator "test_binaries/lb_i.bin")
if test $? = 49
then
    echo "testID: lb_i.bin, Instr: LB, Status: PASS, Author: $USER, Notes: takes user input correctly, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: lb_i.bin, Instr: LB, Status: FAIL, Author: $USER, Notes: didnt take user input correctly, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(echo 1 | sudo ./bin/mips_simulator "test_binaries/lb_i_zero.bin")
if test $? = 0
then
    echo "testID: lb_i_zero.bin, Instr: LB, Status: PASS, Author: $USER, Notes: takes user input correctly and only loads lsB of the mem word, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: lb_i_zero.bin, Instr: LB, Status: FAIL, Author: $USER, Notes: doesn't only load from lsB of mem word, " | paste -sd ' ' >> ./test/output/"$dt"
fi
# OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/sb_o.bin")
# echo $?
# OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/lui_bt.bin")
# if test $? = 1
# then
#     echo "testID: lui_bt.bin, Instr: LUI, Status: PASS, Author: $USER, Notes: loads correct immediate, " | paste -sd ' ' >> ./test/output/"$dt"
# else
#     echo "testID: lui_bt.bin, Instr: LUI, Status: FAIL, Author: $USER, Notes: No idea why it failed, " | paste -sd ' ' >> ./test/output/"$dt"
# fi
# OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/lw_sw_bt.bin")
# if test $? = 0
# then
#     echo "testID: lw_sw_bt.bin, Instr: LW and SW, Status: PASS, Author: $USER, Notes: ----, " | paste -sd ' ' >> ./test/output/"$dt"
# else
#     echo "testID: lw_sw_bt.bin, Instr: LW and SW, Status: FAIL, Author: $USER, Notes: No idea why it failed, " | paste -sd ' ' >> ./test/output/"$dt"
# fi

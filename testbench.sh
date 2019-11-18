#!/bin/bash
dt="_$(date +%d.%m.%Y_%H:%M:%S).txt"
touch ./test/output/"$dt"
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/bgez_bt.bin")
if test $? = 1
then
    echo "testID: bgez_bt.bin, Instr: BGEZ, Status: PASS, Author: $USER, Notes: ----, " | paste -sd ' ' >> ./test/output/"$dt"
elif test $? = 2
then
    echo "testID: bgez_bt.bin, Instr: BGEZ, Status: FAIL, Author: $USER, Notes: Branched relative to branch instr not the delay slot instr, " | paste -sd ' ' >> ./test/output/"$dt"
elif test $? = 0
then
    echo "testID: bgez_bt.bin, Instr: BGEZ, Status: FAIL, Author: $USER, Notes: No branch occured, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: bgez_bt.bin, Instr: BGEZ, Status: FAIL, Author: $USER, Notes: No idea why it failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/bgez_illegal_back.bin")
if test $? = 245
then
    echo "testID: bgez_illegal_back, Instr: BGEZ, Status: PASS, Author: $USER, Notes: ----, "  | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: bgez_illegal_back, Instr: BGEZ, Status: FAIL, Author: $USER, Notes: didnt return the correct error, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/bgezal_bt.bin")
if test $? = 2
then
    echo "testID: bgezal_bt.bin, Instr: BGEZAL, Status: PASS, Author: $USER, Notes: branch returned to correct place " | paste -sd ' ' >> ./test/output/"$dt"
elif test $? = 3
then
    echo "testID: BGEZAL_bt.bin, Instr: BGEZAL, Status: FAIL, Author: $USER, Notes: Returned to delay slot instr instead of one in front or no branch occured, see bgez_bt, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: bgezal_bt.bin, Instr: BGEZAL, Status: FAIL, Author: $USER, Notes: No idea why it failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/beq_bt.bin")
if test $? = 1
then
    echo "testID: beq_bt.bin, Instr: BEQ, Status: PASS, Author: $USER, Notes: ----, " | paste -sd ' ' >> ./test/output/"$dt"
elif test $? = 2
then
    echo "testID: beq_bt.bin, Instr: BEQ, Status: FAIL, Author: $USER, Notes: Branched relative to branch instr not the delay slot instr, " | paste -sd ' ' >> ./test/output/"$dt"
elif test $? = 0
then
    echo "testID: beq_bt.bin, Instr: BEQ, Status: FAIL, Author: $USER, Notes: No branch occured, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: beq_bt.bin, Instr: BEQ, Status: FAIL, Author: $USER, Notes: No idea why it failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/beq_illegal_back.bin")
if test $? = 245
then
    echo "testID: beq_illegal_back, Instr: BEQ, Status: PASS, Author: $USER, Notes: ----, "  | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: beq_illegal_back, Instr: BEQ, Status: FAIL, Author: $USER, Notes: didnt return the correct error, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/j_ds.bin")
if test $? = 1
then
    echo "testID: j_ds.bin, Instr: J, Status: PASS, Author: $USER, Notes: ----, " | paste -sd ' ' >> ./test/output/"$dt"
elif test $? = 0
then
    echo "testID: j_ds.bin, Instr: J, Status: FAIL, Author: $USER, Notes: Delay slot instr not executing, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: j_ds.bin, Instr: J, Status: FAIL, Author: $USER, Notes: No idea why it failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/jal_bt.bin")
if test $? = 3
then
    echo "testID: jal_bt.bin, Instr: JAL, Status: PASS, Author: $USER, Notes: link returns to correct place, " | paste -sd ' ' >> ./test/output/"$dt"
elif test $? = 4
then
    echo "testID: jal_bt.bin, Instr: JAL, Status: FAIL, Author: $USER, Notes: link returns to delay slot instr (not correct return address), " | paste -sd ' ' >> ./test/output/"$dt"
elif test $? = 2
then
    echo "testID: jal_bt.bin, Instr: JAL, Status: FAIL, Author: $USER, Notes: link returns to instr 2 after the delays slot instr (too far), " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: jal_bt.bin, Instr: JAL, Status: FAIL, Author: $USER, Notes: not sure hats wrong here, " | paste -sd ' ' >> ./test/output/"$dt"

fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/jalr_bt.bin")
if test $? = 3
then
    echo "testID: jalr_bt.bin, Instr: JALR, Status: PASS, Author: $USER, Notes: link returns to correct place, " | paste -sd ' ' >> ./test/output/"$dt"
elif test $? = 4
then
    echo ass
    echo "testID: jalr_bt.bin, Instr: JALR, Status: FAIL, Author: $USER, Notes: link returns to delay slot instr (not correct return address), " | paste -sd ' ' >> ./test/output/"$dt"
elif test $? = 2
then
    echo "testID: jalr_bt.bin, Instr: JALR, Status: FAIL, Author: $USER, Notes: link returns to instr 2 after the delays slot instr (too far), " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: jalr_bt.bin, Instr: JALR, Status: FAIL, Author: $USER, Notes: not sure hats wrong here, " | paste -sd ' ' >> ./test/output/"$dt"

fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/jr_bt.bin")
if test $? = 0
then
    echo "testID: jr_bt.bin, Instr: JR, Status: PASS, Author: $USER, Notes: ----, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: jr_bt.bin, Instr: JR, Status: FAIL, Author: $USER, Notes: No idea why it failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/j_bt.bin")
if test $? = 0
then
    echo "testID: j_bt.bin, Instr: J, Status: PASS, Author: $USER, Notes: ----, " | paste -sd ' ' >> ./test/output/"$dt"
elif test $? = 1
then
    echo "testID: j_bt.bin, Instr: J, Status: FAIL, Author: $USER, Notes: Jump went one instruction too far, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: j_bt.bin, Instr: J, Status: FAIL, Author: $USER, Notes: No idea why it failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/lb_sb_bt.bin")
if test $? = 3
then
    echo "testID: lb_sb_bt.bin, Instr: LB and SB, Status: PASS, Author: $USER, Notes: ----, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: lb_sb_bt.bin, Instr: LB and SB, Status: FAIL, Author: $USER, Notes: No idea why it failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/lb_i.bin")
echo $?
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/sb_o.bin")
echo $?

OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/lw_sw_bt.bin")
if test $? = 0
then
    echo "testID: lw_sw_bt.bin, Instr: LW and SW, Status: PASS, Author: $USER, Notes: ----, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: lw_sw_bt.bin, Instr: LW and SW, Status: FAIL, Author: $USER, Notes: No idea why it failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi

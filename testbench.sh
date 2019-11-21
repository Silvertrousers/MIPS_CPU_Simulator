#!/bin/bash
dt="_$(date +%d.%m.%Y_%H:%M:%S).txt"
touch ./test/output/"$dt"
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/r0_test.bin")
if test $? = 1
then
    echo "testID: r0_test.bin, Instr: N/A, Status: PASS, Author: $USER, Notes: r0 remains unmodified as it should, " | paste -sd ' ' >> ./test/output/"$dt"
elif test $? = 6
then
    echo "testID: r0_test.bin, Instr: N/A, Status: FAIL, Author: $USER, Notes: r0 was modified to 5, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: r0_test.bin, Instr: N/A, Status: FAIL, Author: $USER, Notes: operation failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/invalid.bin")
if test $? = 244
then
    echo "testID: invalid.bin, Instr: N/A, Status: PASS, Author: $USER, Notes: Invalid Instruction Exception, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: invalid.bin, Instr: N/A, Status: FAIL, Author: $USER, Notes: operation failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi

OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/add_bt.bin")
if test $? = 3
then
    echo "testID: add_bt.bin, Instr: ADD, Status: PASS, Author: $USER, Notes: addition successfully performed, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: add_bt.bin, Instr: ADD, Status: FAIL, Author: $USER, Notes: operation failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi

OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/add_ov.bin")
if test $? = 246
then
    echo "testID: add_ov.bin, Instr: ADD, Status: PASS, Author: $USER, Notes: Integer Overflow Exception, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: add_ov.bin, Instr: ADD, Status: FAIL, Author: $USER, Notes: operation failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi

OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/addi_bt.bin")
if test $? = 2
then
    echo "testID: addi_bt.bin, Instr: ADDI, Status: PASS, Author: $USER, Notes: addition successfully performed, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: addi_bt.bin, Instr: ADDI, Status: FAIL, Author: $USER, Notes: operation failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi

OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/addi_ov.bin")
if test $? = 246
then
    echo "testID: addi_ov.bin, Instr: ADDI, Status: PASS, Author: $USER, Notes: Integer Overflow Exception, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: addi_ov.bin, Instr: ADDI, Status: FAIL, Author: $USER, Notes: operation failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi

OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/addiu_bt.bin")
if test $? = A
then
    echo "testID: addiu_bt.bin, Instr: ADDIU, Status: PASS, Author: $USER, Notes: addition successfully performed, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: addiu_bt.bin, Instr: ADDIU, Status: FAIL, Author: $USER, Notes: operation failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi

OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/addu_bt.bin")
if test $? = 5
then
    echo "testID: addu_bt.bin, Instr: ADDU, Status: PASS, Author: $USER, Notes: addition successfully performed, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: addu_bt.bin, Instr: ADDU, Status: FAIL, Author: $USER, Notes: operation failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi

OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/and_bt.bin")
if test $? = 170
then
    echo "testID: and_bt.bin, Instr: AND, Status: PASS, Author: $USER, Notes: operation successfully performed, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: and_bt.bin, Instr: AND, Status: FAIL, Author: $USER, Notes: operation failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi

OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/andi_bt.bin")
if test $? = 170
then
    echo "testID: andi_bt.bin, Instr: ANDI, Status: PASS, Author: $USER, Notes: addition successfully performed, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: andi_bt.bin, Instr: ANDI, Status: FAIL, Author: $USER, Notes: operation failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi

OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/or_bt.bin")
if test $? = 170
then
    echo "testID: or_bt.bin, Instr: OR, Status: PASS, Author: $USER, Notes: operation successfully performed, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: or_bt.bin, Instr: OR, Status: FAIL, Author: $USER, Notes: operation failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi

OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/ori_bt.bin")
if test $? = 170
then
    echo "testID: ori_bt.bin, Instr: ORI, Status: PASS, Author: $USER, Notes: addition successfully performed, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: ori_bt.bin, Instr: ORI, Status: FAIL, Author: $USER, Notes: operation failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi

OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/xor_bt.bin")
if test $? = 85
then
    echo "testID: xor_bt.bin, Instr: XOR, Status: PASS, Author: $USER, Notes: operation successfully performed, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: xor_bt.bin, Instr: XOR, Status: FAIL, Author: $USER, Notes: operation failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi

OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/xori_bt.bin")
if test $? = 170
then
    echo "testID: xori_bt.bin, Instr: XORI, Status: PASS, Author: $USER, Notes: addition successfully performed, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: xori_bt.bin, Instr: XORI, Status: FAIL, Author: $USER, Notes: operation failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi

OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/sub_bt.bin")
if test $? = 3
then
    echo "testID: sub_bt.bin, Instr: SUB, Status: PASS, Author: $USER, Notes: subtraction successfully performed, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: sub_bt.bin, Instr: SUB, Status: FAIL, Author: $USER, Notes: operation failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi

OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/sub_ov.bin")
if test $? = 246
then
    echo "testID: sub_ov.bin, Instr: SUB, Status: PASS, Author: $USER, Notes: Integer Overflow Exception, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: sub_ov.bin, Instr: SUB, Status: FAIL, Author: $USER, Notes: operation failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi

OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/subu_bt.bin")
if test $? = 3
then
    echo "testID: subu_bt.bin, Instr: SUBU, Status: PASS, Author: $USER, Notes: subtraction successfully performed, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: subu_bt.bin, Instr: SUBU, Status: FAIL, Author: $USER, Notes: operation failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi

OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/sll_bt.bin")
if test $? = 2
then
    echo "testID: sll_bt.bin, Instr: SLL, Status: PASS, Author: $USER, Notes: operation successfully performed, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: sll_bt.bin, Instr: SLL, Status: FAIL, Author: $USER, Notes: operation failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi

OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/sllv_bt.bin")
if test $? = 8
then
    echo "testID: sllv_bt.bin, Instr: SLLV, Status: PASS, Author: $USER, Notes: operation successfully performed, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: sllv_bt.bin, Instr: SLLV, Status: FAIL, Author: $USER, Notes: operation failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi

OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/sra_bt.bin")
if test $? = 255
then
    echo "testID: sra_bt.bin, Instr: SRA, Status: PASS, Author: $USER, Notes: operation successfully performed, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: sra_bt.bin, Instr: SRA, Status: FAIL, Author: $USER, Notes: operation failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi

OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/srav_bt.bin")
if test $? = 255
then
    echo "testID: srav_bt.bin, Instr: SRAV, Status: PASS, Author: $USER, Notes: operation successfully performed, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: srav_bt.bin, Instr: SRAV, Status: FAIL, Author: $USER, Notes: operation failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi

OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/srl_bt.bin")
if test $? = 2
then
    echo "testID: srl_bt.bin, Instr: SRL, Status: PASS, Author: $USER, Notes: operation successfully performed, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: srl_bt.bin, Instr: SRL, Status: FAIL, Author: $USER, Notes: operation failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi

OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/srlv_bt.bin")
if test $? = 1
then
    echo "testID: srlv_bt.bin, Instr: SRLV, Status: PASS, Author: $USER, Notes: operation successfully performed, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: srlv_bt.bin, Instr: SRLV, Status: FAIL, Author: $USER, Notes: operation failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi

OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/slt_bt.bin")
if test $? = 1
then
    echo "testID: slt_bt.bin, Instr: SLT, Status: PASS, Author: $USER, Notes: operation successfully performed, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: slt_bt.bin, Instr: SLT, Status: FAIL, Author: $USER, Notes: operation failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi

OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/slti_bt.bin")
if test $? = 0
then
    echo "testID: slti_bt.bin, Instr: SLTI, Status: PASS, Author: $USER, Notes: operation successfully performed, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: slti_bt.bin, Instr: SLTI, Status: FAIL, Author: $USER, Notes: operation failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi

OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/sltiu_bt.bin")
if test $? = 1
then
    echo "testID: sltiu_bt.bin, Instr: SLTIU, Status: PASS, Author: $USER, Notes: operation successfully performed, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: sltiu_bt.bin, Instr: SLTIU, Status: FAIL, Author: $USER, Notes: operation failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi

OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/mthi_mfhi_bt.bin")
if test $? = 2
then
    echo "testID: mthi_mfhi_bt.bin, Instr: MTHI/MFHI, Status: PASS, Author: $USER, Notes: operations successfully performed, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: mthi_mfhi_bt.bin, Instr: MTHI/MFHI, Status: FAIL, Author: $USER, Notes: operation failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi

OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/mtlo_mflo_bt.bin")
if test $? = 7
then
    echo "testID: mtlo_mflo_bt.bin, Instr: MTLO/MFLO, Status: PASS, Author: $USER, Notes: operations successfully performed, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: mtlo_mflo_bt.bin, Instr: MTLO/MFLO, Status: FAIL, Author: $USER, Notes: operation failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi


OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/harsh_r0_test.bin")
if test $? = 1
then
    echo "testID: harsh_r0_test.bin, Instr: N/A, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: r0 remains unmodified as it should, " | paste -sd ' ' >> ./test/output/"$dt"
elif test $? = 0
then
    echo "testID: harsh_r0_test.bin, Instr: N/A, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: branch did not occur so delay slot instruction was able to modify r0 at least temporarily, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: harsh_r0_test.bin, Instr: N/A, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: No idea why it failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/bgez_bt.bin")
if test $? = 1
then
    echo "testID: bgez_bt.bin, Instr: BGEZ, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: ----, " | paste -sd ' ' >> ./test/output/"$dt"
elif test $? = 2
then
    echo "testID: bgez_bt.bin, Instr: BGEZ, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: Branched relative to branch instr not the delay slot instr, " | paste -sd ' ' >> ./test/output/"$dt"
elif test $? = 0
then
    echo "testID: bgez_bt.bin, Instr: BGEZ, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: No branch occured, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: bgez_bt.bin, Instr: BGEZ, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: No idea why it failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/bgez_illegal_back.bin")
if test $? = 245
then
    echo "testID: bgez_illegal_back, Instr: BGEZ, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: ----, "  | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: bgez_illegal_back, Instr: BGEZ, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: didnt return the correct error, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/bgezal_bt.bin")
if test $? = 2
then
    echo "testID: bgezal_bt.bin, Instr: BGEZAL, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: branch returned to correct place " | paste -sd ' ' >> ./test/output/"$dt"
elif test $? = 3
then
    echo "testID: bgezal_bt.bin, Instr: BGEZAL, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: Returned to delay slot instr instead of one in front or no branch occured, see bgez_bt, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: bgezal_bt.bin, Instr: BGEZAL, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: No idea why it failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/beq_bt.bin")
if test $? = 1
then
    echo "testID: beq_bt.bin, Instr: BEQ, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: ----, " | paste -sd ' ' >> ./test/output/"$dt"
elif test $? = 2
then
    echo "testID: beq_bt.bin, Instr: BEQ, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: Branched relative to branch instr not the delay slot instr, " | paste -sd ' ' >> ./test/output/"$dt"
elif test $? = 0
then
    echo "testID: beq_bt.bin, Instr: BEQ, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: No branch occured, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: beq_bt.bin, Instr: BEQ, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: No idea why it failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/beq_illegal_back.bin")
if test $? = 245
then
    echo "testID: beq_illegal_back, Instr: BEQ, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: ----, "  | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: beq_illegal_back, Instr: BEQ, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: didnt return the correct error, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/bgtz_bt.bin")
if test $? = 1
then
    echo "testID: bgtz_bt.bin, Instr: BGTZ, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: ----, " | paste -sd ' ' >> ./test/output/"$dt"
elif test $? = 2
then
    echo "testID: bgtz_bt.bin, Instr: BGTZ, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: Branched relative to branch instr not the delay slot instr, " | paste -sd ' ' >> ./test/output/"$dt"
elif test $? = 0
then
    echo "testID: bgtz_bt.bin, Instr: BGTZ, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: No branch occured, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: bgtz_bt.bin, Instr: BGTZ, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: No idea why it failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/bgtz_illegal_back.bin")
if test $? = 245
then
    echo "testID: bgtz_illegal_back, Instr: BGTZ, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: ----, "  | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: bgtz_illegal_back, Instr: BGTZ, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: didnt return the correct error, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/blez_bt.bin")
if test $? = 1
then
    echo "testID: blez_bt.bin, Instr: BLEZ, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: ----, " | paste -sd ' ' >> ./test/output/"$dt"
elif test $? = 2
then
    echo "testID: blez_bt.bin, Instr: BLEZ, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: Branched relative to branch instr not the delay slot instr, " | paste -sd ' ' >> ./test/output/"$dt"
elif test $? = 0
then
    echo "testID: blez_bt.bin, Instr: BLEZ, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: No branch occured, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: blez_bt.bin, Instr: BLEZ, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: No idea why it failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/blez_illegal_back.bin")
if test $? = 245
then
    echo "testID: blez_illegal_back, Instr: BLEZ, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: ----, "  | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: blez_illegal_back, Instr: BLEZ, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: didnt return the correct error, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/bltz_bt.bin")
if test $? = 1
then
    echo "testID: bltz_bt.bin, Instr: BLTZ, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: ----, " | paste -sd ' ' >> ./test/output/"$dt"
elif test $? = 2
then
    echo "testID: bltz_bt.bin, Instr: BLTZ, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: Branched relative to branch instr not the delay slot instr, " | paste -sd ' ' >> ./test/output/"$dt"
elif test $? = 0
then
    echo "testID: bltz_bt.bin, Instr: BLTZ, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: No branch occured, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: bltz_bt.bin, Instr: BLTZ, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: No idea why it failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/bltz_illegal_back.bin")
if test $? = 245
then
    echo "testID: bltz_illegal_back, Instr: BLTZ, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: ----, "  | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: bltz_illegal_back, Instr: BLTZ, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: didnt return the correct error, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/bltzal_bt.bin")
if test $? = 2
then
    echo "testID: bltzal_bt.bin, Instr: BLTZAL, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: branch returned to correct place " | paste -sd ' ' >> ./test/output/"$dt"
elif test $? = 3
then
    echo "testID: bltzal_bt.bin, Instr: BLTZAL, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: Returned to delay slot instr instead of one in front or no branch occured, see bgez_bt, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: bltzal_bt.bin, Instr: BLTZAL, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: No idea why it failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/bne_bt.bin")
if test $? = 1
then
    echo "testID: bne_bt.bin, Instr: BNE, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: ----, " | paste -sd ' ' >> ./test/output/"$dt"
elif test $? = 2
then
    echo "testID: bne_bt.bin, Instr: BNE, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: Branched relative to branch instr not the delay slot instr, " | paste -sd ' ' >> ./test/output/"$dt"
elif test $? = 0
then
    echo "testID: bne_bt.bin, Instr: BNE, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: No branch occured, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: bne_bt.bin, Instr: BNE, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: No idea why it failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/j_ds.bin")
if test $? = 1
then
    echo "testID: j_ds.bin, Instr: J, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: ----, " | paste -sd ' ' >> ./test/output/"$dt"
elif test $? = 0
then
    echo "testID: j_ds.bin, Instr: J, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: Delay slot instr not executing, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: j_ds.bin, Instr: J, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: No idea why it failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/jal_bt.bin")
if test $? = 3
then
    echo "testID: jal_bt.bin, Instr: JAL, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: link returns to correct place, " | paste -sd ' ' >> ./test/output/"$dt"
elif test $? = 4
then
    echo "testID: jal_bt.bin, Instr: JAL, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: link returns to delay slot instr (not correct return address), " | paste -sd ' ' >> ./test/output/"$dt"
elif test $? = 2
then
    echo "testID: jal_bt.bin, Instr: JAL, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: link returns to instr 2 after the delays slot instr (too far), " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: jal_bt.bin, Instr: JAL, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: not sure hats wrong here, " | paste -sd ' ' >> ./test/output/"$dt"

fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/jalr_bt.bin")
if test $? = 3
then
    echo "testID: jalr_bt.bin, Instr: JALR, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: link returns to correct place, " | paste -sd ' ' >> ./test/output/"$dt"
elif test $? = 4
then
    echo ass
    echo "testID: jalr_bt.bin, Instr: JALR, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: link returns to delay slot instr (not correct return address), " | paste -sd ' ' >> ./test/output/"$dt"
elif test $? = 2
then
    echo "testID: jalr_bt.bin, Instr: JALR, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: link returns to instr 2 after the delays slot instr (too far), " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: jalr_bt.bin, Instr: JALR, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: not sure hats wrong here, " | paste -sd ' ' >> ./test/output/"$dt"

fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/jr_bt.bin")
if test $? = 0
then
    echo "testID: jr_bt.bin, Instr: JR, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: ----, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: jr_bt.bin, Instr: JR, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: No idea why it failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/j_bt.bin")
if test $? = 0
then
    echo "testID: j_bt.bin, Instr: J, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: ----, " | paste -sd ' ' >> ./test/output/"$dt"
elif test $? = 1
then
    echo "testID: j_bt.bin, Instr: J, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: Jump went one instruction too far, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: j_bt.bin, Instr: J, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: No idea why it failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/lbu_bt.bin")
if test $? = 16
then
    echo "testID: lbu_bt.bin, Instr: LBU, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: loads correct byte without sign extension, " | paste -sd ' ' >> ./test/output/"$dt"
elif test $? = 240
then
    echo "testID: lbu_bt.bin, Instr: LBU, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: loads correct byte but has sign extension, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: lbu_bt.bin, Instr: LBU, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: loads wrong byte, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/lbu_ov.bin")
if test $? = 245
then
    echo "testID: lbu_ov.bin, Instr: LBU, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: catces out of range memory loading, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: lbu_ov.bin, Instr: LBU, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: doesn't catch trying to load out of range mem, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/lb_bt.bin")
if test $? = 240
then
    echo "testID: lb_bt.bin, Instr: LB, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: loads correct byte with sign extension, " | paste -sd ' ' >> ./test/output/"$dt"
elif test $? = 16
then
    echo "testID: lb_bt.bin, Instr: LB, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: loads correct byte but has no sign extension, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: lb_bt.bin, Instr: LB, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: loads wrong byte, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/lb_ov.bin")
if test $? = 245
then
    echo "testID: lb_ov.bin, Instr: LB, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: catces out of range memory loading, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: lb_ov.bin, Instr: LB, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: doesn't catch trying to load out of range mem, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(echo á | sudo ./bin/mips_simulator "test_binaries/lb_i.bin")
if test $? = 1
then
    echo "testID: lb_i.bin, Instr: LB, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: takes user input correctly, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: lb_i.bin, Instr: LB, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: didnt take user input correctly, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(echo á | sudo ./bin/mips_simulator "test_binaries/lb_i_zero.bin")
if test $? = 0
then
    echo "testID: lb_i_zero.bin, Instr: LB, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: takes user input correctly and only loads lsB of the mem word, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: lb_i_zero.bin, Instr: LB, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: doesn't only load from lsB of mem word, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/lhu_bt.bin")
if test $? = 16
then
    echo "testID: lhu_bt.bin, Instr: LHU, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: loads correct byte without sign extension, " | paste -sd ' ' >> ./test/output/"$dt"
elif test $? = 240
then
    echo "testID: lhu_bt.bin, Instr: LHU, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: loads correct byte but has sign extension, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: lhu_bt.bin, Instr: LHU, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: loads wrong byte, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/lhu_unaligned.bin")
if test $? = 245
then
    echo "testID: lhu_unaligned.bin, Instr: LHU, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: detects unaligned address correctly, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: lhu_unaligned.bin, Instr: LHU, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: doesn't catch unaligned sequence, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/lhu_ov.bin")
if test $? = 245
then
    echo "testID: lhu_ov.bin, Instr: LHU, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: catces out of range memory loading, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: lhu_ov.bin, Instr: LHU, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: doesn't catch trying to load out of range mem, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/lh_bt.bin")
if test $? = 240
then
    echo "testID: lh_bt.bin, Instr: LH, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: loads correct byte with sign extension, " | paste -sd ' ' >> ./test/output/"$dt"
elif test $? = 16
then
    echo "testID: lh_bt.bin, Instr: LHU, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: loads correct byte but has no sign extension, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: lh_bt.bin, Instr: LHU, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: loads wrong byte, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/lh_unaligned.bin")
if test $? = 245
then
    echo "testID: lh_unaligned.bin, Instr: LH, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: detects unaligned address correctly, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: lh_unaligned.bin, Instr: LH, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: doesn't catch unaligned sequence, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/lh_ov.bin")
if test $? = 245
then
    echo "testID: lh_ov.bin, Instr: LH, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: catces out of range memory loading, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: lh_ov.bin, Instr: LH, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: doesn't catch trying to load out of range mem, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/sb_o.bin") #broken still

OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/lui_bt.bin")
if test $? = 1
then
    echo "testID: lui_bt.bin, Instr: LUI, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: loads correct immediate, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: lui_bt.bin, Instr: LUI, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: No idea why it failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/lw_byte_0.bin")
if test $? = 64
then
    echo "testID: lw_byte_0.bin, Instr: LW, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: ----, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: lw_byte_0.bin, Instr: LW, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: LSB of word was incorrect when loaded, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/lw_byte_1.bin")
if test $? = 48
then
    echo "testID: lw_byte_1.bin, Instr: LW, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: ----, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: lw_byte_1.bin, Instr: LW, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: B1 of word was incorrect when loaded, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/lw_byte_2.bin")
if test $? = 32
then
    echo "testID: lw_byte_2.bin, Instr: LW, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: ----, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: lw_byte_2.bin, Instr: LW, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: LSB of word was incorrect when loaded, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/lw_byte_3.bin")
if test $? = 16
then
    echo "testID: lw_byte_3.bin, Instr: LW, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: ----, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: lw_byte_3.bin, Instr: LW, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: MSB of word was incorrect when loaded, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/lw_unaligned.bin")
if test $? = 245
then
    echo "testID: lw_unaligned.bin, Instr: LW, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: ----, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: lw_unaligned.bin, Instr: LW, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: doesn't stop loading of words at unaligned addresses, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/lw_ov.bin")
if test $? = 245
then
    echo "testID: lw_ov.bin, Instr: LW, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: catces out of range memory loading, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: lw_ov.bin, Instr: LW, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: doesn't catch trying to load out of range mem, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/sb_bt.bin")
if test $? = 64
then
    echo "testID: sb_bt.bin, Instr: SB, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: stores right part of word and puts it in the right place in mem, " | paste -sd ' ' >> ./test/output/"$dt"
elif test $? = 48
then
    echo "testID: sb_bt.bin, Instr: SB, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: stores wrong part of the word but put it in right place in mem, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: sb_bt.bin, Instr: SB, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: stores wrong part of the word and/or put it in wrong place in mem, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/sb_ov.bin")
if test $? = 245
then
    echo "testID: sb_ov.bin, Instr: SB, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: catches storing to wrong mem, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: sb_ov.bin, Instr: SB, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: not sure why it wrong sorry, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/sb_instr.bin")
if test $? = 245
then
    echo "testID: sb_instr.bin, Instr: SB, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: catches writing to instruction mem, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: sb_instr.bin, Instr: SB, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: not sure why it wrong sorry, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/sh_ov.bin")
if test $? = 245
then
    echo "testID: sh_ov.bin, Instr: SH, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: catces out of range memory loading, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: sh_ov.bin, Instr: SH, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: doesn't catch trying to load out of range mem, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/lw_sw_bt.bin")
if test $? = 0
then
    echo "testID: lw_sw_bt.bin, Instr: SW, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: ----, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: lw_sw_bt.bin, Instr: SW, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: No idea why it failed, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/sw_unaligned.bin")
if test $? = 245
then
    echo "testID: sw_unaligned.bin, Instr: SW, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi), Notes: ----, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: sw_unaligned.bin, Instr: SW, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: doesn't stop loading of words at unaligned addresses, " | paste -sd ' ' >> ./test/output/"$dt"
fi
OUTPUT=$(sudo ./bin/mips_simulator "test_binaries/sw_ov.bin")
if test $? = 245
then
    echo "testID: sw_ov.bin, Instr: SW, Status: PASS, Author: Silvertrousers (Cyrus Goodarzi)Notes: catces out of range memory loading, " | paste -sd ' ' >> ./test/output/"$dt"
else
    echo "testID: sw_ov.bin, Instr: SW, Status: FAIL, Author: Silvertrousers (Cyrus Goodarzi), Notes: doesn't catch trying to load out of range mem, " | paste -sd ' ' >> ./test/output/"$dt"
fi

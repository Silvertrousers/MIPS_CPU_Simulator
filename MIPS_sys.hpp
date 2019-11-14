#include <iostream>
#include <cstdlib>
#include <fstream>
#include "memory.hpp"
#include "instruction.hpp"
//#ifndef MIPS_sys_hpp
//#define MIPS_sys_hpp

class MIPS_sys{
  public://after testing change all member variables to private
    memory null = memory(0,0);
    memory instruction_mem = memory(0x10000000, 0x01000000);
    memory data_mem = memory(0x20000000, 0x04000000);
    memory in_mem = memory(0x30000000, 0x00000004);
    memory out_mem = memory(0x30000004, 0x00000004);

    //division and multipication registers can only be accesses by mfhi nd mflo instructions
    int32_t hi;
    int32_t lo;
    //needs access to instruction class

    std::vector<uint32_t> registers;
    uint32_t pc; //equal to the address of the current instruction being run

    MIPS_sys();
    void increment_pc(const uint32_t &offset = 0);
    int sign_extend(int n, int length);
    void store_b_in_mem(const uint32_t &t, const uint32_t &base, const int &offset);
    void store_hw_in_mem(const uint32_t &t, const uint32_t &base, const int &offset);
    void ld_inst(const char* filename);
    void instruction_look_up(const instruction &instr);
    bool in_data_mem(int addr);
    bool in_instruction_mem(int addr);
    bool in_in_mem(int addr);
    bool in_out_mem(int addr);
    //instructions

    void add(const int32_t &s, const int32_t &t, const int32_t &d);
    void addi(const int32_t &s, const int32_t &t, const uint32_t &i);
    void addiu(const int32_t &s, const int32_t &t, const uint32_t &i);
    void addu(const int32_t &s, const int32_t &t, const int32_t &d);
    void and_(const int32_t &s, const int32_t &t, const int32_t &d);
    void andi(const int32_t &s, const int32_t &t, const uint32_t &i);

    void beq(const int &s, const int &t, const int &offset);
    void bgez(const uint32_t &s, const int &offset);
    void bgezal(const uint32_t &s, const int &offset);
    void bgtz(const uint32_t &s, const int &offset);
    void blez(const uint32_t &s, const int &offset);
    void bltz(const uint32_t &s, const int &offset);
    void bltzal(const uint32_t &s, const int &offset);
    void bne(const uint32_t &s, const uint32_t &t, const int &offset);

    void div(const int32_t &s, const int32_t &t);
    void divu(const int32_t &s, const int32_t &t);

    void j(const uint32_t &offset);
    void jalr(const uint32_t &d, const uint32_t &s);
    void jal(const uint32_t &offset);
    void jr(const uint32_t &s);
    void lb(const uint32_t &t, const uint32_t &base, const int &off);
    void lbu(const uint32_t &t, const uint32_t &base, const int &off);
    void lh(const uint32_t &t, const uint32_t &base, const int &offset);
    void lhu(const uint32_t &t, const uint32_t &base, const int &offset);
    void lui(const uint32_t &t, const uint32_t &i);
    void lw(const uint32_t &t, const uint32_t &base, const int &offset);
    void lwl(const uint32_t &t, const uint32_t &base, const int &offset);
    void lwr(const uint32_t &t, const uint32_t &base, const int &offset);

    void mfhi(const int32_t &d);
    void mflo(const int32_t &d);
    void mthi(const int32_t &s);
    void mtlo(const int32_t &s);

    void mult(const int32_t &s, const int32_t &t);
    void multu(const int32_t &s, const int32_t &t);
    void or_(const int32_t &s, const int32_t &t, const int32_t &d);
    void ori(const int32_t &s, const int32_t &t, const uint32_t &i);

    void sb(const uint32_t &t, const uint32_t &base, const int &offset);
    void sh(const uint32_t &t, const uint32_t &base, const int &offset);

    void sll(const int32_t &t, const int32_t &d, const uint32_t &shamt);
    void sllv(const int32_t &s, const int32_t &t, const int32_t &d);
    void slt(const int32_t &s, const int32_t &t, const int32_t &d);
    void slti(const int32_t &s, const int32_t &t, const uint32_t &i);
    void sltiu(const int32_t &s, const int32_t &t, const uint32_t &i);
    void sltu(const int32_t &s, const int32_t &t, const int32_t &d);
    void sra(const int32_t &t, const int32_t &d, const uint32_t &shamt);
    void srav(const int32_t &s, const int32_t &t, const uint32_t &shamt);
    void srl(const int32_t &t, const int32_t &d, const uint32_t &shamt);
    void srlv(const int32_t &s, const int32_t &t, const int32_t &d);

    void sw(const uint32_t &t, const uint32_t &base, const int &offset);

    void sub(const int32_t &s, const int32_t &t, const int32_t &d);
    void subu(const int32_t &s, const int32_t &t, const int32_t &d);
    void xor_(const int32_t &s, const int32_t &t, const int32_t &d);
    void xori(const int32_t &s, const int32_t &t, const uint32_t &i);
};

//#endif

#include "memory_fn.cpp"

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
    int32_t HI;
    int32_t LO;
    //needs access to instruction class

    std::vector<int> registers;
    uint32_t pc;

    MIPS_sys();
    void increment_pc(const uint32_t &offset = 0);
    int sign_extend(int n, int length);
    void store_b_in_mem(const uint32_t &t, const uint32_t &base, const int &offset);
    void store_hw_in_mem(const uint32_t &t, const uint32_t &base, const int &offset);
    void ld_inst(const char* filename);
    //instructions

    void beq(const int &s, const int &t, const int &offset);
    void bgez(const uint32_t &s, const int &offset);
    void bgezal(const uint32_t &s, const int &offset);
    void bgtz(const uint32_t &s, const int &offset);
    void blez(const uint32_t &s, const int &offset);
    void bltz(const uint32_t &s, const int &offset);
    void bltzal(const uint32_t &s, const int &offset);
    void bne(const uint32_t &s, const uint32_t &t, const int &offset);

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

    void sb(const uint32_t &t, const uint32_t &base, const int &offset);
    void sh(const uint32_t &t, const uint32_t &base, const int &offset);
    void sw(const uint32_t &t, const uint32_t &base, const int &offset);
};

//#endif

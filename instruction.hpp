#include <iostream>

class instruction{
  private:
    uint32_t code;
    int type;
    int instr_no;

    int rs;
    int rt;
    int rd;
    int shamt;
    uint32_t immediate;
    uint32_t address;
  public:
    instruction(int in);
    void run(system s);
    void r_type();
    void i_type();
    void j_type();
}

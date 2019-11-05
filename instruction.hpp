#include <iostream>

class instruction{
  private:
    uint32_t code;
    int type;
    int instr_no;

    int s;
    int t;
    int d;
    int shamt;
    uint32_t i;
    uint32_t address;
  public:
    instruction(int in);
    void run();
    void r_type();
    void i_type();
    void j_type();
}

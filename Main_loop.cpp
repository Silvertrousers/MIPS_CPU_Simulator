#include <iostream>
#include <cstdlib>
//#include <stdio.h>
#include <vector>
#include <cmath>
#include <string>
#include <fstream>
#include "MIPS_sys.hpp"

//#include "MIPS_sys.hpp"
//#include "memory_fn.cpp"
void display_data_byte(MIPS_sys s, int base, int offset);
void display_out_byte(MIPS_sys s, int base, int offset);
void display_inst_byte(MIPS_sys s);
int word_conc(MIPS_sys s, int msb_addr);
void put_data(MIPS_sys &s, int addr, int num);
void display_state(MIPS_sys s);
bool checker(const instruction &instr, MIPS_sys s);

int main(int argc, char *argv[] ){
  int print = 0; //argv 2 is a bool that allows printing if true
  MIPS_sys s = MIPS_sys(); //define the system initial state
  instruction inst, inst_delay_slot;//inst_ds is reserved for delay slot instructions
  s.ld_inst(argv[1]);
  int last_instr_addr = s.instruction_mem.data[s.instruction_mem.data.size() - 1].address;
  if(print){
    std::cerr<<*argv[1]<<std::endl;
    display_inst_byte(s);
    std::cerr<<"Binary Loaded into memory"<<std::endl<<std::endl;
    std::cerr<<"program executing..."<<std::endl;
  }
  s.pc -= 4;
  while(s.pc != 0){//go instruction by instruction until jump to 0, only works if i have a valid .bin file
    s.registers[0] = 0;//makes sure r0 is always 0
    s.pc += 4;
    if(s.pc != 0){
      if((0x10000000 <= s.pc) && (s.pc <= last_instr_addr)){//checks if pc is looking at correct memory location
        inst = instruction(word_conc(s, s.pc)); //look at the instruction at the memory location indicaated by pc
        inst_delay_slot = instruction(word_conc(s, s.pc + 4));
        if(print){
          std::cerr<<"pc: "<<std::hex<<(s.pc)<<", instruction word: "<<std::hex<<word_conc(s, s.pc)<<std::endl;
        }
        inst.run();
        inst_delay_slot.run();
        if(((inst.instr_no >= 7) && (inst.instr_no <= 14)) || ((inst.instr_no >= 17) && (inst.instr_no <= 20))){
          if(((inst_delay_slot.instr_no >= 7) && (inst_delay_slot.instr_no <= 14)) || ((inst_delay_slot.instr_no >= 17) && (inst_delay_slot.instr_no <= 20))){
            std::exit(-13);//-13 exit code says that there was a double jump
          }
          else{
            checker(inst_delay_slot, s);
            s.instruction_look_up(inst_delay_slot);
            s.registers[0] = 0;//makes sure r0 is always 0

            if(print){std::cerr<<"delay_slot: "<<std::endl; display_state(s);}
          }
        }
        checker(inst, s);
        s.instruction_look_up(inst);
      }
      else{
        std::exit(-11);//if pc goes too high, return memory error since trying to execute from wrong part of mem
      }
    }
    if(print){display_state(s);}
  }
  if(print){std::cerr<<"result (lsB of r2): "<<std::hex<<(s.registers[2])<<std::endl;}
  std::exit(s.registers[2] & 0x000000FF);
  return s.registers[2] & 0x000000FF;
}


void display_data_byte(MIPS_sys s, int base, int offset){
  for(int i=0; i<s.data_mem.data.size(); i++){
    if(s.data_mem.data[i].address == (offset+base)){
      std::cerr<<"addr: "<<std::hex<<s.data_mem.data[i].address<<std::endl;
      std::cerr<<"val: "<<std::hex<<s.data_mem.data[i].val<<std::endl;
    }
  }
}
void display_out_byte(MIPS_sys s, int base, int offset){
  for(int i=0; i<s.out_mem.data.size(); i++){
    if(s.out_mem.data[i].address == (offset+base)){
      std::cerr<<"addr: "<<std::hex<<s.out_mem.data[i].address<<std::endl;
      std::cerr<<"val: "<<std::hex<<s.out_mem.data[i].val<<std::endl;
    }
  }
}

void display_inst_byte(MIPS_sys s){
  std::cerr<<s.instruction_mem.data.size()<<std::endl;
  for(int i=0; i<s.instruction_mem.data.size(); i++){
      std::cerr<<"addr: "<<std::hex<<s.instruction_mem.data[i].address<<", val: "<<std::hex<<s.instruction_mem.data[i].val<<std::endl;
    }
  }
int word_conc(MIPS_sys s, int msb_addr){
  int b3, b2, b1, b0;
  b3 = (s.instruction_mem.data[msb_addr - 0x10000000].val) << 24;
  b2 = (s.instruction_mem.data[msb_addr - 0x10000000 + 1].val) << 16;
  b1 = (s.instruction_mem.data[msb_addr - 0x10000000 + 2].val) << 8;
  b0 = (s.instruction_mem.data[msb_addr - 0x10000000 + 3].val);

  return (((b3 | b2) | b1) | b0);
}
void put_data(MIPS_sys &s, int addr, int num){
  byte b;
  b.val =num;
  b.address = addr;
  s.data_mem.data.push_back(b);
}

void display_state(MIPS_sys s){
  for(int i=0; i<s.data_mem.data.size(); i++){
    std::cerr<<"addr: "<<s.data_mem.data[i].address<<", val: "<<s.data_mem.data[i].val<<std::endl;
  }
  for(int j=0; j<s.registers.size(); j++){
    std::cerr<<s.registers[j]<<", ";
  }
  std::cerr<<std::endl;
}

bool checker(const instruction &instr, MIPS_sys s){
  int64_t result;
  int32_t x1, x2;
  if (instr.instr_no == 0){
    std::exit(-12);
  }
  switch(instr.instr_no){
    // for all instructions that write to regisers, if rd is r0, set the value being written(no matter what it is) to zero
    //for all brnch and jump instructions make sure the offset + base is located in the instruction memory
    case 1: //add integer overflow, destination wrong
      x1 = s.registers[instr.s];
      x2 = s.registers[instr.t];
      result = x1 + x2;
      if (x1 > 0 && x2 > 0 && result < 0){
        std::exit(-10);
      }
      if (x1 < 0 && x2 < 0 && result > 0){
        std::exit(-10);
      }
      return true;
    case 2: //addi
      x1 = s.registers[instr.s];
      x2 = instr.i;
      result = x1 + x2;
      if (x1 > 0 && x2 > 0 && result < 0){
        std::exit(-10);
      }
      if (x1 < 0 && x2 < 0 && result > 0){
        std::exit(-10);
      }
      return true;
    case 3: //addiu
      return true;
    case 4: //addu
      return true;
    case 5://and:
      return true;
    case 6://andi:
      return true;
    case 7://beq:
      if((0x10000000 <= (s.pc + (instr.i << 2))) && ((s.pc + (instr.i << 2)) < 0x11000000)){
        return true;
      }
      std::exit(-11);
    case 8://bgez:
      if((0x10000000 <= (s.pc + (instr.i << 2))) && ((s.pc + (instr.i << 2)) < 0x11000000)){
        return true;
      }
      std::exit(-11);
    case 9://bgezal:
      if((0x10000000 <= (s.pc + (instr.i << 2))) && ((s.pc + (instr.i << 2)) < 0x11000000)){
        return true;
      }
      std::exit(-11);
    case 10://bgtz:
      if((0x10000000 <= (s.pc + (instr.i << 2))) && ((s.pc + (instr.i << 2)) < 0x11000000)){
        return true;
      }
      std::exit(-11);
    case 11://blez:
      if((0x10000000 <= (s.pc + (instr.i << 2))) && ((s.pc + (instr.i << 2)) < 0x11000000)){
        return true;
      }
      std::exit(-11);
    case 12://bltz:
      if((0x10000000 <= (s.pc + (instr.i << 2))) && ((s.pc + (instr.i << 2)) < 0x11000000)){
        return true;
      }
      std::exit(-11);
    case 13://bltzal:
      if((0x10000000 <= (s.pc + (instr.i << 2))) && ((s.pc + (instr.i << 2)) < 0x11000000)){
        return true;
      }
      std::exit(-11);
    case 14://bne:
      if((0x10000000 <= (s.pc + (instr.i << 2))) && ((s.pc + (instr.i << 2)) < 0x11000000)){
        return true;
      }
      std::exit(-11);
    case 15: //div
      return true;
    case 16: //divu
      return true;


    //case 27://lwl:
    //need to finish implementation
    //case 28://lwr:
    //need to finish implementation
    case 29: //mfhi
      return true;
    case 30: //mflo
      return true;
    case 31: //mthi
      return true;
    case 32: //mtlo
      return true;
    case 33: //mult
      return true;
    case 34: //multu
      return true;
    case 35: //or
      return true;
    case 36: //ori
      return true;
    case 39: //sll
      return true;
    case 40: //sllv
      return true;
    case 41: //slt
      return true;
    case 42: //slti
      return true;
    case 43: //sltiu
      return true;
    case 44: //sltu
      return true;
    case 45: //sra
      return true;
    case 46: //srav
      return true;
    case 47: //srl
      return true;
    case 48: //srlv
      return true;
    case 49: //sub
      x1 = s.registers[instr.s];
      x2 = -s.registers[instr.t];
      result = x1 + x2;
      if (x1 > 0 && x2 > 0 && result < 0){
        std::exit(-10);
      }
      if (x1 < 0 && x2 < 0 && result > 0){
        std::exit(-10);
      }
      return true;
    case 50: //subu
      x1 = s.registers[instr.s];
      x2 = -instr.i;
      result = x1 + x2;
      if (x1 > 0 && x2 > 0 && result < 0){
        std::exit(-10);
      }
      if (x1 < 0 && x2 < 0 && result > 0){
        std::exit(-10);
      }
      return true;
    case 52: //xor
      return true;
    case 53: //xori
      return true;
}
}

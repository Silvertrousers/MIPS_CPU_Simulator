/*int main(){
  for line in input file{
    put line into memory location
  }
  set PC to address of first memory locaiton

  for(instructions in memory){
    get instruction from where PC is pointing (PC + offset gives instruction location address);

    Opcode = instruction[26:31];

    if(opcode == 0 (instruction is R type)){
      int source_1, source_2, destination, shift, fn_code;

      s1 = instruction[21:25];
      s2 = instruction[16:20];
      destination = instruction[11:15];
      shift = instruction[6:10];
      fn_code = instruction[0:5];

      if(add){
        value in destination = s1 + s2;
      }s
      so on and so forth
    }

    PC+=4;
  }
}
*/
#include<iostream>
#include<stdlib.h>
#include<stdio.h>
#include <vector>
#include <cmath>
#include <fstream>
#include "MIPS_sys_fn.cpp"
//#include "MIPS_sys.hpp"
//#include "memory_fn.cpp"
void display_data_byte(MIPS_sys s, int base, int offset);
void display_out_byte(MIPS_sys s, int base, int offset);
void display_inst_byte(MIPS_sys s);

int main(){
  MIPS_sys s = MIPS_sys();
  s.registers[9] = 0xF8F8F8F8;
  s.registers[1] = 0x44;
  byte a,b;

  b.val = 0x0;
  b.address = 0x20000000;
  s.data_mem.data.push_back(b);
  b.val = 0x0;
  b.address = 0x20000001;
  s.data_mem.data.push_back(b);
  b.val = -1;
  b.address = 0x20000002;
  s.data_mem.data.push_back(b);
  b.val = -1;
  b.address = 0x20000003;
  s.data_mem.data.push_back(b);

  b.val = 1;
  b.address = 0x30000000;
  s.in_mem.data.push_back(b);
  b.val = 0;
  b.address = 0x30000001;
  s.in_mem.data.push_back(b);
  b.val = 0;
  b.address = 0x30000002;
  s.in_mem.data.push_back(b);
  b.val = 0;
  b.address = 0x30000003;
  s.in_mem.data.push_back(b);

  b.val = 0;
  b.address = 0x30000004;
  s.out_mem.data.push_back(b);
  b.val = 0;
  b.address = 0x30000005;
  s.out_mem.data.push_back(b);
  b.val = 0;
  b.address = 0x30000006;
  s.out_mem.data.push_back(b);
  b.val = 0;
  b.address = 0x30000007;
  s.out_mem.data.push_back(b);
  //std::cout<<s.pc<<std::endl;
  s.ld_inst("instructions.bin");

  //std::cout<<s.registers[9]<<std::endl;
  display_inst_byte(s);

  return 0;
}
void display_data_byte(MIPS_sys s, int base, int offset){
  for(int i=0; i<s.data_mem.data.size(); i++){
    if(s.data_mem.data[i].address == (offset+base)){
      std::cout<<"addr: "<<s.data_mem.data[i].address<<std::endl;
      std::cout<<"val: "<<s.data_mem.data[i].val<<std::endl;
    }
  }
}
void display_out_byte(MIPS_sys s, int base, int offset){
  for(int i=0; i<s.out_mem.data.size(); i++){
    if(s.out_mem.data[i].address == (offset+base)){
      std::cout<<"addr: "<<s.out_mem.data[i].address<<std::endl;
      std::cout<<"val: "<<s.out_mem.data[i].val<<std::endl;
    }
  }
}

void display_inst_byte(MIPS_sys s){
  for(int i=0; i<s.instruction_mem.data.size(); i++){
    std::cout<<s.instruction_mem.data.size()<<std::endl;
      std::cout<<"addr: "<<s.instruction_mem.data[i].address<<std::endl;
      std::cout<<"val: "<<s.instruction_mem.data[i].val<<std::endl;
    }
  }

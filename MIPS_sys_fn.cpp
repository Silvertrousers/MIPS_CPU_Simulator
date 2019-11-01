#include <iostream>
#include "MIPS_sys.hpp"
//The MIPS processors execute the jump or branch instruction and
//the delay slot instruction as an indivisible unit.
//If an exception occurs as a result of executing the delay slot instruction,
//the branch or jump instruction is not executed, and the exception appears to have
//been caused by the jump or branch instruction.

MIPS_sys::MIPS_sys(){
  pc = 0; //pc offset respresents index of instruction memory vector;

  for(int i=0; i<32; i++){
    registers.push_back(0);
  }
}

void MIPS_sys::increment_pc(const uint32_t &offset /* = 0*/ ){
  pc += 4 + offset;
}

void MIPS_sys::ld_inst(const char* filename){
  char* buffer;
  byte temp;
  long size;
  std::ifstream file (filename, std::ios::in|std::ios::binary|std::ios::ate);
  if(file.is_open()){
    size = file.tellg();
    file.seekg (0, std::ios::beg);

    buffer = new char [size];
    file.read (buffer, size);
    file.close();
    for(int i=0;i<size;i++){
      std::cout<<"ass "<<temp.val<<std::endl;
      temp.val = buffer[i];
      std::cout<<"ass "<<temp.val<<std::endl;
      temp.address = i + 1;
      instruction_mem.data.push_back(temp);
    }
  }
  else{
    std::cout<<"Stop, "<<filename<<" wasn't opened"<<std::endl;
  }

  delete[] buffer;
}


//Instructions
//http://www.mrc.uidaho.edu/mrc/people/jff/digital/MIPSir.html
//https://inst.eecs.berkeley.edu/~cs61c/resources/MIPS_Green_Sheet.pdf
//https://github.com/m8pple/arch2-2019-cw

//all instructions will without u at the end will treat operands and two's complement
//those with the U i.e. ADDU, treat them as unsigned integers
//signed arithmetic operations can result in overflow and so the signed instructions will trap the overflow(throw an exception when it happens)
//the unsigned operations will ignore it

// to find overlfow, if the sgned bit of result
void MIPS_sys::beq(const int &s, const int &t, const int &offset){
  //delay slot
  pc += 4;
  //run(next instruction)
  if(registers[s] == registers[t]){
    pc += sign_extend(offset, 16) << 2;//branch time
  }
}
void MIPS_sys::bgez(const uint32_t &s, const int &offset){
  //delay slot
  pc += 4;
  //run(next instruction)
  if(registers[s] >= 0){
    pc += sign_extend(offset, 16) << 2;//branch time
  }
}
void MIPS_sys::bgezal(const uint32_t &s, const int &offset){
  registers[31] = pc + 8;
  //delay slot
  bgez(s, offset);
}
void MIPS_sys::bgtz(const uint32_t &s, const int &offset){
  //delay slot
  pc += 4;
  //run(next instruction)
  if(registers[s] > 0){
    pc += sign_extend(offset, 16) << 2;//branch time
  }
}
void MIPS_sys::blez(const uint32_t &s, const int &offset){
  //delay slot
  pc += 4;
  //run(next instruction)
  if(registers[s] <= 0){
    pc += sign_extend(offset, 16) << 2;//branch time
  }
}
void MIPS_sys::bltz(const uint32_t &s, const int &offset){
  //delay slot
  pc += 4;
  //run(next instruction)
  if(registers[s] < 0){
    pc += sign_extend(offset, 16) << 2;//branch time
  }
}
void MIPS_sys::bltzal(const uint32_t &s, const int &offset){
  registers[31] = pc + 8;
  //delay slot
  bltz(s, offset);
}
void MIPS_sys::bne(const uint32_t &s, const uint32_t &t, const int &offset){
  //delay slot
  pc += 4;
  //run(next instruction)
  if(registers[s] != registers[t]){
    pc += sign_extend(offset, 16) << 2;//branch time
  }
}

void MIPS_sys::j(const uint32_t &offset){
  int top_4_bits =(instruction_mem.data[pc + 4].address + 0x00000000) & 0xF0000000;
  int bttm_28_bits = offset << 2;
  //delay slot
  pc += 4;
  //run(next instruction)
  pc = top_4_bits | bttm_28_bits;
}

void MIPS_sys::jalr(const uint32_t &d, const uint32_t &s){
  registers[d] = pc + 8;
  //delay slot
  pc += 4;
  //run(next instruction)
  pc = registers[s];
}
void MIPS_sys::jal(const uint32_t &offset){
  registers[31] = pc + 8;
  j(offset);
}
void MIPS_sys::jr(const uint32_t &s){
  //delay slot
  pc += 4;
  //run(next instruction)
  pc = registers[s];
}

void MIPS_sys::lb(const uint32_t &t, const uint32_t &base, const int &off){
  int in;
  registers[t] = 0;
  int offset = sign_extend(off, 16);
  if((data_mem.offset <= (offset + base)) && ((offset+base) < (data_mem.offset + data_mem.length))){

    for(int i=0; i < data_mem.data.size(); i++){
      if((offset+base) == data_mem.data[i].address){
        registers[t] = sign_extend(data_mem.data[i].val, 8);
      }
    }
  }
  else if((in_mem.offset <= (offset + base)) && ((offset+base) < (in_mem.offset + in_mem.length))){
    for(int j=0; j < in_mem.data.size(); j++){
      if((offset+base) == in_mem.data[j].address){
        std::cin >> in;
        in = in & 0x000000FF;
        in_mem.data[j].val = sign_extend(in, 8);
      }
    }
  }
}
void MIPS_sys::lbu(const uint32_t &t, const uint32_t &base, const int &off){
  int in;
  registers[t] = 0;
  int offset = sign_extend(offset, 16);
  if((data_mem.offset <= (offset + base)) && ((offset+base) < (data_mem.offset + data_mem.length))){
    for(int i=0; i < data_mem.data.size(); i++){
      if((offset+base) == data_mem.data[i].address){
        registers[t] = (data_mem.data[i].val & 0x000000FF);
      }
    }
  }
  else if((in_mem.offset <= (offset + base)) && ((offset+base) < (in_mem.offset + in_mem.length))){
    for(int j=0; j < in_mem.data.size(); j++){
      if((offset+base) == in_mem.data[j].address){
        std::cin >> in;
        in_mem.data[j].val = in & 0x000000FF;
        registers[t] = 0x00000000 | in_mem.data[j].val;
        }
      }
    }
  }
void MIPS_sys::lh(const uint32_t &t, const uint32_t &base, const int &offset){
  int in;
  if((data_mem.offset <= (offset + base)) && ((offset+base) < (data_mem.offset + data_mem.length))){
    lb(t, base, offset);
    registers[t] = registers[t] << 8;
    lbu(0, base, offset + 1);
    registers[t] += registers[0];
  }
  else if((in_mem.offset <= (offset + base)) && ((offset+base) < (in_mem.offset + in_mem.length))){
    for(int j=0; j < in_mem.data.size(); j++){
      if((offset+base) == in_mem.data[j].address){
        std::cin >> in;
        in = in & 0x0000FFFF;
        in_mem.data[j].val = sign_extend(in, 16);
      }
    }
  }
  registers[0] = 0;
}
void MIPS_sys::lhu(const uint32_t &t, const uint32_t &base, const int &offset){
  int in;
  if((data_mem.offset <= (offset + base)) && ((offset+base) < (data_mem.offset + data_mem.length))){
    lbu(t, base, offset);
    registers[t] = registers[t] << 8;
    lbu(0, base, offset + 1);
    registers[t] += registers[0];
    }
  else if((in_mem.offset <= (offset + base)) && ((offset+base) < (in_mem.offset + in_mem.length))){
    for(int j=0; j < in_mem.data.size(); j++){
      if((offset+base) == in_mem.data[j].address){
        std::cin >> in;
        in = in & 0x0000FFFF;
        in_mem.data[j].val = in & 0x0000FFFF;
        registers[t] = in_mem.data[j].val;
      }
    }
  }
  registers[0] = 0;
}

void MIPS_sys::lui(const uint32_t &t, const uint32_t &i){
  registers[t] =  i << 16;
}
void MIPS_sys::lw(const uint32_t &t, const uint32_t &base, const int &offset){
  int in;
  if((data_mem.offset <= (offset + base)) && ((offset+base) < (data_mem.offset + data_mem.length))){
    lhu(t, base, offset);
    registers[t] = registers[t] << 16;
    lhu(1, base, offset + 2);
    registers[t] += registers[1];
    }
  else if((in_mem.offset <= (offset + base)) && ((offset+base) < (in_mem.offset + in_mem.length))){
    for(int j=0; j < in_mem.data.size(); j++){
      if((offset+base) == in_mem.data[j].address){
        std::cin >> in;
        in_mem.data[j].val = in;
        registers[t] = in_mem.data[j].val;
      }
    }
  }
  registers[0] = 0;
}
void MIPS_sys::lwl(const uint32_t &t, const uint32_t &base, const int &offset){
  int temp = registers [t] & 0x0000FFFF;
  lw(t, base, offset);
  registers[t] = (registers[t] & 0xFFFF0000) | temp;
}
void MIPS_sys::lwr(const uint32_t &t, const uint32_t &base, const int &offset){
  int temp = registers [t] & 0xFFFF0000;
  lw(t, base, offset);
  registers[t] = (registers[t] & 0x0000FFFF) | temp;
}
void MIPS_sys::sb(const uint32_t &t, const uint32_t &base, const int &offset){
  if((data_mem.offset <= (offset + base)) && ((offset+base) < (data_mem.offset + data_mem.length))){
    store_b_in_mem(t, base, offset);
  }
  else if((out_mem.offset <= (offset + base)) && ((offset+base) < (out_mem.offset + out_mem.length))){
    store_b_in_mem(t, base, offset);
    std::cout<<(registers[t] & 0x000000FF)<<std::endl;//not a test output

  }
}
void MIPS_sys::sh(const uint32_t &t, const uint32_t &base, const int &offset){
  store_hw_in_mem(t, base, offset);

  if((out_mem.offset <= (offset + base)) && ((offset+base) < (out_mem.offset + out_mem.length))){
    std::cout<<(registers[t] & 0x0000FFFF)<<std::endl;
  }}
void MIPS_sys::sw(const uint32_t &t, const uint32_t &base, const int &offset){
  registers[0] = ((0xFFFF0000 & registers[t]) >> 16);//save upp hw of word
  store_hw_in_mem(0, base, offset);//store upper hw in lower mem address (correct for big endian)
  registers[0] = (0x0000FFFF & registers[t]);//save low hw of word
  store_hw_in_mem(0, base, offset + 2);//store low hw in higher mem address (correct for big endian)

  if((out_mem.offset <= (offset + base)) && ((offset+base) < (out_mem.offset + out_mem.length))){
    std::cout<<registers[t]<<std::endl;
  }
  registers[0] = 0;
}
int MIPS_sys::sign_extend(int n, int length){
  int mask = 0x1 << (length - 1);
  int fill_1 = 0xFFFFFFFF << length;
  int fill_0 = 0xFFFFFFFF >> 33-length;
  switch(length){
    case 8:
      if((n & 0x80) != 0){
        return 0xFFFFFF00 | n;
      }
      else{
        return 0x000000FF & n;
      }
    case 16:
      if((n & 0x8000) != 0){
        return 0xFFFF0000 | n;
      }
      else{
        return 0x0000FFFF & n;
      }
    case 32:
      if((n & 0x80000000) != 0){
        return 0xFFFF0000 | n;
      }
      else{
        return 0x0000FFFF & n;
      }
  }
}
void MIPS_sys::store_b_in_mem(const uint32_t &t, const uint32_t &base, const int &offset){
  byte temp;
  temp.val = (registers[t] & 0x000000FF);
  temp.address = base + offset;
  bool found = 0;
  if((data_mem.offset <= (offset + base)) && ((offset+base) < (data_mem.offset + data_mem.length))){
    for(int i=0; i < data_mem.data.size(); i++){
      if((offset+base) == data_mem.data[i].address){
        found = 1;
        data_mem.data[i].val = (0x000000FF & registers[t]);
      }
    }
    if(!found){
      data_mem.data.push_back(temp);
    }
  }
  else if((out_mem.offset <= (offset + base)) && ((offset+base) < (out_mem.offset + out_mem.length))){
    for(int j=0; j < out_mem.data.size(); j++){
      if((offset+base) == out_mem.data[j].address){
        found = 1;
        out_mem.data[j].val = (0x000000FF & registers[t]);
      }
    }
    if(!found){
      out_mem.data.push_back(temp);
    }
  }
}
void MIPS_sys::store_hw_in_mem(const uint32_t &t, const uint32_t &base, const int &offset){
  registers[0] = (0x0000FF00 & registers[t]) >> 8;//save upp byte of half word
  store_b_in_mem(0, base, offset);//store upper byte in lower mem address (correct for big endian)
  registers[0] = (0x000000FF & registers[t]);//save low byte of half word
  store_b_in_mem(0, base, offset + 1);//store low byte in higher mem address (correct for big endian)
  registers[0] = 0;
}

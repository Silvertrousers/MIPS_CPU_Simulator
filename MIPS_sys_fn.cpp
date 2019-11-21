#include <iostream>
#include "MIPS_sys.hpp"
//The MIPS processors execute the jump or branch instruction and
//the delay slot instruction as an indivisible unit.
//If an exception occurs as a result of executing the delay slot instruction,
//the branch or jump instruction is not executed, and the exception appears to have
//been caused by the jump or branch instruction.

MIPS_sys::MIPS_sys(){
  byte b;
  pc = 0x10000000; //pc offset respresents index of instruction memory vector;
  hi = 0;
  lo = 0;
  for(int i=0; i<32; i++){
    registers.push_back(0);
  }
  b.val = 0;
  b.address = 0x30000000;

  for(int i=0; i<4; i++){
    in_mem.data.push_back(b);
    b.address ++;
  }
  for(int j=0; j<4; j++){
    out_mem.data.push_back(b);
    b.address ++;
  }
}

void MIPS_sys::increment_pc(const uint32_t &offset){
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
      temp.val = buffer[i] & 0xFF;
      temp.address = i + 0x10000000;
      instruction_mem.data.push_back(temp);
    }
    temp.val = 0;
    for(int j=0; j<5; j++){
      temp.address ++;
      instruction_mem.data.push_back(temp);
    }
  }
  else{
    std::cerr<<"Stop, "<<filename<<" wasn't opened/doesn't exist"<<std::endl;
    //need to throw and exception and call exit()
    std::exit(-12);
  }

  delete[] buffer;
}

//assuming the identified fucntion has been defined


void MIPS_sys::instruction_look_up(const instruction &instr){
  switch(instr.instr_no){
    case 1: add(instr.s, instr.t, instr.d);
      break;
    case 2: addi(instr.s, instr.t, instr.i);
      break;
    case 3: addiu(instr.s, instr.t, instr.i);
      break;
    case 4: addu(instr.s, instr.t, instr.d);
      break;
    case 5: and_(instr.s, instr.t, instr.d);
      break;
    case 6: andi(instr.s, instr.t, instr.d);
      break;
    case 7: beq(instr.s, instr.t, instr.i);
      break;
    case 8: bgez(instr.s, instr.i);
      break;
    case 9: bgezal(instr.s, instr.i);
      break;
    case 10: bgtz(instr.s, instr.i);
      break;
    case 11: blez(instr.s, instr.i);
      break;
    case 12: bltz(instr.s, instr.i);
      break;
    case 13: bltzal(instr.s, instr.i);
      break;
    case 14: bne(instr.s, instr.t, instr.i);
      break;
    case 15: div(instr.s, instr.t);
      break;
    case 16: divu(instr.s, instr.t);
      break;
    case 17: j(instr.address);
      break;
    case 18: jalr(instr.d, instr.s);
      break;
    case 19: jal(instr.address);
      break;
    case 20: jr(instr.s);
      break;
    case 21: lb(instr.t, instr.s, instr.i);
      break;
    case 22: lbu(instr.t, instr.s, instr.i);
      break;
    case 23: lh(instr.t, instr.s, instr.i);
      break;
    case 24: lhu(instr.t, instr.s, instr.i);
      break;
    case 25: lui(instr.t, instr.i);
      break;
    case 26: lw(instr.t, instr.s, instr.i);
      break;
    case 27: lwl(instr.t, instr.s, instr.i);
      break;
    case 28: lwr(instr.t, instr.s, instr.i);
      break;
    case 29: mfhi(instr.d);
      break;
    case 30: mflo(instr.d);
      break;
    case 31: mthi(instr.s);
      break;
    case 32: mtlo(instr.s);
      break;
    case 33: mult(instr.s, instr.t);
      break;
    case 34: multu(instr.s, instr.t);
      break;
    case 35: or_(instr.s, instr.t, instr.d);
      break;
    case 36: ori(instr.s, instr.t, instr.d);
      break;
    case 37: sb(instr.t, instr.s, instr.i);
      break;
    case 38: sh(instr.t, instr.s, instr.i);
      break;
    case 39: sll(instr.t, instr.d, instr.shamt);
      break;
    case 40: sllv(instr.s, instr.t, instr.d);
      break;
    case 41: slt(instr.s, instr.t, instr.d);
      break;
    case 42: slti(instr.s, instr.t, instr.i);
      break;
    case 43: sltiu(instr.s, instr.t, instr.i);
      break;
    case 44: sltu(instr.s, instr.t, instr.d);
      break;
    case 45: sra(instr.t, instr.d, instr.shamt);
      break;
    case 46: srav(instr.s, instr.t, instr.d);
      break;
    case 47: srl(instr.t, instr.d, instr.shamt);
      break;
    case 48: srlv(instr.s, instr.t, instr.d);
      break;
    case 49: sub(instr.s, instr.t, instr.d);
      break;
    case 50: subu(instr.s, instr.t, instr.d);
      break;
    case 51: sw(instr.t, instr.s, instr.i);
      break;
    case 52: xor_(instr.s, instr.t, instr.d);
      break;
    case 53: xori(instr.s, instr.t, instr.i);
      break;
  }
}

//Instructions

void MIPS_sys::add(const int32_t &s, const int32_t &t, const int32_t &d){
  int32_t x1, x2;
  x1 = registers[t];
  x2 = registers[s];
  registers[d] = x1 + x2;
}

void MIPS_sys::addi(const int32_t &s, const int32_t &t, const uint32_t &i){
  int32_t x1;
  int16_t x2;
  x1 = registers[s];
  x2 = i;
  registers[t] = x1 + x2;
}

void MIPS_sys::addiu(const int32_t &s, const int32_t &t, const uint32_t &i){
  registers[t] = registers[s] + i;
}

void MIPS_sys::addu(const int32_t &s, const int32_t &t, const int32_t &d){
  registers[d] = registers[t] + registers[s];
}

void MIPS_sys::and_(const int32_t &s, const int32_t &t, const int32_t &d){
  registers[d] = registers[t] & registers[s];
}

void MIPS_sys::andi(const int32_t &s,const int32_t &t, const uint32_t &i){
  registers[t] = registers[s] & i;
}

void MIPS_sys::div(const int32_t &s, const int32_t &t){
  if (registers[s] == 0){
    return 0;
  }
  int32_t quotient, remainder;
  int32_t x1, x2;
  x1 = registers[t];
  x2 = registers[s];
  quotient = floor(x1/x2);
  remainder = x1 - (x2 * quotient);
  registers[lo] = quotient;
  registers[hi] = remainder;
}

void MIPS_sys::divu(const int32_t &s, const int32_t &t){
  if (registers[s] == 0){
    return 0;
  }
  uint32_t quotient, remainder;
  quotient = floor(registers[t]/registers[s]);
  remainder = registers[t] - (registers[s] * quotient);
  registers[lo] = quotient;
  registers[hi] = remainder;
}

void MIPS_sys::mfhi(const int32_t &d){
  registers[d] = registers[hi];
}

void MIPS_sys::mflo(const int32_t &d){
  registers[d] = registers[lo];
}

void MIPS_sys::mthi(const int32_t &s){
  registers[hi] = registers[s];
}

void MIPS_sys::mtlo(const int32_t &s){
  registers[lo] = registers[s];
}

void MIPS_sys::mult(const int32_t &s, const int32_t &t){
  int64_t product;
  int x1, x2;
  x1 = registers[t];
  x2 = registers[s];
  product = x1 * x2;
  registers[hi] = product >> 32;
  registers[lo] = product & 0x00000000FFFFFFFF;
}

void MIPS_sys::multu(const int32_t &s, const int32_t &t){
  uint64_t product;
  product = registers[t] * registers[s];
}

void MIPS_sys::or_(const int32_t &s, const int32_t &t, const int32_t &d){
  registers[d] = registers[t] | registers[s];
}

void MIPS_sys::ori(const int32_t &s, const int32_t &t, const uint32_t &i){
  registers[t] = registers[s] | i;
}

void MIPS_sys::sll(const int32_t &t, const int32_t &d, const uint32_t &shamt){
  registers[d] = (registers[t] << shamt) & 0xFFFFFFFF;
}

void MIPS_sys::sllv(const int32_t &s, const int32_t &t, const int32_t &d){
  registers[d] = (registers[t] << registers[s]) & 0xFFFFFFFF;
}

void MIPS_sys::slt(const int32_t &s, const int32_t &t, const int32_t &d){
  int32_t x1, x2;
  x1 = registers[s];
  x2 = registers[t];
  if (x1 < x2){
    registers[d] = 1;
  }
  else{
    registers[d] = 0;
  }
}

void MIPS_sys::slti(const int32_t &s, const int32_t &t, const uint32_t &i){
  int16_t x1 = i;
  if (registers[s] < x1){
    registers[t] = 1;
  }
  else{
    registers[t] =0;
  }
}

void MIPS_sys::sltiu(const int32_t &s, const int32_t &t, const uint32_t &i){
  if (registers[s] < i){
    registers[t] = 1;
  }
  else{
    registers[t] = 0;
  }
}

void MIPS_sys::sltu(const int32_t &s, const int32_t &t, const int32_t &d){
  if (registers[s] < registers[t]){
    registers[d] = 1;
  }
  else{
    registers[d] = 0;
  }
}

void MIPS_sys::sra(const int32_t &t, const int32_t &d, const uint32_t &shamt){
  int32_t x1;
  x1 = registers[t];
  registers[d] = x1 >> shamt;
}

void MIPS_sys::srav(const int32_t &t, const int32_t &d, const uint32_t &shamt){
  int32_t x1;
  x1 = registers[t];
  registers[d] = x1 >> shamt;
}

void MIPS_sys::srl(const int32_t &t, const int32_t &d, const uint32_t &shamt){
  registers[d] = registers[t] >> shamt;
}

void MIPS_sys::srlv(const int32_t &s, const int32_t &t, const int32_t &d){
  registers[d] = registers[t] >> registers[s];
}

void MIPS_sys::sub(const int32_t &s, const int32_t &t, const int32_t &d){
  int32_t x1, x2;
  x1 = registers[s];
  x2 = registers[t];
  registers[d] = x1 - x2;
}

void MIPS_sys::subu(const int32_t &s, const int32_t &t, const int32_t &d){
  registers[d] = registers[s] - registers[t];
}

void MIPS_sys::xor_(const int32_t &s, const int32_t &t, const int32_t &d){
  registers[d] = registers[t] ^ registers[s];
}

void MIPS_sys::xori(const int32_t &s, const int32_t &t, const uint32_t &i){
  registers[t] = registers[s] ^ i;
}


void MIPS_sys::beq(const int &s, const int &t, const int &offset){
  if(registers[s] == registers[t]){
    pc += (sign_extend(offset, 16) << 2);//branch time
  }
  else{
    pc += 4;
  }
}
void MIPS_sys::bgez(const uint32_t &s, const int &offset){
  if(static_cast<int>(registers[s]) >= 0){
    pc += (sign_extend(offset, 16) << 2);//branch time
  }
  else{
    pc += 4;
  }
}
void MIPS_sys::bgezal(const uint32_t &s, const int &offset){
  registers[31] = pc + 8;
  bgez(s, offset);
}
void MIPS_sys::bgtz(const uint32_t &s, const int &offset){
  if(static_cast<int>(registers[s]) > 0){
    pc += (sign_extend(offset, 16) << 2);//branch time
  }
  else{
    pc += 4;
  }
}
void MIPS_sys::blez(const uint32_t &s, const int &offset){
  if(static_cast<int>(registers[s]) <= 0){
    pc += (sign_extend(offset, 16) << 2);//branch time
  }
  else{
    pc += 4;
  }
}
void MIPS_sys::bltz(const uint32_t &s, const int &offset){
  if(static_cast<int>(registers[s]) < 0){
    pc += (sign_extend(offset, 16) << 2);//branch time
  }
  else{
    pc += 4;
  }
}
void MIPS_sys::bltzal(const uint32_t &s, const int &offset){
  registers[31] = pc + 8;
  //delay slot
  bltz(s, offset);
}
void MIPS_sys::bne(const uint32_t &s, const uint32_t &t, const int &offset){
  if(registers[s] != registers[t]){
    pc += (sign_extend(offset, 16) << 2);//branch time
  }
  else{
    pc += 4;
  }
}

void MIPS_sys::j(const uint32_t &offset){
  int top_4_bits =(pc + 4) & 0xF0000000;
  int bttm_28_bits = (offset & 0x03FFFFFF) << 2;

  if((0x10000000 <= (top_4_bits | bttm_28_bits)) && ((top_4_bits | bttm_28_bits) < 0x11000000)){
    pc = (top_4_bits | bttm_28_bits) - 4;
  }
  else{
    exit(-11);//memory exception
  }
}
void MIPS_sys::jalr(const uint32_t &d, const uint32_t &s){
  registers[d] = pc + 8;
  if(((0x10000000 <= registers[s]) && (registers[s] < 0x11000000)) || s == 0){
    if(registers[s] % 4 == 0){
      pc = registers[s] - 4;
    }
    else{
      exit(-11);//memory exception
    }
  }
  else{
    exit(-11);//memory exception
  }
}
void MIPS_sys::jal(const uint32_t &offset){
  registers[31] = pc + 8;
  j(offset);
}
void MIPS_sys::jr(const uint32_t &s){
  if(((0x10000000 <= registers[s]) && (registers[s] < 0x11000000))|| registers[s] == 0){
    if(registers[s] % 4 == 0){
      pc = registers[s] - 4;
    }
    else{
      exit(-11);//memory exception
    }
  }
  else{
    exit(-11);//memory exception
  }
}

void MIPS_sys::lb(const uint32_t &t, const uint32_t &b, const int &off){
  char in;
  int base = registers[b];
  registers[t] = 0;
  int offset = sign_extend(off, 16);
  if(in_data_mem(offset + base)){
    for(int i=0; i < data_mem.data.size(); i++){
      if((offset+base) == data_mem.data[i].address){
        registers[t] = sign_extend(data_mem.data[i].val, 8);
      }
    }

  }
  else if(in_instruction_mem(offset + base)){
    for(int m=0; m < instruction_mem.data.size(); m++){
      if((offset+base) == instruction_mem.data[m].address){
        registers[t] = sign_extend(instruction_mem.data[m].val, 8);
      }
    }
  }
  else if(in_in_mem(offset + base)){
     in = std::getchar();
    for(int j=0; j < in_mem.data.size(); j++){
      if(in_mem.data[j].address == 0x30000003){
        in_mem.data[j].val = in;
      }
      if(offset+base == in_mem.data[j].address){
        registers[t] = sign_extend(in_mem.data[j].val, 8);
      }
    }
  }
  else{
    std::exit(-11);
  }
}
void MIPS_sys::lbu(const uint32_t &t, const uint32_t &b, const int &off){
  char in;
  int base = registers[b];
  registers[t] = 0;
  int offset = sign_extend(off, 16);
  if(in_data_mem(offset + base)){
    for(int i=0; i < data_mem.data.size(); i++){
      if((offset+base) == data_mem.data[i].address){
        registers[t] = (data_mem.data[i].val & 0x000000FF);
      }
    }
  }
  else if(in_instruction_mem(offset + base)){
    for(int m=0; m < instruction_mem.data.size(); m++){
      if((offset+base) == instruction_mem.data[m].address){
        registers[t] = instruction_mem.data[m].val & 0x000000FF;
      }
    }
  }
  else if(in_in_mem(offset+base)){
    in = std::getchar();
    for(int j=0; j < in_mem.data.size(); j++){
      if(in_mem.data[j].address == 0x30000003){
        in_mem.data[j].val = in;
      }
      if(offset+base == in_mem.data[j].address){
        registers[t] = in_mem.data[j].val;
      }
    }
  }
  else{
    std::exit(-11);
  }
}
void MIPS_sys::lh(const uint32_t &t, const uint32_t &b, const int &offset){
  char in;
  int temp = 0;
  int base = registers[b];
  if(((offset + base) % 2) == 0){
    if(in_data_mem(offset + base) || in_instruction_mem(offset + base)){
      lb(t, b, offset);
      temp = registers[t] << 8;
      registers[b] = base;
      lbu(0, b, offset + 1);
      temp += registers[0];
      registers[b] = base;
    }
    else if(in_in_mem(offset + base)){
       in = std::getchar();
      for(int j=0; j < in_mem.data.size(); j++){
        if(in_mem.data[j].address == 0x30000003){
          in_mem.data[j].val = in;
        }
        if((offset+base) == in_mem.data[j].address){
          temp = in_mem.data[j + 1].val;
        }
      }
      if((offset + base) == 0x30000002){
        temp = in;
      }
    }
    else{
      std::exit(-11);
    }
  }
  else{
    std::exit(-11);
  }
  registers[0] = 0;
  registers[t] = temp;
}
void MIPS_sys::lhu(const uint32_t &t, const uint32_t &b, const int &offset){
  int in;
  int temp = 0;
  int base = registers[b];
  if(((offset + base) % 2) == 0){
    if(in_data_mem(offset + base) || in_instruction_mem(offset + base)){
      lbu(t, b, offset);
      temp = registers[t] << 8;
      registers[b] = base;
      lbu(0, b, (offset + 1));
      temp += registers[0];
      registers[b] = base;
    }
    else if(in_in_mem(offset + base)){
       in = std::getchar();
      for(int j=0; j < in_mem.data.size(); j++){
        if(in_mem.data[j].address == 0x30000003){
          in_mem.data[j].val = in;
        }
        if((offset+base) == in_mem.data[j].address){
          temp = in_mem.data[j + 1].val;
        }
      }
      if((offset + base) == 0x30000002){
        temp = in;
      }
    }
    else{
      std::exit(-11);
    }
  }
  else{
    std::exit(-11);
  }
  registers[0] = 0;
  registers[t] = temp;
}

void MIPS_sys::lui(const uint32_t &t, const uint32_t &i){
  registers[t] =  i << 16;
}

void MIPS_sys::lw(const uint32_t &t, const uint32_t &b, const int &offset){
  char in;
  int save_data = 0;

  int base = registers[b];
  int temp = registers[1];
  int off = sign_extend(offset, 16);
  if((off + base) % 4 ==0){
    if(in_data_mem(off + base) || in_instruction_mem(off + base)){
      lhu(t, b, off);
      save_data = registers[t] << 16;
      registers[b] = base;
      lhu(1, b, off + 2);
      save_data += registers[1];
      registers[b] = base;
    }
    else if(in_in_mem(off + base)){
       in = std::getchar();
       std::cerr<<static_cast<int>(in)<<std::endl;
      for(int j=0; j < in_mem.data.size(); j++){
        if(in_mem.data[j].address == 0x30000003){
          in_mem.data[j].val = in;
        }
        if((off+base) == in_mem.data[j].address){
          save_data = in_mem.data[j + 1].val;
        }
      }
      if((off + base) == 0x30000000){
        save_data = in;
      }
    }
    else{
      std::exit(-11);
    }
  }
  else{
    std::exit(-11);
  }
  registers[1] = temp;
  registers[t] = save_data;
}
//look at diagram and reimpliment
void MIPS_sys::lwl(const uint32_t &t, const uint32_t &b, const int &offset){
  int temp = registers [t];
  int base = registers[b];
  int address = base + sign_extend(offset, 16);
  int off = sign_extend(offset, 16) & 0xFFFC;
  lw(t, b, off);
  if(address % 4 == 3){}
  if(address % 4 == 2){registers[t] = ((registers[t] << 8) + (temp & 0x000000FF));}
  if(address % 4 == 1){registers[t] = ((registers[t] << 16) + (temp & 0x0000FFFF));}
  if(address % 4 == 0){registers[t] = ((registers[t] << 24) + (temp & 0x00FFFFFF));}
}
//look at diagram and reimpliment
void MIPS_sys::lwr(const uint32_t &t, const uint32_t &b, const int &offset){
  int temp = registers [t];
  int base = registers[b];
  int address = base + sign_extend(offset, 16);
  int off = sign_extend(offset, 16) & 0xFFFC;
  lw(t, b, off);
  if(address % 4 == 3){registers[t] = ((registers[t] >> 24) + (temp & 0xFFFFFF00));}
  if(address % 4 == 2){registers[t] = ((registers[t] >> 16) + (temp & 0xFFFF0000));}
  if(address % 4 == 1){registers[t] = ((registers[t] >> 8) + (temp & 0xFF000000));}
  if(address % 4 == 0){}
}
void MIPS_sys::sb(const uint32_t &t, const uint32_t &b, const int &offset){
  int base = registers[b];
  int off = sign_extend(offset, 16);
  if(in_data_mem(off + base)){
    store_b_in_mem(t, base, off);
  }
  else if(in_out_mem(off + base)){
    store_b_in_mem(t, base, off);
    std::cerr<<"yeeee: "<<(registers[t])<<std::endl;
    std::putchar(static_cast<char>(registers[t] & 0x000000FF));//not a test output
  }
  else{
    std::exit(-11);
  }
}
void MIPS_sys::sh(const uint32_t &t, const uint32_t &b, const int &offset){
  int base = registers[b];
  int off = sign_extend(offset, 16);
  std::cerr<<"address:  "<<(off+base)<<std::endl;
  if((off  + base)%2 == 0){
    if(in_data_mem(off +base)){
      store_hw_in_mem(t, base, off );
    }
    else if(in_out_mem(off  + base)){
      std::putchar(registers[t] & 0x000000FF);;
    }
    else{
      std::exit(-11);
    }
  }
  else{
    std:exit(-11);
  }
}
void MIPS_sys::sw(const uint32_t &t, const uint32_t &b, const int &offset){
  int base = registers[b];
  int tmp = registers[9];
  int off = sign_extend(offset, 16);
  if((off  + base) %4 ==0){
    if(in_data_mem(off  + base)){
      registers[9] = ((0xFFFF0000 & registers[t]) >> 16);//save upp hw of word
      store_hw_in_mem(9, base, off );//store upper hw in lower mem address (correct for big endian)
      registers[9] = (0x0000FFFF & registers[t]);//save low hw of word
      store_hw_in_mem(9, base, off  + 2);//store low hw in higher mem address (correct for big endian)
    }
    else if(in_out_mem(off  + base)){
      std::putchar(registers[t] & 0x000000FF);
    }
    else{
      std::exit(-11);
    }
  }
  else{
    std::exit(-11);
  }
  registers[9] = tmp;
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
  int off = sign_extend(offset, 16);
  temp.val = (registers[t] & 0x000000FF);
  temp.address = base + off ;
  bool found = 0;
  if(in_data_mem(off  + base)){
    for(int i=0; i < data_mem.data.size(); i++){
      if((off +base) == data_mem.data[i].address){
        found = 1;
        data_mem.data[i].val = (0x000000FF & registers[t]);
      }
    }
    if(!found){
      data_mem.data.push_back(temp);
    }
  }
  else if(in_out_mem(off  + base)){
    for(int j=0; j < out_mem.data.size(); j++){
      if((off +base) == out_mem.data[j].address){
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
  store_b_in_mem(0, base, sign_extend(offset, 16));//store upper byte in lower mem address (correct for big endian)
  registers[0] = (0x000000FF & registers[t]);//save low byte of half word
  store_b_in_mem(0, base, sign_extend(offset, 16) + 1);//store low byte in higher mem address (correct for big endian)
  registers[0] = 0;
}
bool MIPS_sys::in_data_mem(int addr){
  if((data_mem.offset <= (addr)) && ((addr) < (data_mem.offset + data_mem.length))){
    return true;
  }
  return false;
}
bool MIPS_sys::in_instruction_mem(int addr){
  if((instruction_mem.offset <= (addr)) && ((addr) < (instruction_mem.offset + instruction_mem.length))){
    return true;
  }
  return false;
}
bool MIPS_sys::in_in_mem(int addr){
  if((in_mem.offset <= (addr)) && ((addr) < (in_mem.offset + in_mem.length))){
    return true;
  }
  return false;
}
bool MIPS_sys::in_out_mem(int addr){
  if((out_mem.offset <= (addr)) && ((addr) < (out_mem.offset + out_mem.length))){
    return true;
  }
  return false;
}

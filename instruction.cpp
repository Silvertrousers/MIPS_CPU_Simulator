#include "instruction.hpp"

instruction::instruction(){
  code = 0;
  instr_no = 0;
}

instruction::instruction(int32_t in){
  code = in;
  instr_no = 0;
}

void instruction::run(){
  if ((code >> 26) == 0){
    r_type(); //R type
  }
  if ((code >> 27) == 1){
    j_type(); //J type
  }
  else{
    i_type(); //I type
  }
}

void instruction::r_type(){
  type = 0;
  s = (code & 0x03E00000) >> 21;
  t = (code & 0x001F0000) >> 16;
  d = (code & 0x0000F800) >> 11;
  shamt = (code & 0x000007C0) >> 6;
  int fncode = (code & 0x0000003F);
  switch(fncode){
    case 0x00000020:
      instr_no = 1;
      break;
    case 0x00000021:
      instr_no = 4;
      break;
    case 0x00000024:
      instr_no = 5;
      break;
    case 0x0000001A:
      instr_no = 15;
      break;
    case 0x0000001B:
      instr_no = 16;
      break;
    case 0x00000009://jalr
      instr_no = 18;
      break;
    case 0x00000008://jr
      instr_no = 20;
      break;
    case 0x00000010:
      instr_no = 29;
      break;
    case 0x00000012:
      instr_no = 30;
      break;
    case 0x00000011:
      instr_no = 31;
      break;
    case 0x00000013:
      instr_no = 32;
      break;
    case 0x00000018:
      instr_no = 33;
      break;
    case 0x00000019:
      instr_no = 34;
      break;
    case 0x00000025:
      instr_no = 35;
      break;
    case 0x00000000:
      instr_no = 39;
      break;
    case 0x00000004:
      instr_no = 40;
      break;
    case 0x0000002A:
      instr_no = 41;
      break;
    case 0x0000002B:
      instr_no = 44;
      break;
    case 0x00000003:
      instr_no = 45;
      break;
    case 0x00000007:
      instr_no = 46;
      break;
    case 0x00000002:
      instr_no = 47;
      break;
    case 0x00000006:
      instr_no = 48;
      break;
    case 0x00000022:
      instr_no = 49;
      break;
    case 0x00000023:
      instr_no = 50;
      break;
    case 0x00000026:
      instr_no = 52;
      break;
  }
}

void instruction::i_type(){
  type = 1;
  s = (code & 0x03E00000) >> 21;
  t = (code & 0x001F0000) >> 16;
  i = (code & 0x0000FFFF);
  int opcode = (code >> 26);
  switch(opcode){
    case 0x00000008:
      instr_no = 2;
      break;
    case 0x00000009:
      instr_no = 3;
      break;
    case 0x0000000C:
      instr_no = 6;
      break;
    case 0x00000004:
      instr_no = 7;
      break;
    case 0x00000001:
      switch(t){
        case 0x01:
          instr_no = 8;
          break;
        case 0x11:
          instr_no = 9;
          break;
        case 0x00:
          instr_no = 12;
          break;
        case 0x10:
          instr_no = 13;
          break;
      }
      break;
    case 0x00000007:
      instr_no = 10;
      break;
    case 0x00000006:
      instr_no = 11;
      break;
    case 0x00000005:
      instr_no = 14;
      break;
    case 0x00000020:
      instr_no = 21;
      break;
    case 0x00000024:
      instr_no = 22;
      break;
    case 0x00000021:
      instr_no = 23;
      break;
    case 0x00000025:
      instr_no = 24;
      break;
    case 0x0000000F:
      instr_no = 25;
      break;
    case 0x00000023:
      instr_no = 26;
      break;
    case 0x00000022:
      instr_no = 27;
      break;
    case 0x00000026:
      instr_no = 28;
      break;
    case 0x0000000D:
      instr_no = 36;
      break;
    case 0x00000028:
      instr_no = 37;
      break;
    case 0x00000029:
      instr_no = 38;
      break;
    case 0x0000000B:
      instr_no = 42;
      break;
    case 0x0000000A:
      instr_no = 43;
      break;
    case 0x0000002B:
      instr_no = 51;
      break;
    case 0x0000000E:
      instr_no = 53;
      break;
  }
}

void instruction::j_type(){
  type = 2;
  address = (code & 0x03FFFFFF);
  if ((code >> 26) == 0x2){
    instr_no = 17;
  }
  if ((code >> 26) == 0x3){
    instr_no = 19;
  }
}

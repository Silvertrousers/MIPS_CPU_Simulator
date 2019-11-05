//assuming the identified fucntion has been defined
bool checker(int inst_word, std::string instruction_name, MIPS_sys s){
  switch(instruction_name){
    //for all brnch and jump instructions make sure the offset + base is located in the instruction memory
    case beq:
      if((0x10000000 <= (s.pc + (inst_word.offset << 2))) && ((s.pc + (inst_word.offset << 2)) < 0x11000000)){
        return true;
      }
      std::exit(-11);
    case bgez:
      if((0x10000000 <= (s.pc + (inst_word.offset << 2))) && ((s.pc + (inst_word.offset << 2)) < 0x11000000)){
        return true;
      }
      std::exit(-11);
    case bgezal:
      if((0x10000000 <= (s.pc + (inst_word.offset << 2))) && ((s.pc + (inst_word.offset << 2)) < 0x11000000)){
        return true;
      }
      std::exit(-11);
    case bgtz:
      if((0x10000000 <= (s.pc + (inst_word.offset << 2))) && ((s.pc + (inst_word.offset << 2)) < 0x11000000)){
        return true;
      }
      std::exit(-11);
    case blez:
      if((0x10000000 <= (s.pc + (inst_word.offset << 2))) && ((s.pc + (inst_word.offset << 2)) < 0x11000000)){
        return true;
      }
      std::exit(-11);
    case bltz:
      if((0x10000000 <= (s.pc + (inst_word.offset << 2))) && ((s.pc + (inst_word.offset << 2)) < 0x11000000)){
        return true;
      }
      std::exit(-11);
    case bltzal:
      if((0x10000000 <= (s.pc + (inst_word.offset << 2))) && ((s.pc + (inst_word.offset << 2)) < 0x11000000)){
        return true;
      }
      std::exit(-11);
    case bne:
      if((0x10000000 <= (s.pc + (inst_word.offset << 2))) && ((s.pc + (inst_word.offset << 2)) < 0x11000000)){
        return true;
      }
      std::exit(-11);

    case j:
      if(){

      }
    case jalr:
    //chech offset + base is located in the instruction memory
    case jal:
    //chech offset + base is located in the instruction memory
    case jr:
    //chech offset + base is located in the instruction memory must be done within the function
    case lb:
    //check for sign extension of offset
    //chech offset + base is located in the data or input memory
    case lbu:
    //check for sign extension of offset
    //chech offset + base is located in the data or input memory
    case lh:
    //check for sign extension of offset
    //chech offset + base is located in the data or input memory
    case lhu:
    //check for sign extension of offset
    //chech offset + base is located in the data or input memory
    case lui:
    //check for sign extension of offset
    //chech offset + base is located in the data or input memory
    case lw:
    //check for sign extension of offset
    //chech offset + base is located in the data or input memory
    case lwl:
    //check for sign extension of offset
    //chech offset + base is located in the data or input memory
    case lwr:
    //check for sign extension of offset
    //chech offset + base is located in the data or input memory

    case sb:
    case sh:
    case sw:
  }
}

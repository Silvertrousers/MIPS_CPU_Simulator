
//assuming the identified fucntion has been defined
bool checker(std::string instruction_name, MIPS_sys s){
  if (instr_no == 0){
    std::exit(-12);
  }
  switch(instruction_name){
    // for all instructions that write to regisers, if rd is r0, set the value being written(no matter what it is) to zero
    //for all brnch and jump instructions make sure the offset + base is located in the instruction memory
    case add: //integer overflow, destination wrong
      int64_t result = s.registers[s] + s.registers[t];
      if (result >> 32 == 0){
        return true;
      }
      std::exit(-10);
    case addi:
      int64_t result = s.registers[t] + i;
      if (result >> 32 == 0){
        return true;
      }
      std::exit(-10);
    case addiu:
      int64_t result = s.registers[t] + i;
      if (result >> 32 == 0){
        return true;
      }
      std::exit(-10);
    case addu:
      int64_t result = s.registers[s] + s.registers[t];
      if (result >> 32 == 0){
        return true;
      }
      std::exit(-10);
    case and:
      return true;
    case andi:
      return true;
    case beq:
      if((0x10000000 <= (s.pc + (i << 2))) && ((s.pc + (i << 2)) < 0x11000000)){
        return true;
      }
      std::exit(-11);
    case bgez:
      if((0x10000000 <= (s.pc + (i << 2))) && ((s.pc + (i << 2)) < 0x11000000)){
        return true;
      }
      std::exit(-11);
    case bgezal:
      if((0x10000000 <= (s.pc + (i << 2))) && ((s.pc + (i << 2)) < 0x11000000)){
        return true;
      }
      std::exit(-11);
    case bgtz:
      if((0x10000000 <= (s.pc + (i << 2))) && ((s.pc + (i << 2)) < 0x11000000)){
        return true;
      }
      std::exit(-11);
    case blez:
      if((0x10000000 <= (s.pc + (i << 2))) && ((s.pc + (i << 2)) < 0x11000000)){
        return true;
      }
      std::exit(-11);
    case bltz:
      if((0x10000000 <= (s.pc + (i << 2))) && ((s.pc + (i << 2)) < 0x11000000)){
        return true;
      }
      std::exit(-11);
    case bltzal:
      if((0x10000000 <= (s.pc + (i << 2))) && ((s.pc + (i << 2)) < 0x11000000)){
        return true;
      }
      std::exit(-11);
    case bne:
      if((0x10000000 <= (s.pc + (i << 2))) && ((s.pc + (i << 2)) < 0x11000000)){
        return true;
      }
      std::exit(-11);

    case j:
      return true;
    case jalr:
      return true;
    case jal:
      return true;
    case jr:
      return true;
    case lb:
      return true;
    case lbu:
      return true;
    case lh:
      return true;
    case lhu:
      return true;
    case lui:
      return true;
    case lw:
      return true;
    case lwl:
    //need to finish implementation
    case lwr:
    //need to finish implementation
    case sb:
      return true;
    case sh:
      return true;
    case sw:
      return true;
  }
}

#include <vector>
#include <cmath>
#include <inttypes.h>

//#ifndef system_hpp
//#define system_hpp

struct byte{
  uint32_t val;
  uint32_t address;
};

struct word{
  byte b3,b2,b1,b0; //in 32 bit number b3:b2:b1:b0, with b3 being the msB of the word, has lowest address
  uint32_t address = b3.address;
};

class memory{
  public:
    std::vector<byte> data;
    uint32_t length;
    uint32_t offset;
    memory(uint32_t off, uint32_t len);
};
/*
class instruction_memory: public memory{
  private:
      uint32_t length = 0x1000000;
      uint32_t offset = 0x10000000;
      i.e 11000000 is the address of the byte after usable memory
};

class data_memory: public memory{
  private:
      uint32_t length = 0x4000000;
      uint32_t offset = 0x20000000;
};

class input_memory: public memory{
  private:
      uint32_t length = 0x4;
      uint32_t offset = 0x30000000;
};

class output_memory: public memory{
  private:
      uint32_t length = 0x4;
      uint32_t offset = 0x30000004;
};
*/
//#endif

simulator: memory_fn.o MIPS_sys_fn.o instruction.o Main_loop.o
	g++ memory_fn.o MIPS_sys_fn.o instruction.o Main_loop.o -o bin/mips_simulator

memory_fn.o: memory_fn.cpp memory.hpp
	g++ -c memory_fn.cpp

MIPS_sys_fn.o: MIPS_sys_fn.cpp MIPS_sys.hpp
	g++ -c MIPS_sys_fn.cpp

instruction.o: instruction.cpp instruction.hpp
	g++ -c instruction.cpp

Main_loop.o: Main_loop.cpp
	g++ -c Main_loop.cpp

testbench:
	./bin/mips_testbench

clean:
	rm *.o bin/mips_simulator

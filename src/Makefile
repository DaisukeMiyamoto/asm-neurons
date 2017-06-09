#makefile

CFLAGS := -Wall -O3 -DUSE_ASM
OBJ = iz_main.o calc_iz_c.o benchmark_utils.o
INCLUDE = iz.h
TEST_TARGET = iz.out

all: iz.out
arm: iz_arm.out

iz_arm.out: $(OBJ) calc_iz_asm1.o calc_iz_asm2.o calc_iz_asm3.o
	$(CC) $(CFLAGS) -o $@ $^

iz.out: $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^

asm: calc_iz_c.c
	$(CC) $(CFLAGS) -S $^

test: iz.out
	./iz.out 1000 1000

test_arm: iz_arm.out
	./iz_arm.out 10 2 1

plot:
	./iz.out 1000 1 > result.txt
	python ../utils/plot.py result.txt

clean:
	rm -rf *.out *.o
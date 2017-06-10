#makefile

CFLAGS := -Wall -O3 -DUSE_ASM
IZ_OBJ = iz_main.o calc_iz_c.o benchmark_utils.o
HH_OBJ = hh_main.o calc_hh_c.o benchmark_utils.o
TEST_TARGET = iz.out

all: iz.out hh.out
arm: iz_arm.out

iz_arm.out: $(IZ_OBJ) calc_iz_asm1.o calc_iz_asm2.o calc_iz_asm3.o
	$(CC) $(CFLAGS) -o $@ $^

iz.out: $(IZ_OBJ) iz.h
	$(CC) $(CFLAGS) -o $@ $^

hh.out: $(HH_OBJ) hh.h
	$(CC) $(CFLAGS) -o $@ $^ -lm

gen_asm: calc_iz_c.s calc_hh_c.s

calc_iz_c.s: calc_iz_c.c
	$(CC) $(CFLAGS) -S $^

calc_hh_c.s: calc_hh_c.c
	$(CC) $(CFLAGS) -S $^

test: iz.out hh.out
	./iz.out 1000 1000
	./hh.out 1000 1000

test_arm: iz_arm.out
	./iz_arm.out 10 2 1

plot:
	./iz.out 1000 1 > result.txt
	python ../utils/plot.py result.txt

clean:
	rm -rf *.out *.o

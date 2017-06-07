#makefile

CFLAGS := -Wall -O2
OBJ = iz_main.o calc_iz_c.o
INCLUDE = iz.h

all: iz.out

iz.out: $(OBJ)
	$(CC) $(CFLAGS) -o $@ $^

asm: calc_iz_c.c
	$(CC) $(CFLAGS) -S $^

test:
	./iz_c.out > result_c.txt
	./iz_asm.out > result_asm.txt

result_c.txt: test
result_asm.txt: test
plot: result_c.txt result_asm.txt
	python ../utils/plot.py result_c.txt iz_c

clean:
	rm -rf *.out *.o

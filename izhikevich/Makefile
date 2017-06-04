#makefile

CFLAGS := -Wall -O2

all: iz_c.out iz_asm.out

iz_c.out: iz.c
	$(CC) $(CFLAGS) -o $@ $^

iz_asm.out: iz_asm.s
	$(CC) -o $@ $^

test:
	./iz_c.out > result_c.txt
	./iz_asm.out > result_asm.txt

result_c.txt: test
result_asm.txt: test
plot: result_c.txt result_asm.txt
	python ../utils/plot.py result_c.txt iz_c

clean:
	rm -rf *.out *.o

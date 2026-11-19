# Makefile
all: conditions

conditions: conditions.o
	gcc -g -Wl,-z,noexecstack -o $@ $+

conditions.o: conditions.s
	as -g -o $@ $<

clean:
	rm -rf conditions *.o

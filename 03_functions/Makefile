# Makefile
all: funcs

funcs: funcs.o
	gcc -g -Wl,-z,noexecstack -o $@ $+

funcs.o: funcs.s
	as -g -o $@ $<

clean:
	rm -rf funcs *.o

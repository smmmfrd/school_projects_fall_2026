# Makefile
all: math

math: math.o
	gcc -g -Wl,-z,noexecstack -o $@ $+

math.o: math.s
	as -g -o $@ $<

clean:
	rm -rf math *.o

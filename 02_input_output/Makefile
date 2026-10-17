# Makefile
all: input_output

input_output: input_output.o
	gcc -g -Wl,-z,noexecstack -o $@ $+

input_output.o: input_output.s
	as -g -o $@ $<

clean:
	rm -rf input_output *.o

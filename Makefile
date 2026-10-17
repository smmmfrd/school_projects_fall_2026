# Makefile
all: base_file

base_file: base_file.o
	gcc -g -Wl,-z,noexecstack -o $@ $+

base_file.o: base_file.s
	as -g -o $@ $<

clean:
	rm -rf base_file *.o

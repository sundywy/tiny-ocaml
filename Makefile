.PHONY: all test clean

all:
	dune build

test:
	make -C test/scripts

clean:
	dune clean

hello:
	dune build bin/hello.exe
	chmod +w _build/default/bin/hello.exe
	cp _build/default/bin/hello.exe test/scripts/01_hello

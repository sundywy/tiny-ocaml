.PHONY: all test clean

all:
	dune build

test:
	make -C test/scripts

clean:
	dune clean

hello:
	dune build src/hello.exe

 crowsnest:
	dune build src/crowsnest.exe

CC=clang
LL=llc
WLD=wasm-ld

clean:
	rm -f add.ll
	rm -f add.o
	rm -f ad.wasm
build:
	$(CC) \
		--target=wasm32 \
		-emit-llvm \
		-c \
		-S \
		add.c 
	$(LL) \
		-march=wasm32 \
		-filetype=obj \
		add.ll
	$(WLD) \
		--no-entry \
		--export-all \
		-o add.wasm \
		add.o

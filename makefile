INCLUDE_PATH = /usr/local/include
LIB_PATH = /usr/local/lib
MOZJS_VERSION = mozjs-53
CPP = g++ -std=c++14 -Wall

MOZJS_INCLUDE = -I$(INCLUDE_PATH)/$(MOZJS_VERSION)
MOZJS_LD = -L$(LIB_PATH) -l$(MOZJS_VERSION) -lm -lz -ldl

compile = $(CPP) $(CPPFLAGS) $(MOZJS_INCLUDE) $< -o $@ $(MOZJS_LD) $(LDFLAGS)


.PHONY: default
default: run


.PHONY: run
run: build/a.out
	$<


.PHONY: ltrace
ltrace: build/a.out
	ltrace $<


.PHONY: strace
strace: build/a.out
	strace -f -e 'trace=!access,mmap,mprotect' $<


build/a.out: src/main.cpp
	mkdir -p build && $(compile)


.PHONY: clean
clean:
	rm -rf build

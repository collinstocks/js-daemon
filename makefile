INCLUDE_PATH = /usr/local/include
MOZJS_VERSION = mozjs-53
CPP = g++ -std=c++14

MOZJS_INCLUDE = -I$(INCLUDE_PATH)/$(MOZJS_VERSION)
MOZJS_LD = -l$(MOZJS_VERSION)

compile = $(CPP) $(CPPFLAGS) $(LDFLAGS) $(MOZJS_INCLUDE) $(MOZJS_LD)


default: run


run: build/a.out
	$<


build/a.out: src/main.cpp
	mkdir -p build && $(compile) $< -o $@

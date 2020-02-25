# The C compiler
CC=gcc
CXX=g++

# Debug flags
DBG_CXXFLAGS=-g -Wall -Wno-sign-compare

# Optimization flags
OPT_CXXFLAGS=-O2 -Wall -Wno-sign-compare

# libraries
INCLUDES=-I./src

LNK=src/libsla.a

# FIXME: Shouldn't need sleighexample.o
libsla.o: sleighexample.o src/libsla_dbg.a
	$(CXX) -shared -o $@ -fPIC $^

src/libsla_dbg.a:
	make -C src libsla_dbg.a

sleighexample.o:	sleighexample.cc
	$(CXX) -c $(DBG_CXXFLAGS) -fPIC $(INCLUDES) $< -o $@

sleighexample:	sleighexample.o
	$(CXX) $(DBG_CXXFLAGS) -o sleighexample sleighexample.o $(LNK)

clean:
	rm -rf *.o sleighexample


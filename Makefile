# Makefile - make | make run | make test | make plots | make clean

CXX      ?= g++
CXXFLAGS ?= -std=c++17 -O2 -Wall -Wextra
CPPFLAGS += -Isrc -MMD -MP

TARGET      := build/coloring
TEST_TARGET := build/run_tests

SRCS      := $(wildcard src/*.cpp src/*/*.cpp)
OBJS      := $(SRCS:%.cpp=build/obj/%.o)
LIB_OBJS  := $(filter-out build/obj/src/main.o,$(OBJS))
TEST_SRCS := $(wildcard tests/*.cpp)
TEST_OBJS := $(TEST_SRCS:%.cpp=build/obj/%.o)
DEPS      := $(OBJS:.o=.d) $(TEST_OBJS:.o=.d)

.PHONY: all run test plots clean

all: $(TARGET)

$(TARGET): $(OBJS)
	@mkdir -p $(dir $@)
	$(CXX) $(OBJS) -o $@

$(TEST_TARGET): $(LIB_OBJS) $(TEST_OBJS)
	@mkdir -p $(dir $@)
	$(CXX) $^ -o $@

build/obj/%.o: %.cpp
	@mkdir -p $(dir $@)
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $< -o $@

run: $(TARGET)
	./$(TARGET)

test: $(TEST_TARGET)
	./$(TEST_TARGET)

plots:
	python3 scripts/plot_results.py

clean:
	rm -rf build

-include $(DEPS)

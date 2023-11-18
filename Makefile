SRCS=$(wildcard src/*.cpp)
OBJS=$(SRCS:src/%.cpp=obj/%.o)
BIN = matrix

CXX=clang++
CXXFLAGS=-g -Wall

all: $(BIN)
	
$(BIN):	$(OBJS) main.cpp
	$(CXX) $(CXXFLAGS) $(OBJS) main.cpp -o $(BIN)

obj/%.o: src/%.cpp
	$(CXX) $(CXXFLAGS) -MMD $^ -o $@

run: $(BIN)
	@./$(BIN)

clean: 
	$(RM) $(RF) $(OBJS) $(OBJS:obj/%.o=obj/%.d) $(BIN)

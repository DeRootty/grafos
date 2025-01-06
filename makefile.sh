CXX = g++
CXXFLAGS = -I include -Wall -std=c++17
SRC_DIR = src
INCLUDE_DIR = include
OBJ_DIR = obj
TARGET = programa

# Archivos fuente y objetos
SRCS = $(wildcard $(SRC_DIR)/*.cpp $(SRC_DIR)/*.c)
OBJS = $(patsubst $(SRC_DIR)/%.cpp, $(OBJ_DIR)/%.o, $(SRCS))

# Reglas
all: $(TARGET)

$(TARGET): $(OBJS)
	$(CXX) $(OBJS) -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.cpp
	mkdir -p $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	mkdir -p $(OBJ_DIR)
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -rf $(OBJ_DIR) $(TARGET)
SRC_DIR := C:/Users/Admin/Documents/fitd-residualvm
OBJ_DIR := $(SRC_DIR)/obj
BIN_DIR := $(SRC_DIR)/bin

SRC_FILES := $(wildcard $(SRC_DIR)/src/*.cpp) $(wildcard $(SRC_DIR)/src/common/*.cpp)
OBJ_FILES := $(patsubst $(SRC_DIR)/src/%.cpp,$(OBJ_DIR)/%.o,$(SRC_FILES))

LDFLAGS := -L "C:\MinGW\lib\SDL" -lmingw32 -lopengl32 -lglu32 -lSDLmain -lSDL -lSDL_mixer -lz
CPPFLAGS := -g -DINTERNAL_DEBUGGER -I "$(SRC_DIR)/src" -I "$(SRC_DIR)/src/common" -I "C:/MinGW/include/SDL"

fitd: $(BIN_DIR)/fitd.exe

$(BIN_DIR)/fitd.exe: $(OBJ_FILES)
	if not exist "$(BIN_DIR)" mkdir "$(BIN_DIR)"
	g++ -o $(BIN_DIR)/fitd.exe $^ $(LDFLAGS) 

$(OBJ_DIR)/%.o: $(SRC_DIR)/src/%.cpp
	if not exist "$(@D)" mkdir "$(@D)"
	g++ $(CPPFLAGS) -c -o $@ $<

#PARAMETERS
#LLVM_BASE_PATH=/home/gondow/llvm-project/
LLVM_BASE_PATH=/src/llvm-project/
LLVM_BUILD_DIRECTORY_NAME=build

OBJS=	PrintFunctions.o 
SRCS=	PrintFunctions.cpp 
TARGET=	PrintFunctions

################
LLVM_BUILD_PATH=$(LLVM_BASE_PATH)/$(LLVM_BUILD_DIRECTORY_NAME)

LLVM_BIN_PATH = $(LLVM_BUILD_PATH)/bin
LLVM_LIBS=core mc all
LLVM_CONFIG_LDFLAGS_COMMAND = $(LLVM_BIN_PATH)/llvm-config  --ldflags --libs $(LLVM_LIBS)
LLVM_CONFIG_CPPFLAGS_COMMAND = $(LLVM_BIN_PATH)/llvm-config  --cppflags

		

CLANGLIBS = \
	-lclangFrontendTool -lclangFrontend -lclangDriver \
	-lclangSerialization -lclangCodeGen -lclangParse \
	-lclangSema -lclangStaticAnalyzerFrontend \
	-lclangStaticAnalyzerCheckers -lclangStaticAnalyzerCore \
	-lclangAnalysis -lclangARCMigrate -lclangRewrite -lclangRewriteFrontend \
	-lclangEdit -lclangAST -lclangLex -lclangBasic

CXX=g++ -std=c++17
CXX_INCLUDE=`$(LLVM_CONFIG_CPPFLAGS_COMMAND)` -I$(LLVM_BASE_PATH)/clang/include -I$(LLVM_BUILD_PATH)/tools/clang/include/
CXXFLAGS=$(CXX_INCLUDE) $(CLANG_BUILD_FLAGS) $(CLANGLIBS) `$(LLVM_CONFIG_LDFLAGS_COMMAND)` -fno-rtti -g -O0 -D_DEBUG -D_GNU_SOURCE -D__STDC_CONSTANT_MACROS -D__STDC_FORMAT_MACROS -D__STDC_LIMIT_MACROS -fomit-frame-pointer -fvisibility-inlines-hidden -fno-exceptions -fno-rtti -fPIC -Woverloaded-virtual -Wcast-qual
		
all: $(TARGET)

$(TARGET):$(OBJS)
	$(CXX) $(OBJS) $(CXXFLAGS) -o $@ 

run:
	LD_LIBRARY_PATH=/home/gondow/llvm-project/build/lib ./PrintFunctions ./foo.c
	
clean:
	rm -rf $(OBJS) $(TARGET)

CC=afl-cc
CC_TARGET=example.c
CC_OUT=afl-compiled
FUZZ=afl-fuzz
FUZZ_TESTCASE=/AFLplusplus/testcases/others/text
FUZZ_OUTDIR=./out/$(CCOUT)/
FUZZ_COMMAND=/src/quit-afl.sh
FUZZ_TARGET=./$(CCOUT)
# 15分のタイムアウト
FUZZ_TIME=$$((20*60))

compile: $(CC_TARGET)
	$(CC) -o $(CC_OUT) $(CC_TARGET)

.PHONY: fuzz
fuzz: 
	$(FUZZ) -i $(FUZZ_TESTCASE) -o $(FUZZ_OUTDIR) -I $(FUZZ_COMMAND) -V $(FUZZ_TIME) -- $(FUZZ_TARGET)


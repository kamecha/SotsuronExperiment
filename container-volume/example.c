#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int fnc(int x) {
	int ret = 0;
	if(x > 0) {
		abort();
		ret = 3;
	}
	return ret;
}

int main(int argc, char *argv[]) {
	char buf[8] = { '0' };
	if (read(0, buf, 8) < 1) {
		return 0;
	}
	int seed = 0;
	seed += (int)buf[0];
	seed += (int)buf[1];
	seed += (int)buf[2];
	seed += (int)buf[3];
	fnc(seed);
	return 0;
}


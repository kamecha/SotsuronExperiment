#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

void fnc(int x) {
	int tmp = 0;
	if(x > 0) {
		if (x % 500 == 0) {
			abort();
			tmp = 1;
		} else {
			tmp = 2;
		}
	} else {
		if (x > -1000) {
			tmp = 3;
		} else {
			tmp = 4;
		}
	}
}

int main(int argc, char *argv[]) {
	char buf[8] = { '0' };
	if (read(0, buf, 8) < 1) {
	}
	int seed = 1;
	seed += (int)buf[0];
	seed += (int)buf[1];
	seed += (int)buf[2];
	seed += (int)buf[3];
	fnc(seed);
	return 0;
}



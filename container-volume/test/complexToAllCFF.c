#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

void fnc(int x) {
	int tmp = 0;
	int flag = 1;
	int state = 0;
	while (flag) {
		switch (state) {
			case 0:
				if (x > 0) {
					state = 1;
				} else {
					state = 4;
				}
				break;
			case 1:
				if (x % 500 == 0) {
					state = 2;
				} else {
					state = 3;
				}
				break;
			case 2:
				tmp = 1;
				flag = 0;
				abort();
				break;
			case 3:
				tmp = 2;
				flag = 0;
				break;
			case 4:
				if (x > -1000) {
					state = 5;
				} else {
					state = 6;
				}
				break;
			case 5:
				tmp = 3;
				flag = 0;
				break;
			case 6:
				tmp = 4;
				flag = 0;
				break;
		}
	}
}

int main(int argc, char *argv[]) {
	char buf[8] = { '0' };
	if (read(0, buf, 8) < 1) {
		return 0;
	}
	int seed = 1;
	seed += (int)buf[0];
	seed += (int)buf[1];
	seed += (int)buf[2];
	seed += (int)buf[3];
	fnc(seed);
	return 0;
}



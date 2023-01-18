#!/bin/sh
AFL_PID=$(ps aux | grep afl-fuzz | grep -v grep | awk '{print $2}')
kill $AFL_PID

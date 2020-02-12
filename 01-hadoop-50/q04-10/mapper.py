#!/usr/bin/env python3
import sys
if __name__ == "__main__":
    for line in sys.stdin:
        col1 = ""
        line = line.strip()
        splits = line.split("   ")
        col1 = splits[0]
        print(col1 + '\t1')

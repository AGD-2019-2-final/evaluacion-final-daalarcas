#!/usr/bin/env python3
import sys
import string

if __name__ == '__main__':
    (last, maxi) = (None, 0)
    
    for line in sys.stdin:
        line = line.strip()
        (key, val) = line.split('\t')
        val = int(val)
        maxi = int(maxi)
    
        if last and last != key:
            print(last + '\t' + str(maxi))
            (last, maxi) = (key, val)
        else:
            (last, maxi) = (key, max(maxi,val))      
        
    if last:
        print(last + '\t' + str(maxi))

    

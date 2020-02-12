#!/usr/bin/env python3
import sys
import string

if __name__ == '__main__':
    (last, maxi , mini) = (None, 0 , 0)
        
    for line in sys.stdin:
        line = line.strip()
        (key, val) = line.split('\t')
        val = float(val)
        maxi = float(maxi)
        mini = float(mini)
        
        if last == None:
            mini = val
    
        if last and last != key:
            print(last + '\t' + str(maxi) + '\t' + str(mini))
            (last, maxi , mini) = (key, val , val)
        else:
            (last, maxi , mini) = (key, max(maxi,val) , min(mini,val))    
        
    if last:
        print(last + '\t' + str(maxi) + '\t' + str(mini))

    

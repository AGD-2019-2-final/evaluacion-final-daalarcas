#!/usr/bin/env python3
import sys
import string

if __name__ == '__main__':
    letra = None
    lista=[]
    listnum=[]
    
    for line in sys.stdin:
        line = line.strip()
        (key,val) = line.split('\t')
        a=val.split(',')
        
        for i in a:
            lista.append((i,key))
        
    lista.sort(key=lambda m: m[0])
            
    print(lista)

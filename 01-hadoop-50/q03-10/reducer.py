#!/usr/bin/env python3
import sys
import string

if __name__ == '__main__':
    lista = []
    
    for line in sys.stdin:
        line = line.strip()
        (key, val) = line.split(',')
        val = int(val)
           
        lista.append((key, val))
    
    lista = sorted(lista, key=lambda tup:tup[1])
    
    for i in lista:
        print(i[0] + ',' + str(i[1]))

#!/usr/bin/env python3
import sys
import string

if __name__ == '__main__':
    lista = []
    
    for line in sys.stdin:
        line = line.strip()
        (key, date, val) = line.split('\t')
        val = int(val)
           
        lista.append((key, date, val))
     
    lista = sorted(lista, key=lambda tup:(tup[2]))


    for i in lista:
        if i[2] < 8:
            print(i[0] + ' ' + str(i[1]) + ' ' + str(i[2]))

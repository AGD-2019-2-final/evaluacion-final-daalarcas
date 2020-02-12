#!/usr/bin/env python3
import sys
import string

if __name__ == '__main__':
    letra = None
    lista = []
        
for line in sys.stdin:
        line = line.strip()
        (key,val) = line.split('\t')
        val = float(val)
        
        if letra == None:
            letra = key
        
        if letra == key: 
            lista.append((val))
        else:
            suma = sum(lista)
            promedio = suma / float(len(lista))
            print(letra +  '\t' + str(suma)+  '\t' + str(promedio))
            letra = key
            lista= []
            lista.append((val))

suma = sum(lista)
promedio = suma / float(len(lista))
print(letra + '\t' + str(suma)+  '\t' + str(promedio))

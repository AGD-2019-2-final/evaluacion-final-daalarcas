#!/usr/bin/env python3
import sys
if __name__ == "__main__":
	for line in sys.stdin:
		# Setting some defaults
		letra = ""
		fecha = ""
		num = 0        
		#amount = int(amount)
        
		line = line.strip()
		splits = line.split("   ")
		#print(str(len(splits)) + ' :: ' + line)
		#if len(splits) != 4: # Transactions have more columns than users
		letra = splits[0]
		fecha = splits[1]
		num = splits[2]                
			#product_id = splits[1]
		#else:
			#user_id = splits[0]
			#location = splits[3] 
		a = (letra + '\t' + fecha + '\t' + num)
		print(a)  

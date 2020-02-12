#!/usr/bin/env python3
import sys
if __name__ == "__main__":
	for line in sys.stdin:
		# Setting some defaults
		purpose = ""
		amount = ""
		#amount = int(amount)
        
		line = line.strip()
		splits = line.split(",")
		#print(str(len(splits)) + ' :: ' + line)
		#if len(splits) != 4: # Transactions have more columns than users
		purpose = splits[3]
		amount = splits[4]
                
			#product_id = splits[1]
		#else:
			#user_id = splits[0]
			#location = splits[3] 
		a = (purpose + '\t' + amount)
		print(a)   

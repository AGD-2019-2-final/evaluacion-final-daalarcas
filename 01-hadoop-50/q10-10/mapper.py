#!/usr/bin/env python3
import sys
if __name__ == "__main__":
	for line in sys.stdin:

		num = ""
		letra = ""           
		line = line.strip()
		splits = line.split("\t")
        
		letra = splits[1]
		num = splits[0]                
			#product_id = splits[1]
		#else:
			#user_id = splits[0]
			#location = splits[3] 
		a = (num + '\t'+ letra)
		print(a)  

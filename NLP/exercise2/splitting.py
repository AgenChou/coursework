import re
import os

def splitTwits(filename) 
	FILE_NAME = filename
	
	# read file line by line
	with open(FILE_NAME) as f:
		twits_raw = f.readlines() 

	# split each line into a list: twit_id, user_id, start word, end word, sentiment, twit
	twits = []
	for twit in twits_raw: 
		temp = twit.split() # sokut
		# remove empty strings
		[word for word in temp if word]
		twits.append(temp)

	for i in range(20):
		print(twits[i])


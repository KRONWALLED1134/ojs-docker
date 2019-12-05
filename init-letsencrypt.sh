#!/bin/bash
domain="your-domain.tld"
local_path="./letsencrypt"

echo "### Creating dummy certificate for $domain ..."
mkdir -p "$local_path/dummy/$domain"
openssl req -x509 -nodes -newkey rsa:1024 -days 1\
	-keyout $local_path/dummy/$domain/privkey.pem \
	-out $local_path/dummy/$domain/fullchain.pem \
    	-subj '/CN=localhost' 
echo

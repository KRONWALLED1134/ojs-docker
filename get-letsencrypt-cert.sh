#!/bin/bash
domain="your-domain.tld"
local_path=/srv/docker-ojs
email="your.email@address.tld"

echo "### Creating certificate for $domain ..."
sudo docker run -it --rm \
-v $local_path/letsencrypt:/etc/letsencrypt \
-v $local_path/var/lib/letsencrypt:/var/lib/letsencrypt \
-v $local_path/html:/data/letsencrypt \
-v $local_path/var/log/letsencrypt:/var/log/letsencrypt \
certbot/certbot \
certonly --webroot \
--email $email --agree-tos --no-eff-email \
--webroot-path=/data/letsencrypt \
-d $domain
echo

#!/bin/bash -e
clear
echo "============================================"
echo "Nginx From Source Installer"
echo "============================================"
echo "Nginx Version: "
read -e nginxversion
echo "run install? (y/n)"
read -e run
if [ "$run" == n ] ; then
exit
else
echo "============================================"
echo "A robot is now installing Nginx for you."
echo "============================================"
#move to webroot
mkdir nginx-install
cd nginx-install
#download wordpress
curl -O http://nginx.org/download/nginx-$nginxversion.tar.gz
#unzip wordpress
tar -zxvf nginx-$nginxversion.tar.gz
#change dir to wordpress
mv nginx-$nginxversion nginx
rm nginx-$nginxversion.tar.gz
git clone https://github.com/nbs-system/naxsi.git
mv naxsi nginx/naxsi
git clone https://github.com/FRiCKLE/ngx_cache_purge.git
mv ngx_cache_purge nginx/ngx_cache_purge
cd nginx/
./configure --sbin-path=/usr/bin/nginx --conf-path=/etc/nginx/nginx.conf --error-log-path=/var/log/nginx/error.log --http-log-path=/var/log/nginx/access.log --with-debug --with-pcre --user=www-data --group=www-data --with-http_ssl_module --add-module=naxsi/naxsi_src --add-module=ngx_cache_purge;
make && make install;
echo "============================================"
echo "Installation Complete!"
echo "============================================"
nginx -V
fi
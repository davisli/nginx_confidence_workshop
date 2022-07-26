#! /bin/sh

sudo yum update
sudo yum install ca-certificates wget yum-utils
sudo wget -P /etc/yum.repos.d https://cs.nginx.com/static/files/nginx-plus-7.4.repo
sudo wget -P /etc/yum.repos.d https://cs.nginx.com/static/files/app-protect-7.repo
sudo wget -P /etc/yum.repos.d https://www.dropbox.com/s/rpwr9sbzezmm02p/dependencies.repo
sleep 2s
sudo yum install app-protect -y
echo -e "\nListing the additional NAP modules\n"
ls /etc/nginx/modules
echo -e "\nNGINX App Protect Installed\n"
echo -e "Reminder:load_module modules/ngx_http_app_protect_module.so; into /etc/nginx/nginx.conf"

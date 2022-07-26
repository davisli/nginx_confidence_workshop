#! /bin/sh

echo -e "YUM Repo Update\n"
yum update -y
echo -e "Install wget to retrieve nginx .crt/.key\n"
yum install wget -y
echo -e "make /etc/ssl/nginx directory to store nginx crt/key\n"
mkdir /etc/ssl/nginx
cd /etc/ssl/nginx
echo -e "Getting NGINX-Plus .crt and .key\n"
sleep 5s
echo -e "Enter the nginx-repo.crt given to you"
read repoCrt
wget $repoCrt
sleep 5s
echo -e "Enter the nginx-repo.key given to you"
read repoKey
wget $repoKey
sleep 5s
cd /etc/ssl/nginx
echo -e "Output NGINX cert expiry for you to verify\n"
openssl x509 -enddate -noout -in nginx-repo.crt
echo -e "Installing ca-certificates, epel-release\n"
sleep 5s
yum install ca-certificates -y
yum install epel-release -y
echo -e "Retrieving NGINX-Plus Repo with NGINX .crt and .key\n"
wget -P /etc/yum.repos.d https://cs.nginx.com/static/files/nginx-plus-7.4.repo
sleep 5s
echo -e "Installing NGINX-Plus\n"
yum install nginx-plus -y
systemctl enable nginx.service
nginx -v
sleep 10s
yum install nginx-plus-module-rtmp -y
yum install nginx-plus-module-prometheus -y
sleep 5s
echo -e "Installed NGINX Dynamic Modules"
ls /etc/nginx/modules
echo -e "Reminder: Configure your SELinux or set to disabled in /etc/selinux/config\n"
sleep 2s
yum install unzip
mkdir /etc/nginx/conf.d/workshop_files
cd /etc/nginx/conf.d/workshop_files
wget https://www.dropbox.com/sh/m937i9dqwvhv60s/AABbd7WdEdL6LoLyGS-Aljj0a
unzip AABbd7WdEdL6LoLyGS-Aljj0a
echo -e "Installation Script Complete, Enjoy!\n"

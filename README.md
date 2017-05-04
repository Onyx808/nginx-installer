# NGINX FROM SOURCE INSTALLER

Make sure you backup your nginx configuration files and have NGINX dependencies installed, if you already installed from source you may skip to step 7.

1) Download NGINX Signing Key
```
wget http://nginx.org/keys/nginx_signing.key
```
2) Run the following command
```
sudo apt-key add nginx_signing.key
```
3) Edit your sources list and add NGINX repo
```
sudo nano /etc/apt/sources.list
```
4) Append the following to the end of the file, replace $codename with your Ubuntu version, example xential
```
deb http://nginx.org/packages/mainline/ubuntu/ $codename nginx
deb-src http://nginx.org/packages/mainline/ubuntu/ $codename nginx
```
5) Run apt update
```
sudo apt-get update
```
6) Install NGINX dependencies
```
sudo apt-get build-dep nginx
```
7) Clone this repo
```
git clone https://github.com/Onyx808/nginx-installer.git
```
8) Switch to root user
```
su -u root
```
9) cd into nginx-installer folder
```
cd nginx-installer
```
10) Run the script and when asked enter the nginx version you want to install or upgrade to, example 1.11.13
```
./nginx.sh
```
11) Add the init script, follow the steps from the url below
```
https://github.com/Onyx808/nginx-init-script
```

Disclaimer
==========

Use the scripts found in this repository at your own risk. You should always review the contents of these files before putting them to use. Think of them as examples for your inspiration.

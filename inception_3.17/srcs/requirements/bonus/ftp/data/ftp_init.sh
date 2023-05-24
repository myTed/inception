#!/bin/bash

upload_folder=/data/ftp/upload

#make ftp folder
mkdir -p $upload_folder

#user list create
echo $FTP_USER_NAME | tee -a  /etc/vsftpd.userlist

#make user
echo "$FTP_USER_NAME -d $upload_folder" | xargs useradd

#change passwd
echo "$FTP_USER_NAME:$FTP_USER_PASSWD" | chpasswd

#make permission
chown -R $FTP_USER_NAME:$FTP_USER_NAME $upload_folder
chmod 777 $upload_folder

#for forground
mkdir -p /var/run/vsftpd/empty

exec tini -g vsftpd

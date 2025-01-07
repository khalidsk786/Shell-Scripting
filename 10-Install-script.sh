#!/bin/bash
USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo "Execute with sudo access for installation"
exit 1 #other than 0 
fi
dnf install mysqll -y
dnf install gitt -y


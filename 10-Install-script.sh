#!/bin/bash
USERID=$(id -u)

if [$USERID -ne 0]
then
   echo "Execute with sudo access"
exit 1 #other than 0 
fi
dnf install mysql -y
dnf install git -y


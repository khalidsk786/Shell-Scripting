#!/bin/bash
USERID=$(id -u)

VALIDATE(){

if [$1 -ne 0]
then
  echo "$2...Failure"
  exit 1
else
echo "$2...success"
        
fi     
}

if [ $USERID -ne 0 ]
then
   echo "Execute with sudo access for installation"
   exit 1 #other than 0 
fi

dnf list installed mysql

if [ $? -ne 0 ]
then

 dnf install mysql -y

 VALIDATE $? "installing mysql"    
else
 echo "my sql installed already"
fi

dnf list installed git

if [ $? ne 0]

then
 dnf install git -y
       
 VALIDATE $? "installing git" 
else
 echo "git installed already"
fi




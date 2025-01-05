#!/bin/bash

R="\e[31m]"
G="\e[32m]"
Y="\e[33m]"

VALIDATE (){
if [$1 -ne 0]
then

    echo -e "$2...$R FAILURE"
    exit 1

else
     echo -e "$2... $G SUCCESS"
fi
}


if [ $? -ne 0 ]

 then
    dnf install mysql -y
    VALIDATE $?
exit 1

else
    echo -e "MY SQL...$Y installed already"
fi 
    



 
if [ $? -ne 0 ]

then
    dnf install git -y
    VALIDATE $?
    exit 1

else
    echo -e "MY git.... $Y installed already"

 fi
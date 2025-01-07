#!/bin/bash

USERID=$(id -u)
R="\e[31m]"
G="\e[32m]"
Y="\e[33m]"

LOGS_FOLDER="var/log/shellscripting.logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME= "$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){

if [$1 -ne 0]
then
  echo "$2... $R Failure $N"
  exit 1
else
   echo "$2... $G success $N"
        
fi  
}

echo "script excuted at: $TIMESTAMP" &>>$LOG_FILE_NAME
if [ $USERID -ne 0 ]
then
   echo "Execute with sudo access for installation"
   exit 1 #other than 0 
fi

dnf list installed mysql &>>$LOG_FILE_NAME

if [ $? -ne 0 ]
then

 dnf install mysql -y &>>$LOG_FILE_NAME

 VALIDATE $? "installing mysql" 
else
 echo "my sql installed already... $Y installed $N"
fi

dnf list installed git &>>$LOG_FILE_NAME

if [ $? -ne 0]
then
 dnf install git -y &>>$LOG_FILE_NAME
       
 VALIDATE $? "installing git"
else
 echo "git installed already.... $Y installed"
fi
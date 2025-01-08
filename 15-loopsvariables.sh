#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shellscripting.logs"
LOG_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER
VALIDATE() {
  if [ $1 -ne 0 ]
then
    echo -e "$2... $R Failure $N"
    exit 1
  else
    echo -e "$2... $G success $N"
  fi
}
echo "Script executed at: $TIMESTAMP" &>> $LOG_FILE_NAME
if [ $USERID -ne 0 ]
 then
  echo "Execute with sudo access for installation"
  exit 1
fi
dnf list installed mysql &>> $LOG_FILE_NAME
if [ $? -ne 0 ]
then
  dnf install mysql -y &>> $LOG_FILE_NAME
  VALIDATE $? "Installing MySQL"
else
  echo -e "MySQL installed already... $Y installed $N" &>> $LOG_FILE_NAME
fi
dnf list installed git &>> $LOG_FILE_NAME
if [ $? -ne 0 ]
then
  dnf install git -y &>> $LOG_FILE_NAME
  VALIDATE $? "Installing Git"
else
  echo -e "Git installed already... $Y installed $N" &>> $LOG_FILE_NAME
fi 

for package in $@
do
  dnf list installed $package &>>$ LOG_FILE_NAME
    if [ $? -ne 0 ]
    then
        dnf install $package $>>$ $LOG_FILE_NAME
        VALIDATE $? "INSTALLING package"
    else
        echo -e "$package already installed $Y ...INSTALLED $N"
    fi
done
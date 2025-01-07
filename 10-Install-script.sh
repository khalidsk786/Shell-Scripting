#!/bin/bash
USERID=$(id -u)

if [ $USERID -ne 0 ]
then
   echo "Execute with sudo access for installation"
   exit 1 #other than 0 
fi

dnf list installed mysql

if [ $? -ne 0 ]
then

     dnf install mysql -y

      if [ $? -ne 0 ]
      then

         echo "installing mysql : Failure"
         exit 1

      else

         echo "installing my sql : success"
        
      fi     
else
   echo "my sql installed already"
fi

dnf list installed git

if [ $? ne 0]
than
  dnf install git -y

      if [$? -ne 0]
      then
         echo "git installing : failure"
         exit 1
     else
         echo "git installing : success"

      fi
else
  echo "git installed already"
fi




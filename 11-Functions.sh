#!/bin/bash

VALIDATE (){
if [$1 -ne 0]
then

    echo"$2...FAILURE"
    exit 1

else
     echo "$2...SUCCESS"
fi
}


if [ $? -ne 0 ]

 then
    dnf install mysql -y
    VALIDATE $?
exit 1

else
    echo "MY SQL installed already"
fi 
    



 
if [ $? -ne 0 ]

then
    dnf install git -y
    VALIDATE $?
    exit 1

else
    echo "MY git installed already"

 fi

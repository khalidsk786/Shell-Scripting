#!/bin/bash
USERID=$(id -u)

if ($USERID -ne 0)

then

echo "Execute with sudo access"

exit 1
fi
dnf install mysqll -y

dnf install git -y


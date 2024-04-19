#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
echo "please run the scripts with root access"
exit 1
else

echo "you are a super user"

fi

dnf install mysql-server -y

if [ $? -ne 0 ]

then 
echo "installation of mysql is fails"
exit 1
else
echo "installation of mysql is success"

fi
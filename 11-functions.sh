#!/bin/bash

USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
    then echo "$2 installation is fails"
    exit 1
    else
    echo "$2 installation is success"
    fi
}

if [ $USERID -ne 0 ]
then 
echo " please run the scripts with Roots user"
exit 1
else
echo " your are super user"

fi

dnf instal mysql-server -y

VALIDATE $? "installing mysql"
#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$( $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
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

dnf install mysql-server -y &>>$LOGFILE

VALIDATE $? "installing mysql"
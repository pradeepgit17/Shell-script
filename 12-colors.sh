#!/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
N="\e[0m"

echo "script started execting at : $TIMESTAMP"

VALIDATE(){
if [ $1 -ne 0 ]
then
echo -e "$2 installation is $R fails $N"
exit 1
else
echo -e "$2 installation is $G pass $N "
fi 
}
if [ $USERID -ne 0 ]
then
echo "please run the scrpits with root access"
exit 1

else 
echo "your are super user"

fi

dnf install mysql-server -y

VALIDATE $? "installation mysql"

dnf install gitaafad-server -y


VALIDATE $? "worng coomat "




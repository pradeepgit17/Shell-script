#/bin/bash

USERID=$(id -u)
TIMESTAMP=$(date +%F-%H-%M-%S)
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOGFILE=/tmp/$SCRIPT_NAME-$TIMESTAMP.log
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e "$2 installation is fails"
        exit 1
    else
         echo -e  "$2 installation is success"
    fi
    }

if [ $USERID -ne 0 ]
then
      echo " please run scripts with root user"
      exit 1
else
       echo "your are superuser"
 fi      

for i in $@
do 
echo "packages to install : $i"
dnf list installed $i &>>$LOGFILE
if [ $? -eq 0 ]
 then 
    echo -e "$i already installed...$Y SKIPPING $N"
 else
     dnf install $i -y  &>>$LOGFILE
    VALIDATE $? "installation of $i"
 fi
done


#/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
echo " please run scripts with root user"
exit 1
else
echo "your are superuser"

fi
dnf install mysql-server -y

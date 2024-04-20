#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
echo " please run the scripts with Roots user"
exit 1
else
echo " your are super user"

fi

dnf installl mysql-server -y

if [ $? -ne 0 ]
then 
echo " $? installation is fails"
exit 1
else
echo " $? installation is success"

fi 
#!/bin/bash

UESRID=$(id -u)

if [ $USERID -ne 0]

then 
echo "please run the scripts with root access"

else

echo "you are a super user"

fi
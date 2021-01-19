#!/bin/bash
SECRET_FILE_PATH=/media/typist/266g/VeraCrypt/GitProj.pwd123
veracrypt -t -l | grep -iq $SECRET_FILE_PATH
if [ $? != 0 ]
then
   veracrypt $SECRET_FILE_PATH /home/typist/GitProj
fi


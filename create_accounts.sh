#!/bin/bash

if [ $# -eq 0 ]; then
	echo "Please provide path to users file."
	exit 1
fi

USERS_FILE=${1}

while read LINE; do
	NAME=`echo ${LINE} | cut -d, -f1`
	LOGIN=`echo ${LINE} | cut -d, -f2`
	PASSWORD=`echo ${LINE} | cut -d, -f3`

	adduser ${LOGIN} --gecos "${NAME},,," --disabled-password || exit 2
	printf "${PASSWORD}/n${PASSWORD}" | passwd ${LOGIN} &> /dev/null

done < ${USERS_FILE}

echo "Script executed successfully!"
exit 0

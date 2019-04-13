#!/bin/bash

if [ $# -eq 0 ]; then
	echo "Please provide path to users file."
	exit 1
fi

USERS_FILE=${1}

while read LINE; do
	LOGIN=`echo ${LINE} | cut -d, -f2`
	deluser ${LOGIN} --remove-home || exit 2

done < ${USERS_FILE}

echo "Script executed successfully!"
exit 0

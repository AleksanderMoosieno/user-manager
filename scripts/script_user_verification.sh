#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Not username : use $1 "
    exit 1
fi

username="$1"

#test authentication service
response=$(curl -s https://6853ca81a2a37a1d6f49e623.mockapi.io/api/list/users)



users=$(echo "$response" | jq -r '.[] | .list | join(",")')


if echo "$users" | grep -q "$username"; then
    echo $username   
 exit 0
else
    echo "User not found"
    exit 0
fi

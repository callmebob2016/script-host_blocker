#!/bin/bash

if [ $# -eq 0 ]
then
    echo "No arguments supplied"
    exit
fi

host_file=$1
hosts_to_block=("facebook.com" "imdb.com" "instagram.com")
ip_address="127.0.0.1"

for host_name in ${hosts_to_block[@]};
do
    matches_in_hosts="$(grep -n $host_name $host_file | cut -f1 -d:)"
    host_entry="${ip_address} ${host_name}"

    if [ ! -z "$matches_in_hosts" ] && [ $2 == 0 ]
    then
        while read -r line_number; do
            sudo sed -i "${line_number}d" $host_file
            echo "Removed entry ${host_entry}"
        done <<< "$matches_in_hosts"
    elif [ -z "$matches_in_hosts" ] && [ $2 == 1 ]
    then
        echo "$host_entry" | sudo tee -a $host_file > /dev/null
        echo "Added hosts entry ${host_entry}"
    fi
done

#!/bin/bash

node_info=$(multipass list | awk '/node-[0-9]/{print $1,$3}')
file_path="/Users/prajwal3.intern/Desktop/PP/workspace/nginx_log_analyzer/automations"
file_name="hosts.ini"

# Create hosts.ini file
cat <<EOF > $file_path/$file_name
[nodes]
EOF

while read -r name ip; do
    if [[ $name == node-* ]]; then
    echo $file_path
        echo "$ip" >> $file_path/$file_name
    fi
done <<< "$node_info"

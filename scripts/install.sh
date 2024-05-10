#!/bin/bash

# some scripts for my convinence

file=""
folder="/Users/prajwal3.intern/Desktop/PP/workspace/nginx_log_analyzer/automations"
case $1 in
    nginx-fluentbit)
        file="nginx-fluentbit.yaml"
        ;;
    grafana)
        file="grafana.yaml"
        ;;
    prometheus)
        file="prometheus.yaml"
        ;;
    loki)
        file="loki.yaml"
        ;;
    *)
        echo "Invalid option: $1, avaliable options are (nginx-fluentbit,grafana,prometheus,loki)"
        exit 1
        ;;
esac

pushd $folder
if [ -n "$file" ]; then
    ansible-playbook ansible/playbooks/$file
fi

popd 

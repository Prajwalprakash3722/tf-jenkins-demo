#!/bin/bash


file=""

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
    es)
        file="elasticsearch.yaml"
        ;;
    *)
        echo "Invalid option: $1, avaliable options are (nginx-fluentbit,grafana,prometheus,es)"
        exit 1
        ;;
esac

pushd /Users/prajwal3.intern/Desktop/PP/workspace/nginx_log_analyzer/automations

if [ -n "$file" ]; then
    ansible-playbook ansible/playbooks/$file
fi

popd /Users/prajwal3.intern/Desktop/PP/workspace/nginx_log_analyzer/automations

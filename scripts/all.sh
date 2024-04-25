#!/bin/bash

set -e
folder="/Users/prajwal3.intern/Desktop/PP/workspace/nginx_log_analyzer/scripts"

pushd $folder
if ./create_infra.sh && \
   ./parse_ip.sh && \
   ./install.sh nginx-fluentbit
   then
    echo "Installation completed successfully."
else
    echo "Installation failed."
    exit 1
fi

popd
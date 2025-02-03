#!/bin/bash

# Include common scripts functions and variables
. ${FPPDIR}/scripts/common

pushd $(dirname $(which $0))
target_PWD=$(readlink -f .)
/opt/fpp/scripts/update_plugin ${target_PWD##*/}
popd

# Add required Apache CSP (Content-Security-Policy allowed domains
${FPPDIR}/scripts/ManageApacheContentPolicy.sh add img-src https://a.espncdn.com

# Need to force reboot for CSP change to take affect
setSetting rebootFlag 1

echo ; echo “Please reboot fppd.” ; echo

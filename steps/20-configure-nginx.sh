#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail


source "${SCALR_REPOCONFIG_CONF}"

FOUND="0"

for configFile in ${NGINX_DEFAULT_CONFIG_LOCATIONS}; do
  if [ -f "$configFile" ]; then
    echo "Found default nginx configuration: '$configFile'. Overwriting."
    cp "${SCALR_REPOCONFIG_ROOT}/files/nginx-site" "$configFile"
    FOUND="1"
    break
  fi
done

if [ "${FOUND}" = "0" ]; then
  echo "Unable to find Nginx configuration."
  echo "Add the path to your Nginx default configuration in '${SCALR_REPOCONFIG_ROOT}/config.sh'."
  echo "The default configuration file MUST exist."
  exit 1
fi

service nginx reload

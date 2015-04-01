#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

source "${SCALR_REPOCONFIG_CONF}"


NGINX_USER=""

if [ -f "${NGINX_CONFIG_LOCATION}" ]; then
  # Figure out where the pid file goes before touching the config file.
  # We need this to be able to restart Nginx afterwards, and generally to avoid
  # confusing init code that might depend on it.
  NGINX_PIDFILE=$(awk -F'[ \t;]+' '/[^#]pid/ {print $2}' "${NGINX_CONFIG_LOCATION}")

  for user in ${NGINX_USER_CANDIDATES}; do
    if getent passwd "${user}" >/dev/null; then
      NGINX_USER="${user}"
      break
    fi
  done

  if [ -z "${NGINX_USER}" ]; then
    echo "Unable to find Nginx user. Add yours to NGINX_USER_CANDIDATES in '${SCALR_REPOCONFIG_ROOT}/config.sh'"
    exit 1
  fi

  echo "Nginx user is: ${NGINX_USER}"
  cp "${SCALR_REPOCONFIG_ROOT}/files/nginx.conf" "${NGINX_CONFIG_LOCATION}"
  sed -i "s|__NGINX_PIDFILE__|${NGINX_PIDFILE}|g" "${NGINX_CONFIG_LOCATION}"
  sed -i "s|__LOCAL_REPO_ROOT__|${LOCAL_REPO_ROOT}|g" "${NGINX_CONFIG_LOCATION}"
  sed -i "s/__NGINX_USER__/${NGINX_USER}/g"  "${NGINX_CONFIG_LOCATION}"
else
  echo "Unable to find nginx.conf"
  echo "Add the path to yours in NGINX_CONFIG_LOCATION in '${SCALR_REPOCONFIG_ROOT}/config.sh'"
  exit 1
fi

if service nginx status; then
  service nginx reload
else
  service nginx start
fi

# Is Nginx actually running?
service nginx status

#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

source "${SCALR_REPOCONFIG_CONF}"

if [ "${DEFAULT_REPO_ROOT}" != "${LOCAL_REPO_ROOT}" ]; then
  echo "You changed the LOCAL_REPO_ROOT (from ${DEFAULT_REPO_ROOT} to ${LOCAL_REPO_ROOT})"
  echo "If Selinux is enabled, this might create issues"
  echo "Consider disabling Selinux, or ensure your policies allow Nginx to serve files from ${LOCAL_REPO_ROOT}"
fi

echo "Done!"

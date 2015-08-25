#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

source "${SCALR_REPOCONFIG_CONF}"

remote_base="${REMOTE_REPO_ROOT}/msi"

for repo in latest; do
  cd "${LOCAL_REPO_ROOT}/${repo}/msi"

  wget "${WGET_OPTS[@]}" --accept "*.msi,index" "${remote_base}/"
done

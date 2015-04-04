#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

source "${SCALR_REPOCONFIG_CONF}"

for repo in ${CLONE_REPOS}; do
  echo "Cloning repo '$repo'"

  # Navigate to the appropriate repository
  cd "${LOCAL_REPO_ROOT}/${repo}/apt"

  # Pull latest packages from Scalr
  wget "${WGET_OPTS[@]}" "${REMOTE_REPO_ROOT}/apt-plain/${repo}/"
done

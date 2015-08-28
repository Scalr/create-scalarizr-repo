#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

source "${SCALR_REPOCONFIG_CONF}"

for repo in ${CLONE_REPOS}; do
  cd "${LOCAL_REPO_ROOT}/${repo}/win"
  wget_mirror "${REMOTE_REPO_ROOT}/win/${repo}/"
done

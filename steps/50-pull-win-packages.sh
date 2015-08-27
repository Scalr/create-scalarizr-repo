#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

source "${SCALR_REPOCONFIG_CONF}"

# Overriden for Windows for now
remote_base="${REMOTE_REPO_ROOT}/win"

for repo in ${CLONE_REPOS}; do
  cd "${LOCAL_REPO_ROOT}/${repo}/win"
  wget_mirror "${remote_base}/${repo}/"
done

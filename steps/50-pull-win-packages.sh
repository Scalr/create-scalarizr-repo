#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

source "${SCALR_REPOCONFIG_CONF}"

# Overriden for Windows for now
remote_base="/win"

for repo in $CLONE_REPOS; do
  echo "Cloning repo '$repo'"
  
  cd "${LOCAL_REPO_ROOT}/${repo}/win/x86_64"

  wget "${WGET_OPTS[@]}" "${REMOTE_REPO_ROOT}/win/${repo}/x86_64/"

done

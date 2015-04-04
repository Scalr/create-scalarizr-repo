#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

source "${SCALR_REPOCONFIG_CONF}"

for repo in ${CLONE_REPOS}; do
  echo "Cloning repo '$repo'"

  # Navigate to the appropriate repository
  cd "${LOCAL_REPO_ROOT}/${repo}/apt"

  # Pull latest packages from Scalr (without gpg signature)
  wget_opts_reject_gpg="--reject='*.gpg' --reject=InRelease"
  wget "${WGET_OPTS[@]} ${wget_opts_reject_gpg} ${REMOTE_REPO_ROOT}/apt-plain/${repo}/"
done

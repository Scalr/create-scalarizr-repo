#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

source "${SCALR_REPOCONFIG_CONF}"

remote_base="${REMOTE_REPO_ROOT}/rpm"

for repo in ${CLONE_REPOS}; do
  cd "${LOCAL_REPO_ROOT}/${repo}/rpm/rhel/latest"
  wget_mirror "${REMOTE_REPO_ROOT}/rpm/${repo}/rhel/latest/"
  cd ..
  for alias in ${RHEL_VERSIONS}; do
    if [ -d "${alias}" ] && [ ! -L "${alias}" ]; then
      # Old versions actually copied to those directories
      echo "WARNING: removing obsolete ${alias}"
      rm -rf "${alias}"
    fi
    ln -sfT "latest" "${alias}"
  done

  cd "${LOCAL_REPO_ROOT}/${repo}/rpm/rhel/5"
  wget_mirror "${REMOTE_REPO_ROOT}/rpm/${repo}/rhel/5/"
  cd ..
  for alias in 5Server 5.11; do
    if [ -d "${alias}" ] && [ ! -L "${alias}" ]; then
      # Old versions actually copied to those directories
      echo "WARNING: removing obsolete ${alias}"
      rm -rf "${alias}"
    fi
    ln -sfT "5" "${alias}"
  done
done

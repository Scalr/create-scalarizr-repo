#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

source "${SCALR_REPOCONFIG_CONF}"

# Create repository layout
for repo in ${CLONE_REPOS}; do
  # APT setup
  # TODO - Variablize!
  mkdir -p "${LOCAL_REPO_ROOT}/${repo}/apt"

  # Windows setup
  mkdir -p "${LOCAL_REPO_ROOT}/${repo}/win/x86_64"

  # RHEL setup (all repos are aliases of "latest")
  mkdir -p "${LOCAL_REPO_ROOT}/${repo}"/rpm/rhel/latest/{x86_64,i386}
  cd "${LOCAL_REPO_ROOT}/${repo}/rpm/rhel"
  for alias in ${RHEL_VERSIONS}; do
    if [ -d "${alias}" ] && [ ! -L "${alias}" ]; then
      # Old versions actually copied to those directories
      echo "WARNING: removing obsolete ${alias}"
      rm -rf "${alias}"
    fi
    ln -sfT "latest" "${alias}"
  done

done

# Remove index files
rm -f "${LOCAL_REPO_ROOT}"/index.*

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
  mkdir -p "${LOCAL_REPO_ROOT}/${repo}/win"

  # RHEL setup (all repos are aliases of "latest")
  mkdir -p "${LOCAL_REPO_ROOT}/${repo}"/rpm/rhel/latest
done

# Remove index files
rm -f "${LOCAL_REPO_ROOT}"/index.*

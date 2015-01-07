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

  # RHEL setup
  mkdir -p "${LOCAL_REPO_ROOT}/${repo}"/rpm/rhel/{5,6,7}/{x86_64,i386}
  cd "${LOCAL_REPO_ROOT}/${repo}/rpm/rhel"
  for alias in ${RHEL_5_ALIASES}; do
    ln -sfT 5 "${alias}"
  done
  for alias in ${RHEL_6_ALIASES}; do
    ln -sfT 6 "${alias}"
  done
  for alias in ${RHEL_7_ALIASES}; do
    ln -sfT 7 "${alias}"
  done

done

# Remove index files
rm -f "${LOCAL_REPO_ROOT}"/index.*

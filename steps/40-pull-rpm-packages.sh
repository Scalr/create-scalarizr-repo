#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

source "${SCALR_REPOCONFIG_CONF}"

remote_base="${REMOTE_REPO_ROOT}/rpm"

for repo in ${CLONE_REPOS}; do
  remote_repo_base="${remote_base}/${repo}/rhel/latest"
  extra_wget_opts=("--accept" "*.rpm")

  for arch in x86_64 i386; do
    cd "${LOCAL_REPO_ROOT}/${repo}/rpm/rhel/latest/${arch}"
    echo "## mirroring $arch"
    wget "${WGET_OPTS[@]}" "${extra_wget_opts[@]}" "${remote_repo_base}/${arch}/"
    createrepo .
  done

done

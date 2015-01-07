#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

source "${SCALR_REPOCONFIG_CONF}"

base_url="${REMOTE_REPO_ROOT}/rpm"

for repo in ${CLONE_REPOS}; do
  for ver in ${RHEL_VERSIONS}; do
    for arch in x86_64 i386; do
      cd "${LOCAL_REPO_ROOT}/${repo}/rpm/rhel/${ver}/${arch}"
      echo "## mirroring $ver/$arch"
      wget ${WGET_OPTS} --accept "*.rpm" "${base_url}/${repo}/rhel/${ver}/${arch}/"
      createrepo .
    done
  done
done

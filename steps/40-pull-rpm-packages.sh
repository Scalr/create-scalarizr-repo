#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

source "${SCALR_REPOCONFIG_CONF}"

remote_base="${REMOTE_REPO_ROOT}/rpm"

for repo in ${CLONE_REPOS}; do
  remote_repo_base="${remote_base}/${repo}/rhel"
  extra_wget_opts=("--accept" "*.rpm")

  # Until February 2015, stable is still on builbot!
  if [ "${repo}" = "stable" ]; then
    remote_repo_base="http://rpm-delayed.scalr.net/rpm/rhel"
    extra_wget_opts+=("--reject" "scalarizr-0.*.rpm,scalarizr-*-0.*.rpm,scalarizr-*-1.*.rpm,scalarizr-*-2.?.*.rpm,scalr-upd-client-*.rpm")  # Exclude old packages
  fi

  for ver in ${RHEL_VERSIONS}; do

    # At this time, stable has no RHEL 7 packages.
    if [ "${repo}" = "stable" ] && [ "$ver" = 7 ]; then
      continue
    fi

    for arch in x86_64 i386; do
      cd "${LOCAL_REPO_ROOT}/${repo}/rpm/rhel/${ver}/${arch}"
      echo "## mirroring $ver/$arch"
      wget "${WGET_OPTS[@]}" "${extra_wget_opts[@]}" "${remote_repo_base}/${ver}/${arch}/"
      createrepo .
    done
  done
done

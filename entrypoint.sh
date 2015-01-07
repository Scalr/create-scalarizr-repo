#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail

REL_HERE=$(dirname "${BASH_SOURCE}")
HERE=$(cd "${REL_HERE}"; pwd)  # Get an absolute path

export SCALR_REPOCONFIG_ROOT="${HERE}"
export SCALR_REPOCONFIG_CONF="${HERE}/config.sh"

# Are we up to date?
"${HERE}/git-check.sh"

# RW / RW / RO
umask 002

for script in "${HERE}/steps"/*; do
  echo "Running step: '${script}'"
  "$script" || {
    echo "An error occured!"
    exit 1
  }
done

echo "DONE!"
exit 0

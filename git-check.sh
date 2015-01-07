#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail


cd -- "${SCALR_REPOCONFIG_ROOT}"

sleep_wait () {
    echo "This script will sleep for 10 seconds now. Press CTRL+C to stop it."
    sleep 10
}


if git status >/dev/null 2>&1; then
  echo "This appears to be a git repository. Checking for updates."
  if git fetch >/dev/null 2>&1; then
    LOCAL=$(git rev-parse "HEAD")
    REMOTE=$(git rev-parse "HEAD@{u}")
    BASE=$(git merge-base "HEAD" "HEAD@{u}")
    if [ $LOCAL = $REMOTE ]; then
        echo "You're up to date!"
    elif [ $LOCAL = $BASE ]; then
        echo "You're out of date! We seriously recommend updating."
        echo "Run 'git pull' to update."
        sleep_wait
    elif [ $REMOTE = $BASE ]; then
        echo "You seem to have added your own commits."
    else
        echo "You seem to have added your own commits."
    fi
  else
    echo "Unable to check for updates. Run 'git fetch' to see what the issue was."
  fi
else
  echo "Unable to check for updates. Run 'git status' to see what the issue was."
fi


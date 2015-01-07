#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail


# Install dependencies

if which apt-get; then
  apt-get install -q -y nginx createrepo dpkg-dev wget
elif which yum; then
  echo "Found yum -- epel MUST be enabled!"
  yum install -q -y nginx createrepo dpkg-devel wget
else
  echo "No known package manager found (tried apt-get, yum)."
  exit 1
fi

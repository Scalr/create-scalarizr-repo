#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail


# Install dependencies
apt-get install -qy nginx createrepo dpkg-dev wget

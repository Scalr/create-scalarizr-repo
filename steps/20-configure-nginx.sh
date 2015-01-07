#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail


source "${SCALR_REPOCONFIG_CONF}"

cp "${SCALR_REPOCONFIG_ROOT}/files/nginx-site" "/etc/nginx/sites-available/default"
service nginx reload

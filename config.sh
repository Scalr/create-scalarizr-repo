# Configurable
DEFAULT_REPO_ROOT="/var/www"
: ${ORG_NAME:="Your company name"}
: ${LOCAL_REPO_ROOT:="$DEFAULT_REPO_ROOT"}

: ${NGINX_USER_CANDIDATES:="nginx www-data"}
: ${NGINX_CONFIG_LOCATION:="/etc/nginx/nginx.conf"}

# Should not be touched
CLONE_REPOS="stable latest"

REMOTE_REPO_ROOT="http://snapshot.repo.scalr.net/scalarizr/current"

RHEL_5_ALIASES="5 5Server"
RHEL_6_ALIASES="6 6Server 6.0 6.1 6.2 6.3 6.4 6.5 6.6 2013.03 2013.09 2014.03 2014.09 2015.03"
RHEL_7_ALIASES="7 7Server 7.0"

WGET_OPTS=("--recursive" "--no-directories" "--timestamping" "--no-parent" "--no-verbose" "--execute" "robots=off")

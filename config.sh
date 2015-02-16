# Configurable
ORG_NAME="Your company name"

NGINX_DEFAULT_CONFIG_LOCATIONS="/etc/nginx/sites-available/default /etc/nginx/conf.d/default.conf"

# Should not be touched
CLONE_REPOS="stable latest"

LOCAL_REPO_ROOT="/var/www"
REMOTE_REPO_ROOT="http://repo.scalr.net"

RHEL_VERSIONS="5 6 7"
RHEL_5_ALIASES="5Server"
RHEL_6_ALIASES="6Server 6.0 6.1 6.2 6.3 6.4 6.5 6.6"
RHEL_7_ALIASES="7Server 7.0 latest"

WGET_OPTS=("--recursive" "--no-directories" "--timestamping" "--no-parent" "--no-verbose" "--execute" "robots=off")

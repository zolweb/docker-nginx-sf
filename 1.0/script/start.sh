#!/usr/bin/env bash
set -o errexit

__DIR__="$(cd "$(dirname "${0}")"; echo $(pwd))"
__BASE__="$(basename "${0}")"
__FILE__="${__DIR__}/${__BASE__}"


# Give permissions to read and write in workdir for users root and www-data
setfacl -R -m u:www-data:rwx -m u:root:rwx /var/www
setfacl -dR -m u:www-data:rwx -m u:root:rwx /var/www

/usr/sbin/nginx

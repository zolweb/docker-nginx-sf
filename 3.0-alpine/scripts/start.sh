#!/usr/bin/env bash
set -e

create_logs() {
    # Create the log file with the given user to avoid permissions problems
    local log_dir="/var/log/nginx"
    local access_log_file="${log_dir}/access.log"
    local error_log_file="${log_dir}/error.log"
    local special_log_file="${log_dir}/access-special.log"

    if [ ! -z "$UID" ] && [ ! -z "$GID" ]; then
        mkdir -p ${log_dir} \
            && touch ${access_log_file} \
            && touch ${error_log_file} \
            && touch ${special_log_file} \
            && chown -R $UID:$GID ${log_dir}
    fi
}

create_logs

crond &
nginx
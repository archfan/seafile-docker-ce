#!/bin/bash

set -e
set -o pipefail

if [[ $SEAFILE_BOOTSRAP != "" ]]; then
    exit 0
fi

dirs=(
    conf
    ccnet
    seafile-data
    seahub-data
    seahub.db
)

for d in ${dirs[*]}; do
    src=/shared/seafile/$d
    if [[ -e $src ]]; then
        ln -sf $src /opt/seafile/
    fi
done

if [[ -e /shared/logs/seafile ]]; then
    ln -sf /shared/logs/seafile/ /opt/seafile/logs
fi

# TODO: create avatars link
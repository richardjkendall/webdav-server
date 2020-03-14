#!/usr/bin/env sh
set -eu

envsubst '${REGION} ${TABLE} ${REALM} ${CACHE_FOLDER} ${CACHE_DURATION}' < /aws.pam > /etc/pam.d/aws

exec "$@"

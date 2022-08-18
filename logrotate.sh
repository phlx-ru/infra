#!/usr/bin/bash

# Prints logs for every passed in arguments service name

TRAEFIK_ACCESS_LOG_FILE=/var/log/traefik_access.log
LOGROTATE_CONFIG_FILE=/etc/logrotate.d/traefik

if [ ! -f  ${TRAEFIK_ACCESS_LOG_FILE} ]; then
  touch ${TRAEFIK_ACCESS_LOG_FILE}
  echo "created file ${TRAEFIK_ACCESS_LOG_FILE}"
fi

if [ ! -f  ${LOGROTATE_CONFIG_FILE} ]; then

cat <<- EOF > ${LOGROTATE_CONFIG_FILE}
${TRAEFIK_ACCESS_LOG_FILE}
{
    su root root
    size 1k
    copytruncate
    rotate 7
    notifempty
}
EOF

echo "created file ${LOGROTATE_CONFIG_FILE}"

fi

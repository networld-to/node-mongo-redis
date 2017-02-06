#!/bin/bash
export MONGO_DATA_DIR=/data/db
export MONGO_LOG_DIR=/var/log/mongodb
export MONGO_USER=mongodb

map_uidgid() {
  USERMAP_ORIG_UID=$(id -u ${MONGO_USER})
  USERMAP_ORIG_GID=$(id -g ${MONGO_USER})
  USERMAP_GID=${USERMAP_GID:-${USERMAP_GID:-$USERMAP_ORIG_GID}}
  USERMAP_UID=${USERMAP_UID:-$USERMAP_ORIG_UID}
  if [[ ${USERMAP_UID} != ${USERMAP_ORIG_UID} ]] || [[ ${USERMAP_GID} != ${USERMAP_ORIG_GID} ]]; then
    echo "Mapping UID and GID for ${MONGO_USER}:${MONGO_USER} from ${USERMAP_ORIG_UID}:${USERMAP_ORIG_GID} to ${USERMAP_UID}:${USERMAP_GID}"
    groupmod -g ${USERMAP_GID} ${MONGO_USER}
    sed -ie "s/:${USERMAP_ORIG_UID}:${USERMAP_ORIG_GID}:/:${USERMAP_UID}:${USERMAP_GID}:/" /etc/passwd
  fi
}

create_data_dir() {
  mkdir -p ${MONGO_DATA_DIR}
  chmod -R 0755 ${MONGO_DATA_DIR}
  chown -R ${MONGO_USER}:${MONGO_USER} ${MONGO_DATA_DIR}
}

create_log_dir() {
  mkdir -p ${MONGO_LOG_DIR}
  chmod -R 0755 ${MONGO_LOG_DIR}
  chown -R ${MONGO_USER}:${MONGO_USER} ${MONGO_LOG_DIR}
}

map_uidgid
create_data_dir
create_log_dir

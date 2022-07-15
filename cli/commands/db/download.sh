#!/bin/bash
REMOTE_DB_HOST=$(get_config REMOTE_DB_HOST "Remote database host")
REMOTE_DB_NAME=$(get_config REMOTE_DB_NAME "Remote database name")
REMOTE_DB_USER=$(get_config REMOTE_DB_USER "Remote database user")
REMOTE_DB_PASSWORD=$(get_secret REMOTE_DB_PASSWORD "Remote database password")

SQL_FILENAME="docker/mariadb-init/"$REMOTE_DB_NAME"_"$(date +"%m_%d_%y_%H%M%S")".sql"

cd docker
make remote-mysqldump REMOTE_DB_HOST=$REMOTE_DB_HOST REMOTE_DB_USER=$REMOTE_DB_USER REMOTE_DB_PASSWORD=$REMOTE_DB_PASSWORD REMOTE_DB_NAME=$REMOTE_DB_NAME SQL_FILE=$SQL_FILENAME
cd ..
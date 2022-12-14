#!/bin/bash

set -euo pipefail

if [ $# -ne 1 ]; then
    echo "Only one argument is required: the directory in which to place the dump"
    exit 1
fi

DEST_DIR="$1"
DEST_FILE="${DEST_DIR}/dump.sql"

echo "$DB_HOST:$DB_PORT:*:$DB_USERNAME:$DB_PASSWORD" > $HOME/.pgpass
chmod 600 $HOME/.pgpass

mkdir -p "${DEST_DIR}"
echo "Dumping postgresql databases to ${DEST_FILE}"
pg_dumpall -h $DB_HOST -p $DB_PORT -U "$DB_USERNAME" -f "${DEST_FILE}"

#!/usr/bin/env bash

set -e

if [ ! -f "$PGDATA/postgresql.conf" ]; then
    pg_basebackup -D "$PGDATA" -d "$MASTER_CONNSTRING" -R -x --verbose
fi

if [ ! -z "$REPSLOT" ]; then
    echo "primary_slot_name=$REPSLOT" >> $PGDATA/recovery.conf
fi

exec /docker-entrypoint.sh $*

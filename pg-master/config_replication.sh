#!/usr/bin/env bash

# This enables replication on the master
echo 'max_wal_senders=2' >> $PGDATA/postgresql.conf
echo 'wal_level=hot_standby' >> $PGDATA/postgresql.conf
echo 'host replication postgres 0.0.0.0/0 trust' >> $PGDATA/pg_hba.conf

# This enables hot standby
echo 'hot_standby=on' >> $PGDATA/postgresql.conf
echo 'hot_standby_feedback=on' >> $PGDATA/postgresql.conf

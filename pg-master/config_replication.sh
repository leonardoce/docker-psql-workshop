#!/usr/bin/env bash

# This enables replication on the master
echo 'max_wal_senders=5' >> $PGDATA/postgresql.conf
echo 'wal_level=hot_standby' >> $PGDATA/postgresql.conf
echo 'wal_keep_segments=16' >> $PGDATA/postgresql.conf
echo 'max_replication_slots=5' >> $PGDATA/postgresql.conf

# This enables replication access from all containers. In the official
# docker image there is a similar rule for data access, but streaming
# access needs a rule on its own.
echo 'host replication postgres 0.0.0.0/0 trust' >> $PGDATA/pg_hba.conf

# This enables hot standby
echo 'hot_standby=on' >> $PGDATA/postgresql.conf
echo 'hot_standby_feedback=on' >> $PGDATA/postgresql.conf

PostgreSQL standby image
=======================

This is a Docker image for a replication PostgreSQL hot standby
server.

Before starting PostgreSQL for the first time, this image create a
physical backup of the master's data directory using `pg_basebackup`,
and then start the PostgreSQL standby instance.

If is needed, you can specify a replication slot for the standby to
use.


Prerequisites
=============

You need a `MASTER_CONNSTRING` environment variable to specify a
connection string for the standby to reach the master. To make the
master reachable from the standby, you can use names and Docker
networks, or use links with the Docker `bridge` network.

You can pass a `REPSLOT` environment variable to specify a physical
replication slot on the master for the standby to use.


How to use this image
=====================

Let's suppose you have started a PostgreSQL master server using the
`leonardoce/workshop-pg-master` image, named `workshop-master`. If you
want to start a standby container, you can simply use this command:

    $ docker run -d \
        --name pg-standby \
		--link pg-master:master \
	    -e "MASTER_CONNSTRING=host=master user=postgres" \
		leonardoce/workshop-pg-standby

# Docker workshop images

This repository contains two Dockerfiles, which are automatically
built in the Docker hub[docker_hub], that are useful to play with Docker
and PostgreSQL.

With this images you can create a PostgreSQL master server, and then
create servers in standby-mode.

## How to create a master server

    $ docker run -d --name workshop-master leonardoce/workshop-pg-master

## How to create a standby server

    $ docker run -d \
        --name workshop-standby \
		--link workshop-master:master \
	    -e "MASTER_CONNSTRING=host=master user=postgres" \
		leonardoce/workshop-pg-standby

[docker_hub]: https://hub.docker.com/u/leonardoce/

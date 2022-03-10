FROM debian:buster

COPY ./tools /tools

RUN apt-get update && apt-get install -y mariadb-server

EXPOSE 3306

ENTRYPOINT	["sh", "/tools/mysql_init.sh"]
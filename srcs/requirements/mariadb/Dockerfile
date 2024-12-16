FROM alpine:3.20

RUN apk update && apk upgrade && apk add mariadb

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/script.sh /script.sh
RUN chmod +x /script.sh
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld /var/lib/mysql

ENTRYPOINT ["/script.sh"]

FROM alpine:3.20

RUN apk update && apk upgrade && apk add wget php83 php83-fpm php83-mysqlnd mariadb-client

RUN mkdir -p /var/www/html
RUN wget https://wordpress.org/wordpress-6.7.1.zip -P /var/www/html
RUN cd /var/www/html && unzip wordpress-6.7.1.zip && rm wordpress-6.7.1.zip
RUN chown -R root:root /var/www/html/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp && \
	chmod +x /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/8.3/fpm/pool.d/.

COPY ./conf/configure.sh /
RUN chmod +x /configure.sh
CMD ["/configure.sh"]

FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install -y php7.4-fpm php7.4-mysql mariadb-client wget unzip curl tar

RUN mkdir -p /var/www/html
# RUN wget https://wordpress.org/wordpress-6.7.1.zip -P /var/www/
# RUN cd /var/www/ && unzip wordpress-6.7.1.zip && rm wordpress-6.7.1.zip
RUN chown -R www-data:www-data /var/www/html

# RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp && \
# 	chmod +x /usr/local/bin/wp
RUN mkdir -p /run/php && chown root:root /run/php
RUN curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x /usr/local/bin/wp
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/.

COPY ./tools/configure.sh /configure.sh
RUN chmod +x /configure.sh
CMD ["/configure.sh"]

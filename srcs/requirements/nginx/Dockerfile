FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install -y nginx openssl
RUN mkdir -p /etc/nginx/ssl
# orignal 2048
RUN openssl req -x509 -nodes -days 100 -newkey rsa:4096 -keyout /etc/nginx/ssl/nginx-selfsigned.key \
	-out /etc/nginx/ssl/nginx-selfsigned.crt -subj "/C=DE/O=42/OU=student/CN=padam.42.fr"

COPY ./conf/default /etc/nginx/sites-available/default

# RUN chmod 755 /var/www/html
# RUN chown -R www-data:www-data /var/www/html

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

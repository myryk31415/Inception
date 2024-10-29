FROM alpine:3.19

RUN apk update && apk upgrade && apk add nginx openssl

# orignal 2048
RUN openssl req -x509 -nodes -days 100 -newkey rsa:4096 -keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=DE/O=42/OU=student/CN=[padam.42.fr](http://padam.42.fr/)"


build:
	docker build -t mariadb srcs/requirments/mariadb
	docker build -t nginx srcs/requirments/nginx
	docker build -t wordpress srcs/requirments/wordpress

run:
	docker run mariadb
	docker run nginx
	docker run wordpress

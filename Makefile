
all: build up

build:
	@mkdir -p home/padam/data/wordpress
	@mkdir -p home/padam/data/mariadb
	@sudo chown -R padam:padam /home/padam/data
	@docker-compose  -f srcs/docker-compose.yml -d build

up:
	@docker-compose  -f srcs/docker-compose.yml up

stop:
	@docker-compose -f srcs/docker-compose.yml stop

fclean:
	@docker-compose  -f srcs/docker-compose.yml down -v
	@docker volume prune -f
	@sudo rm -rf /home/padam/data

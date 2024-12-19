
all: build up

build:
	@mkdir -p /home/padam/data/wordpress
	@mkdir -p /home/padam/data/mariadb
	@sudo chown -R padam:padam /home/padam/data
	@docker-compose -f srcs/docker-compose.yml build

up:
	@docker-compose -f srcs/docker-compose.yml up

down:
	@docker-compose -f srcs/docker-compose.yml down

fclean:
	@docker-compose -f srcs/docker-compose.yml down -v
	@docker volume prune -f
	@sudo rm -rf /home/padam/data

re: fclean all

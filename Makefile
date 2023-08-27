up:
	sudo mkdir -p /home/dahkang/data/db_data
	sudo mkdir -p /home/dahkang/data/wp_data
	docker-compose -f ./srcs/docker-compose.yml up -d

up-log:
	sudo mkdir -p /home/dahkang/data/db_data
	sudo mkdir -p /home/dahkang/data/wp_data
	docker-compose -f ./srcs/docker-compose.yml up

logs:
	docker-compose -f ./srcs/docker-compose.yml logs -f

down:
	docker-compose -f ./srcs/docker-compose.yml down

down-v:
	docker-compose -f ./srcs/docker-compose.yml down -v
	sudo rm -rf /home/dahkang/data/db_data
	sudo rm -rf /home/dahkang/data/wp_data

fclean:
	docker image prune -a
	docker volume prune
	sudo rm -rf /home/dahkang/data/db_data
	sudo rm -rf /home/dahkang/data/wp_data

.PHONY: up up-log down down-v fclean
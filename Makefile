up:
	mkdir -p ~/data/db_data
	mkdir -p ~/data/wp_data
	docker-compose -f ./srcs/docker-compose.yml up -d

up-log:
	mkdir -p ~/data/db_data
	mkdir -p ~/data/wp_data
	docker-compose -f ./srcs/docker-compose.yml up

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
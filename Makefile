NAME := Inception

SCRIPTS := srcs/requirements/nginx/tools

DATA1 := /home/minummin/data/mariadb

DATA2 := /home/minummin/data/wordpress

DATA3 := /home/minummin/data

all: $(NAME)

$(NAME):
	@sudo mkdir -p $(DATA1) $(DATA2)
	@sudo chmod 777 /etc/hosts
	@cd $(SCRIPTS) && sudo chmod 755 add_host.sh
	@cd $(SCRIPTS) && sudo chmod 755 remove_host.sh
	@echo "\033[1;32mVolume folders has been created!\033[0m"
	@cd srcs && docker-compose build
	@echo "\033[1;32mDocker images has been built!\033[0m"

download_docker:
	@sudo apt-get remove docker-compose
	@sudo rm -f /usr/local/bin/docker-compose
	@sudo curl -L "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	@sudo chmod +x /usr/local/bin/docker-compose

add_host:
	@cd $(SCRIPTS) && ./add_host.sh

remove_host:
	@cd $(SCRIPTS) && ./remove_host.sh

build:
	@cd srcs && docker-compose build
	@echo "\033[1;32mDocker images has been built!\033[0m"

up: add_host
	@cd srcs && docker-compose up -d
	@echo "\033[1;32mVolumes has been created and containers are running!\033[0m"
	@sudo service nginx stop
	@sudo service mysql stop

down:
	@cd srcs && docker-compose down -v
	@echo "\033[1;32mDocker containers are stopped and they have been removed\033[0m"

remove_images:
	@docker rmi `docker images -q`
	@echo "\033[1;32mDocker images has been removed\033[0m"

remove_data:
	@sudo rm -rf $(DATA3)
	@echo "\033[1;32mVolume data has been deleted\033[0m"

clean: down remove_images

fclean: clean remove_data remove_host

re: fclean all

.PHONY: all add_host remove_host up down remove_images remove_data clean fclean re
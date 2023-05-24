all:
	docker compose -f srcs/docker-compose.yml up -d --build 

clean:
	docker compose -f srcs/docker-compose.yml down

fclean:
	rm -rf  data/*
	cd srcs && docker volume prune
	cd srcs && docker image prune -a

.PHONY: clean fclean
all:
	docker compose -f srcs/docker-compose.yml up -d --build 

clean:
	docker compose -f srcs/docker-compose.yml down

fclean: 
	rm -rf  /home/kyolee/data/*
	docker compose -f srcs/docker-compose.yml down -v
	docker image prune -a

.PHONY: clean fclean all

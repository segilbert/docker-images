#
# Makefile for aspnet-sample
#

NAME =	frozenbytes/aspnet-sample:0.0.1-alpha
NAME_CONTAINER = aspnet-sample-test

build:
	docker build -t $(NAME) ./

tag:
	docker tag $(NAME)

release:
	docker push $(NAME)

start:
	docker run -d --name aspnet-sample-test -p 80:80 $(NAME) 
	docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" $(NAME_CONTAINER)

stop:
	docker stop $(NAME_CONTAINER)

compose-up:
	#docker-compose up -d --no-recreate

compose-up-rc:
	#docker-compose up -d 

run:
	#docker-compose run --service-ports --rm $(NAME)
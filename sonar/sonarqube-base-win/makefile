#
# Makefile for sonarqube-base-win
#

NAME =	frozenbytes/sonarqube-base-win:0.0.2-alpha 
NAME_CONTAINER = sonarqube-base-win-razor

build:
	docker build -t $(NAME) ./

tag:
	docker tag $(NAME)

release:
	docker push $(NAME)

start:
	docker run -d --name $(NAME_CONTAINER) -p 9000:9000 $(NAME) 
	docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" $(NAME_CONTAINER)

stop:
	docker stop $(NAME_CONTAINER)

compose-up:
	#docker-compose up -d --no-recreate

compose-up-rc:
	#docker-compose up -d 

run:
	#docker-compose run --service-ports --rm $(NAME)
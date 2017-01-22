#
# Makefile for docker__CONTAINER_NAME__
#

NAME =	docker__REPOSITORY_NAME__/docker__IMAGE_NAME__

build:
	docker build -t $(NAME) .

release:
	docker push $(NAME)

compose-up:
	docker-compose up -d --no-recreate
compose-up-rc:
	docker-compose up -d 
run:
	docker-compose run --service-ports --rm docker__IMAGE_NAME__

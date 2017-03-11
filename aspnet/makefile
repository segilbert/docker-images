#
# Makefile for aspnet-sample
#

NAME =	frozenbytes/aspnet-sample:0.0.1-alpha

build:
	docker build -t aspnet-sample:0.0.1-alpha ./

release:
	docker push aspnet-sample:0.0.1-alpha

start:
	docker run -d --name aspnet-sample-test -p 8000:8000 frozenbytes/aspnet-sample:0.0.1-alpha 
	docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" aspnet-sample-test

stop:
	docker stop aspnet-sample-test

compose-up:
	#docker-compose up -d --no-recreate

compose-up-rc:
	#docker-compose up -d 

run:
	#docker-compose run --service-ports --rm aspnet-sample:0.0.1-alpha
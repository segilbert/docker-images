#
# Makefile for aspnet-core-sample
#

NAME =	frozenbytes/aspnet-core-sample:0.0.1-alpha

build:
	docker build -t $(aspnet-core-sample:0.0.1-alpha) .

release:
	docker push $(aspnet-core-sample:0.0.1-alpha)

start:
	docker run -d --name aspnet-core-sample-test -p 8000:8000 frozenbytes/aspnet-core-sample:0.0.1-alpha 
	docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" aspnet-core-sample-test

stop:
	docker stop aspnet-core-sample-test

compose-up:
	#docker-compose up -d --no-recreate

compose-up-rc:
	#docker-compose up -d 

run:
	#docker-compose run --service-ports --rm aspnet-core-sample:0.0.1-alpha
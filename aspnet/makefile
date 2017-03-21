#
# Makefile for aspnet-sample
#

NAME =	frozenbytes/aspnet-sample:0.0.1-alpha
NAME_CONTAINER = aspnet-sample-web
NAME_DB_CONTAINER = aspnet-sample-db

build:
	docker build -t $(NAME) ./

tag:
	docker tag $(NAME)

release:
	docker push $(NAME)

start:
	docker run -d --name $(NAME_CONTAINER) -p 8000:8000 $(NAME) 
	docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" $(NAME_CONTAINER)

stop:
	docker stop $(NAME_CONTAINER)

test_start_sql:
	docker run -d --name $(NAME_DB_CONTAINER) -p 1433:1433 -e sa_password=!2017AdWorks! -e ACCEPT_EULA=Y microsoft/mssql-server-windows:windowsservercore-10.0.14393.693
	docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" $(NAME_DB_CONTAINER)

test_start_sql_aw:
	docker run -d --name $(NAME_DB_CONTAINER) -p 1433:1433 -e sa_password=!2017AdWorks! -e ACCEPT_EULA=Y -v C:/data/docker/itasca-reference/mssql-server/data/:C:/data/mssql-server-data/ -e attach_dbs="[{'dbName':'AdventureWorks2012','dbFiles':['C:\\data\\mssql-server-data\\AdventureWorks2012_Data.mdf','C:\\data\\mssql-server-data\\AdventureWorks2012_Log.ldf']}]" microsoft/mssql-server-windows:windowsservercore-10.0.14393.693
	docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" $(NAME_DB_CONTAINER)

test_compose-sql-up:
	docker-compose --verbose up -d 
	docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" $(NAME_DB_CONTAINER)

compose-up:
	docker-compose --verbose up -d
	docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" $(NAME_CONTAINER)
	docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" $(NAME_DB_CONTAINER)
	
compose-up-rc:
	docker-compose up -d --verbose
	docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" $(NAME_CONTAINER)
	docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" $(NAME_DB_CONTAINER)	
run:
	#docker-compose run --service-ports --rm $(NAME)
	#docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" $(NAME_CONTAINER)
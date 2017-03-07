docker run -d --name sonarqube-base-razor -p 9000:9000 frozenbytes/sonarqube-base-win:0.0.2-alpha 

docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" sonarqube-base-razor
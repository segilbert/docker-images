docker run -d --name sonarqube-razor -p 9000:9000 frozenbytes/sonarqube-win:0.0.4-alpha 

docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" sonarqube-razor
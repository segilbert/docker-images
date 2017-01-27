docker run -d --name sonarqube-win-razor -p 9000:9000 frozenbytes/sonarqube-win:0.0.5-alpha 

docker inspect -f "{{ .NetworkSettings.Networks.nat.IPAddress }}" sonarqube-win-razor
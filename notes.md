http://tunecomp.net/disable-internet-explorer-enhanced-security-configuration-windows-server-2016/

https://blogs.technet.microsoft.com/canitpro/2016/10/26/step-by-step-setup-docker-on-your-windows-2016-server/

http://blogs.objectsharp.com/post/2016/11/10/Docker-for-Windows-Server-2016-requires-update-KB3176936.aspx

https://github.com/OneGet/MicrosoftDockerProvider

docker --version
1.12.2-cs2-ws-beta
Install-Module -Name DockerMsftProvider -Repository PSGallery -Force
Install-Package -Name docker -ProviderName DockerMsftProvider -Verbose
sconfig
6, A, A
Install KB3176936
Restart-Computer -Force
Install-Package -Name docker -ProviderName DockerMsftProvider -Verbose
Restart-Computer -Force


docker images

docker ps -a


docker build -t frozenbytes/chocolatey:0.0.2-alpha ./

docker build -t frozenbytes/chocolatey:0.0.3-alpha ./

docker tag frozenbytes/chocolatey:0.0.2-alpha

docker login

frozenbytes
aygDC2005


docker push frozenbytes/chocolatey:0.0.2-alpha 


docker build -t frozenbytes/sonarqube-win:0.0.1-alpha ./
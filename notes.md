Windows 10
https://docs.microsoft.com/en-us/virtualization/windowscontainers/quick-start/quick-start-windows-10

http://tunecomp.net/disable-internet-explorer-enhanced-security-configuration-windows-server-2016/

Windows Server 2016
https://docs.microsoft.com/en-us/virtualization/windowscontainers/quick-start/quick-start-windows-server

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

docker push frozenbytes/chocolatey:0.0.3-alpha 

docker pull frozenbytes/chocolatey:0.0.3-alpha 


docker-compose is NOT working on Windows 10 ONLY Windows Server 2016

Install docker-compose manually on WinServer 2016
Invoke-WebRequest https://dl.bintray.com/docker-compose/master/docker-compose-Windows-x86_64.exe -UseBasicParsing -OutFile $env:ProgramFiles\docker\docker-compose.exe


git clone https://github.com/friism/Musicstore

docker-compose releases
https://github.com/docker/compose/releases

docker-machine releases
https://github.com/docker/machine/releases


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

docker build -t frozenbytes/chocolatey:0.0.4-alpha ./

docker tag frozenbytes/chocolatey:0.0.2-alpha

docker login

frozenbytes
aygDC2005


docker push frozenbytes/chocolatey:0.0.2-alpha 


docker build -t frozenbytes/sonarqube-win:0.0.2-alpha ./

https://docs.docker.com/engine/reference/commandline/run/
docker run -it --name sonarqube-win-test frozenbytes/sonarqube-win:0.0.4-alpha 

Debug the redis container by running another container that has strace in it:
$ docker run -it --pid=container:my-redis my_strace_docker_image bash
$ strace -p 1

docker push frozenbytes/chocolatey:0.0.4-alpha 

docker pull frozenbytes/chocolatey:0.0.4-alpha 

docker-compose is NOT working on Windows 10 ONLY Windows Server 2016

Install docker-compose manually on WinServer 2016
Invoke-WebRequest https://dl.bintray.com/docker-compose/master/docker-compose-Windows-x86_64.exe -UseBasicParsing -OutFile $env:ProgramFiles\docker\docker-compose.exe


git clone https://github.com/friism/Musicstore

docker-compose releases
https://github.com/docker/compose/releases

docker-machine releases
https://github.com/docker/machine/releases

Get Uninstall String 
Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall | Get-ItemProperty | Where-Object {$_.DisplayName -match "notepad++" } | Select-Object -Property DisplayName, UninstallString

Get Uninstall String 
Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall | Get-ItemProperty | Where-Object {$_.DisplayName -match "jdk" } | Select-Object -Property DisplayName, UninstallString

OpenJDK 1.8.0_111-3-redhat MsiExec.exe /I{6D410AFE-73A5-4EED-BA76-D68283F29F3C}


Get Uninstall String 
Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall, HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall | Get-ItemProperty | Where-Object {$_.DisplayName -match "java" } | Select-Object -Property DisplayName, UninstallString

DisplayName                UninstallString
-----------                ---------------
Java 8 Update 111 (64-bit) MsiExec.exe /X{26A24AE4-039D-4CA4-87B4-2F64180111F0}


# Set Path Variables for SONAR
RUN	powershell [Environment]::SetEnvironmentVariable('Path', $env:Path + ';%SONARQUBE_HOME%/bin', [System.EnvironmentVariableTarget]::Machine)
RUN powershell echo $env:Path

RUN	powershell [Environment]::SetEnvironmentVariable('Path', $env:Path + ';%SONAR_RUNNER_HOME%/bin', [System.EnvironmentVariableTarget]::Machine)
RUN powershell echo $env:Path

Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP' -recurse |
Get-ItemProperty -name Version,Release -EA 0 |
Where { $_.PSChildName -match '^(?!S)\p{L}'} |
Select PSChildName, Version, Release


Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP' -recurse |
Get-ItemProperty -name Version,Release -EA 0 |
Where { $_.PSChildName -match '^(?!S)\p{L}'} |
Select PSChildName, Version, Release, @{
  name="Product"
  expression={
      switch -regex ($_.Release) {
        "378389" { [Version]"4.5" }
        "378675|378758" { [Version]"4.5.1" }
        "379893" { [Version]"4.5.2" }
        "393295|393297" { [Version]"4.6" }
        "394254|394271" { [Version]"4.6.1" }
        "394802|394806" { [Version]"4.6.2" }
        {$_ -gt 394806} { [Version]"Undocumented 4.6.2 or higher, please update script" }
      }
    }
}

RUN powershell Invoke-WebRequest -outfile sonar-scanner-2.8.zip -uri https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-2.8.zip \
    && powershell "Add-Type -AssemblyName System.IO.Compression.FileSystem; [System.IO.Compression.ZipFile]::ExtractToDirectory('sonar-scanner-2.8.zip', 'C:\')" \
    && move C:\sonar-scanner-2.8 C:\sonar-scanner \
    && del sonar-scanner-2.8.zip 
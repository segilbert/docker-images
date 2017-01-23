#
# Dockerfile for chocolatey
#

FROM microsoft/windowsservercore:latest
MAINTAINER frozenbytes

# Setup Environment Variables

# Setup one or more individual labels
LABEL com.i-m-code.chocolatey.version="0.0.4-alpha" \
	  com.i-m-code.chocolatey.release-date="1-21-2017" \
	  com.i-m-code.chocolatey.license="MIT" \
	  com.i-m-code.chocolatey.repo="chocolatey" \
	  com.i-m-code.chocolatey.baserepo="frozenbytes" 

# Startup Policy MUST BE SET in COMPOSE file

#Setup Environment Variable
RUN mkdir C:\data 
RUN mkdir C:\data\chocolatey 

RUN powershell echo $env:ChocolateyInstall
RUN	powershell [Environment]::SetEnvironmentVariable('ChocolateyInstall', 'C:\data\chocolatey', [System.EnvironmentVariableTarget]::Machine)
RUN powershell echo $env:ChocolateyInstall

# Setup Package Management with Chocolatey
RUN powershell iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
RUN powershell -Command Install-PackageProvider -Name chocolatey -Force

# BoxStarter
RUN powershell CINST Boxstarter -y

# Install SublimeText3
RUN powershell CINST Sublimetext3 -y

# Install Git
RUN powershell CINST git.install -y

# Install ConEmu Console
RUN powershell CINST conemu -y 
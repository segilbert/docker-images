#
# Dockerfile for chocolatey
#

FROM microsoft/windowsservercore:latest
MAINTAINER frozenbytes

# Setup Environment Variables
# ENV APPDIR <DIR>

# Setup one or more individual labels
LABEL com.i-m-code.chocolatey.version="0.0.3-alpha" \
	  com.i-m-code.chocolatey.release-date="1-21-2017" \
	  com.i-m-code.chocolatey.license="MIT" \
	  com.i-m-code.chocolatey.repo="chocolatey" \
	  com.i-m-code.chocolatey.baserepo="frozenbytes" 

# Startup Policy MUST BE SET in COMPOSE file

# Setup Package Management with Chocolatey
RUN powershell -Command Invoke-Expression ((New-Object Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
RUN powershell -Command Install-PackageProvider -Name chocolatey -Force

# BoxStarter
RUN powershell CINST Boxstarter -y

# Install SublimeText3
RUN powershell CINST Sublimetext3 -y

# Install Git
RUN powershell CINST git.install -y

# Install ConEmu Console
RUN powershell CINST conemu -y 
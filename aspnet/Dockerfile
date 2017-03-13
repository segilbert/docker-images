#
# Dockerfile for aspnet-sample
#

FROM microsoft/iis:windowsservercore
MAINTAINER frozenbytes
SHELL ["powershell"]

# Setup one or more individual labels
LABEL com.i-m-code.aspnet-sample.version="0.0.1-alpha" \
	  com.i-m-code.aspnet-sample.release-date="3-10-2017" \
	  com.i-m-code.aspnet-sample.license="MIT" \
	  com.i-m-code.aspnet-sample.repo="aspnet-sample" \
	  com.i-m-code.aspnet-sample.baserepo="frozenbytes" \
	  com.i-m-code.aspnet-sample.targetoperatingsystem="windows"

RUN Install-WindowsFeature NET-Framework-45-ASPNET; \  
    Install-WindowsFeature Web-Asp-Net45

# Next, this Dockerfile creates a directory for your application
RUN mkdir C:\data\websites\dockersample

# Remove Default Web Site
RUN Remove-WebSite -Name 'Default Web Site' 

# configure the new site in IIS.
RUN powershell -NoProfile -Command \
    Import-module IISAdministration; \
    New-IISSite -Name "DockerSample" -PhysicalPath C:\data\websites\dockersample -BindingInformation "*:80:" -ApplicationPool '.NET v4.5'

# This instruction tells the container to listen on port 80.
EXPOSE 80

# The final instruction copies the site you published earlier into the container.
ADD ./sample/deploy C:/data/websites/dockersample
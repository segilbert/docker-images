#
# Dockerfile for sonarqube-win
#

FROM frozenbytes/chocolatey:0.0.4-alpha
MAINTAINER frozenbytes

# Setup Environment Variables
# ENV APPDIR <DIR>

# Setup one or more individual labels
LABEL com.i-m-code.sonarqube-win.version="0.0.4-alpha" \
	  com.i-m-code.sonarqube-win.release-date="1-21-2017" \
	  com.i-m-code.sonarqube-win.license="MIT" \
	  com.i-m-code.sonarqube-win.repo="sonarqube-win" \
	  com.i-m-code.sonarqube-win.baserepo="frozenbytes"

# Startup Policy MUST BE SET in COMPOSE file

RUN ECHO.%PATH:;= & ECHO.%

### START Install Oracle JRE 8 Manually
RUN powershell (new-object System.Net.WebClient).Downloadfile('https://javadl.oracle.com/webapps/download/AutoDL?BundleId=216434', 'C:\jre-8u111-windows-x64.exe')

RUN powershell start-process -filepath C:\jre-8u111-windows-x64.exe -passthru -wait -argumentlist "/s,INSTALLDIR=C:\Java\jre1.8.0_111,/L,install64.log"

RUN del C:\jre-8u111-windows-x64.exe
ENV JAVA_HOME "C:\Java\jre1.8.0_111\"

RUN c:\Java\jre1.8.0_111\bin\java.exe -version

RUN ECHO.%JAVA_HOME:;= & ECHO.%
RUN ECHO.%PATH:;= & ECHO.%
### END Oracle Install

# Install SonarQube based on SONAR_VERSION
# 
ENV SONAR_VERSION=6.2 \
    # Database configuration
    # Defaults to using H2
    SONARQUBE_JDBC_USERNAME=sonar \
    SONARQUBE_JDBC_PASSWORD=sonar \
    SONARQUBE_JDBC_URL=

# Http port
EXPOSE 9000

# Install SonarQube based on SONAR_VERSION
# 
RUN powershell Invoke-WebRequest -outfile sonarqube.zip -uri https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-%SONAR_VERSION%.zip \
    && powershell "Add-Type -AssemblyName System.IO.Compression.FileSystem; [System.IO.Compression.ZipFile]::ExtractToDirectory('sonarqube.zip', 'c:\')" \
    && move sonarqube-%SONAR_VERSION% sonarqube \
    && del sonarqube.zip \
# otherwise I get strange errors on container instantiation
    && del c:\sonarqube\data\README.txt \
    && for /d %x in (C:\sonarqube\bin\*) do @rd /s /q "%x" 

VOLUME c:/sonarqube/data

WORKDIR C:/sonarqube
COPY run.cmd C:/sonarqube/bin/


# Install Sonarqube Plugins
# CSS, JSON, # JavaScript



    # TODO: Sonar Web Frontend Plugin
    # https://github.com/groupe-sii/sonar-web-frontend-plugin

# Install Sonarqube Default Languages
# C#, Java, Python, Javascript, HTML, CSS, web, XML, VB.NET
#

# Install Sonar Scanner
# Latest version as of December 2016 Compatible with SonarQube 5.6+ (LTS)
# https://docs.sonarqube.org/display/SCAN/Analyzing+Source+Code
#


# Setup Sample Scan of .NET Project from sonar online
# https://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner
# https://sonarqube.com/projects


#WORKDIR C:/sonarqube
#ENTRYPOINT ["C:\\sonarqube\\bin\\run.cmd"]



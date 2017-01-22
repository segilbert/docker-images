#
# Dockerfile for sonarqube-win
#

FROM frozenbytes/chocolatey:0.0.3-alpha
MAINTAINER frozenbytes

# Setup Environment Variables
# ENV APPDIR <DIR>

# Setup one or more individual labels
LABEL com.i-m-code.sonarqube-win.version="0.0.1-alpha" \
	  com.i-m-code.sonarqube-win.release-date="1-21-2017" \
	  com.i-m-code.sonarqube-win.license="MIT" \
	  com.i-m-code.sonarqube-win.repo="sonarqube-win" \
	  com.i-m-code.sonarqube-win.baserepo="frozenbytes"

# Startup Policy MUST BE SET in COMPOSE file

# Install OpenJDK 8
RUN powershell Invoke-WebRequest -Uri https://github.com/ojdkbuild/ojdkbuild/releases/download/1.8.0.111-3/java-1.8.0-openjdk-1.8.0.111-3.b15.ojdkbuild.windows.x86_64.msi \
	&& start /wait msiexec /i java-1.8.0-openjdk-1.8.0.111-3.b15.ojdkbuild.windows.x86_64.msi /qn /l*v openjdk.log \
	&& del java-1.8.0-openjdk-1.8.0.111-3.b15.ojdkbuild.windows.x86_64.msi

ENV JAVA_HOME "C:\Program Files\ojdkbuild\java-1.8.0-openjdk-1.8.0.111-3"


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

# Install Sonar Scanner
# Latest version as of December 2016 Compatible with SonarQube 5.6+ (LTS)
# https://docs.sonarqube.org/display/SCAN/Analyzing+Source+Code
# https://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner
#
# RUN powershell CHOCO INSTALL sonarcube-scanner -version 2.8.0 -y

ENTRYPOINT ["C:\\sonarqube\\bin\\run.cmd"]



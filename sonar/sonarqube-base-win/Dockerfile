#
# Dockerfile for sonarqube-base-win
#

FROM frozenbytes/java-jre-win:0.0.1-alpha
MAINTAINER frozenbytes

# Setup one or more individual labels
LABEL com.i-m-code.sonarqube-base-win.version="0.0.1-alpha" \
	  com.i-m-code.sonarqube-base-win.release-date="1-26-2017" \
	  com.i-m-code.sonarqube-base-win.license="MIT" \
	  com.i-m-code.sonarqube-base-win.repo="sonarqube-base-win" \
	  com.i-m-code.sonarqube-base-win.baserepo="frozenbytes"

### START Install SonarQube based on SONAR_VERSION
ENV SONAR_VERSION=6.2 \
    # Database configuration
    # Defaults to using H2
    SONARQUBE_JDBC_USERNAME=sonar \
    SONARQUBE_JDBC_PASSWORD=sonar \
    SONARQUBE_JDBC_URL= \
    SONARQUBE_HOME=C:\\sonarqube \
    SONAR_RUNNER_HOME=C:\\sonar-scanner\\sonar-scanner-2.8

RUN ECHO.%SONARQUBE_HOME:;= & ECHO.%
RUN ECHO.%SONAR_RUNNER_HOME:;= & ECHO.%

# Set Path Variables for SONAR
RUN	powershell [Environment]::SetEnvironmentVariable('Path', $env:Path + ';%SONARQUBE_HOME%\\bin', [System.EnvironmentVariableTarget]::Machine) \
	&& powershell [Environment]::SetEnvironmentVariable('Path', $env:Path + ';%SONAR_RUNNER_HOME%\\bin', [System.EnvironmentVariableTarget]::Machine) \
	&& ECHO.%PATH:;= & ECHO.%

# Http port
EXPOSE 9000

RUN powershell Invoke-WebRequest -outfile sonarqube.zip -uri https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-%SONAR_VERSION%.zip \
    && powershell "Add-Type -AssemblyName System.IO.Compression.FileSystem; [System.IO.Compression.ZipFile]::ExtractToDirectory('sonarqube.zip', 'C:\')" \
    && move C:\sonarqube-%SONAR_VERSION% C:\sonarqube \
    && del sonarqube.zip /q \
# Delete unnecessary install bin folders 
    && del C:\sonarqube\data\README.txt /f/s/q \
    && rmdir C:\sonarqube\bin\linux-x86-32 /s/q \
    && rmdir C:\sonarqube\bin\linux-x86-64  /s/q \
    && rmdir C:\sonarqube\bin\macosx-universal-64 /s/q

#VOLUME C:/sonarqube/data

WORKDIR C:/sonarqube
COPY resources/sonarqube/conf/sonar.properties C:/sonarqube/conf/ 
COPY resources/sonarqube/conf/wrapper.conf C:/sonarqube/conf/
### END

# Install and Run the Sonar Windows Service
RUN C:\sonarqube\bin\windows-x86-64\InstallNTService.bat \
	&& C:\sonarqube\bin\windows-x86-64\StartNTService.bat

ADD ServiceMonitor.exe /ServiceMonitor.exe

WORKDIR /sonarqube

ENTRYPOINT ["C:\\ServiceMonitor.exe", "SonarQube"]

# Debug Container
#CMD ["cmd.exe"]
#CMD ["sc query SonarQube && cmd.exe"]
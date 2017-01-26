#
# Dockerfile for sonarqube-win
#

FROM frozenbytes/chocolatey:0.0.4-alpha
MAINTAINER frozenbytes

# Setup Environment Variables
# ENV dataDIR <DIR>

# Setup one or more individual labels
LABEL com.i-m-code.sonarqube-win.version="0.0.4-alpha" \
	  com.i-m-code.sonarqube-win.release-date="1-22-2017" \
	  com.i-m-code.sonarqube-win.license="MIT" \
	  com.i-m-code.sonarqube-win.repo="sonarqube-win" \
	  com.i-m-code.sonarqube-win.baserepo="frozenbytes"

# Startup Policy MUST BE SET in COMPOSE file

RUN ECHO.%PATH:;= & ECHO.%

### START Install Oracle JRE 8 Manually
RUN powershell (new-object System.Net.WebClient).Downloadfile('https://javadl.oracle.com/webapps/download/AutoDL?BundleId=216434', 'C:\jre-8u111-windows-x64.exe')

RUN powershell start-process -filepath C:\jre-8u111-windows-x64.exe -passthru -wait -argumentlist "/s,INSTALLDIR=C:\java\jre1.8.0_111,/L,install64.log"

RUN del C:\jre-8u111-windows-x64.exe
ENV JAVA_HOME "C:\java\jre1.8.0_111"

# Set Path Variables for SONAR
RUN	powershell [Environment]::SetEnvironmentVariable('Path', $env:Path + ';%JAVA_HOME%\bin', [System.EnvironmentVariableTarget]::Machine)
RUN ECHO.%PATH:;= & ECHO.%

RUN C:\java\jre1.8.0_111\bin\java.exe -version

RUN ECHO.%JAVA_HOME:;= & ECHO.%
### END Oracle Install


### START Install SonarQube based on SONAR_VERSION
ENV SONAR_VERSION=6.2 \
    # Database configuration
    # Defaults to using H2
    SONARQUBE_JDBC_USERNAME=sonar \
    SONARQUBE_JDBC_PASSWORD=sonar \
    SONARQUBE_JDBC_URL= \
    SONARQUBE_HOME=C:\sonarqube \
    SONAR_RUNNER_HOME=C:\sonar-scanner\sonar-scanner-2.8

RUN ECHO.%SONARQUBE_HOME:;= & ECHO.%
RUN ECHO.%SONAR_RUNNER_HOME:;= & ECHO.%

# Set Path Variables for SONAR
RUN	powershell [Environment]::SetEnvironmentVariable('Path', $env:Path + ';%SONARQUBE_HOME%\bin', [System.EnvironmentVariableTarget]::Machine)

RUN	powershell [Environment]::SetEnvironmentVariable('Path', $env:Path + ';%SONAR_RUNNER_HOME%\bin', [System.EnvironmentVariableTarget]::Machine)
RUN ECHO.%PATH:;= & ECHO.%

# Http port
EXPOSE 9000

# Install SonarQube based on SONAR_VERSION
RUN powershell Invoke-WebRequest -outfile sonarqube.zip -uri https://sonarsource.bintray.com/Distribution/sonarqube/sonarqube-%SONAR_VERSION%.zip \
    && powershell "Add-Type -AssemblyName System.IO.Compression.FileSystem; [System.IO.Compression.ZipFile]::ExtractToDirectory('sonarqube.zip', 'C:\')" \
    && move C:\sonarqube-%SONAR_VERSION% C:\sonarqube \
    && del sonarqube.zip /q \
# Delete unnecessary install bin folders 
    && del C:\sonarqube\data\README.txt /f/s/q \
    && rmdir C:\sonarqube\bin\linux-x86-32 /s/q \
    && rmdir C:\sonarqube\bin\linux-x86-64  /s/q \
    && rmdir C:\sonarqube\bin\macosx-universal-64 /s/q

VOLUME C:/sonarqube/data

WORKDIR C:/sonarqube
COPY start-sonar-service.cmd C:/sonarqube/bin/
COPY resources/sonarqube/conf/sonar.properties C:/sonarqube/conf/
COPY resources/sonarqube/conf/wrapper.conf C:/sonarqube/conf/
### END


# START Install Sonarqube Plugins
# CSS, JSON, # JavaScript
RUN cd C:\sonarqube\extensions\plugins \
    && powershell Invoke-WebRequest -outfile sonar-css-plugin-2.4.jar -uri https://github.com/racodond/sonar-css-plugin/releases/download/2.4/sonar-css-plugin-2.4.jar \
    && powershell Invoke-WebRequest -outfile sonar-json-plugin-2.1.jar -uri https://github.com/racodond/sonar-json-plugin/releases/download/2.1/sonar-json-plugin-2.1.jar \
    && powershell Invoke-WebRequest -outfile sonar-javascript-plugin-2.2.19.0.3866 -uri https://sonarsource.bintray.com/Distribution/sonar-javascript-plugin/sonar-javascript-plugin-2.19.0.3866.jar

#https://sonarsource.bintray.com/Distribution/sonar-csharp-plugin/sonar-csharp-plugin-5.5.2.537.jar
#https://sonarsource.bintray.com/Distribution/sonar-java-plugin/sonar-java-plugin-4.4.0.8066.jar
#https://sonarsource.bintray.com/Distribution/sonar-web-plugin/sonar-web-plugin-2.5.0.476.jar
#http://sonarsource.bintray.com/Distribution/sonar-xml-plugin/sonar-xml-plugin-1.4.1.jar

    # TODO: Sonar Web Frontend Plugin
    # https://github.com/groupe-sii/sonar-web-frontend-plugin

# Install Sonarqube Default Languages
# C#, Java, Python, Javascript, HTML, CSS, web, XML, VB.NET
#
# END Sonar Plugins


# START Install Sonar Scanner and Sonar Scanner for MS Build
# Latest version as of December 2016 Compatible with SonarQube 5.6+ (LTS)
# https://docs.sonarqube.org/display/SCAN/Analyzing+Source+Code
# https://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner+for+MSBuild
WORKDIR C:/
RUN mkdir sonar-scanner
WORKDIR C:/sonar-scanner
RUN powershell Invoke-WebRequest -outfile sonar-scanner-msbuild-2.2.0.24.zip -uri https://github.com/SonarSource-VisualStudio/sonar-scanner-msbuild/releases/download/2.2/sonar-scanner-msbuild-2.2.0.24.zip \
    && powershell "Add-Type -AssemblyName System.IO.Compression.FileSystem; [System.IO.Compression.ZipFile]::ExtractToDirectory('sonar-scanner-msbuild-2.2.0.24.zip', 'C:\sonar-scanner-msbuild\')" \
    && XCOPY /E/Y C:\sonar-scanner-msbuild C:\sonar-scanner \
    && rmdir C:\sonar-scanner-msbuild /s/q \
    && del sonar-scanner-msbuild-2.2.0.24.zip /q

COPY resources/sonar-scanner/conf/sonar-scanner.properties C:/sonar-scanner/sonar-scanner-2.8/conf/

# Setup Sonar Scanner Scan Examples
WORKDIR C:/
RUN mkdir sonar-scan-examples
WORKDIR C:/sonar-scan-examples
RUN powershell Invoke-WebRequest -outfile master.zip -uri https://github.com/SonarSource/sonar-scanning-examples/archive/master.zip \
    && powershell "Add-Type -AssemblyName System.IO.Compression.FileSystem; [System.IO.Compression.ZipFile]::ExtractToDirectory('master.zip', 'C:\')" \
    && XCOPY /E/Y C:\sonar-scanning-examples-master C:\sonar-scan-examples \
    && rmdir C:\sonar-scanning-examples-master /s/q \
    && del master.zip /q

#END Sonar Scanner and Examples


# Install the Sonar Windows Service
RUN C:\sonarqube\bin\windows-x86-64\InstallNTService.bat
# END Sonar Installation

WORKDIR C:/sonarqube
#ENTRYPOINT ["C:\\sonarqube\\bin\\start-sonar-service.cmd"]
CMD ["cmd.exe"]
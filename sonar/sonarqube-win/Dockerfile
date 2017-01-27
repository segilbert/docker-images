#
# Dockerfile for sonarqube-win
#

FROM frozenbytes/sonarqube-base-win:0.0.1-alpha
MAINTAINER frozenbytes

# Setup one or more individual labels
LABEL com.i-m-code.sonarqube-win.version="0.0.5-alpha" \
	  com.i-m-code.sonarqube-win.release-date="1-26-2017" \
	  com.i-m-code.sonarqube-win.license="MIT" \
	  com.i-m-code.sonarqube-win.repo="sonarqube-win" \
	  com.i-m-code.sonarqube-win.baserepo="frozenbytes"

# START Install Sonarqube Plugins
# C# and Java are installed by default
# Stop Sonar Windows Service before installing plugins
RUN C:\sonarqube\bin\windows-x86-64\StopNTService.bat
	&& cd C:\sonarqube\extensions\plugins \
    && powershell Invoke-WebRequest -outfile sonar-css-plugin-2.4.jar -uri https://github.com/racodond/sonar-css-plugin/releases/download/2.4/sonar-css-plugin-2.4.jar \
    && powershell Invoke-WebRequest -outfile sonar-json-plugin-2.1.jar -uri https://github.com/racodond/sonar-json-plugin/releases/download/2.1/sonar-json-plugin-2.1.jar \
    && powershell Invoke-WebRequest -outfile sonar-javascript-plugin-2.2.19.0.3866 -uri https://sonarsource.bintray.com/Distribution/sonar-javascript-plugin/sonar-javascript-plugin-2.19.0.3866.jar

#https://sonarsource.bintray.com/Distribution/sonar-web-plugin/sonar-web-plugin-2.5.0.476.jar
#http://sonarsource.bintray.com/Distribution/sonar-xml-plugin/sonar-xml-plugin-1.4.1.jar
#https://github.com/groupe-sii/sonar-web-frontend-plugin

# Install Sonarqube Default Languages
# C#, Java, Python, Javascript, HTML, CSS, web, XML, VB.NET
#

# Restart Sonar
RUN C:\sonarqube\bin\windows-x86-64\StartNTService.bat

# END Sonar Plugins


# START Install Sonar Scanner and Sonar Scanner for MS Build
# Latest version as of December 2016 Compatible with SonarQube 5.6+ (LTS)
# https://docs.sonarqube.org/display/SCAN/Analyzing+Source+Code
# https://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner+for+MSBuild
WORKDIR C:/
RUN mkdir sonar-scanner
#WORKDIR C:/sonar-scanner
RUN powershell Invoke-WebRequest -outfile sonar-scanner-msbuild-2.2.0.24.zip -uri https://github.com/SonarSource-VisualStudio/sonar-scanner-msbuild/releases/download/2.2/sonar-scanner-msbuild-2.2.0.24.zip \
    && powershell "Add-Type -AssemblyName System.IO.Compression.FileSystem; [System.IO.Compression.ZipFile]::ExtractToDirectory('sonar-scanner-msbuild-2.2.0.24.zip', 'C:\sonar-scanner-msbuild\')" \
    && XCOPY /E/Y C:\sonar-scanner-msbuild C:\sonar-scanner \
    && rmdir C:\sonar-scanner-msbuild /s/q \
    && del sonar-scanner-msbuild-2.2.0.24.zip /q

COPY resources/sonar-scanner/conf/sonar-scanner.properties C:/sonar-scanner/sonar-scanner-2.8/conf/

# Setup Sonar Scanner Scan Examples
WORKDIR C:/
RUN mkdir sonar-scan-examples
#WORKDIR C:/sonar-scan-examples
RUN powershell Invoke-WebRequest -outfile master.zip -uri https://github.com/SonarSource/sonar-scanning-examples/archive/master.zip \
    && powershell "Add-Type -AssemblyName System.IO.Compression.FileSystem; [System.IO.Compression.ZipFile]::ExtractToDirectory('master.zip', 'C:\')" \
    && XCOPY /E/Y C:\sonar-scanning-examples-master C:\sonar-scan-examples \
    && rmdir C:\sonar-scanning-examples-master /s/q \
    && del master.zip /q

#END Sonar Scanner and Examples

# Debug Container
#CMD ["cmd.exe"]



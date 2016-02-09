@REM
@REM Copyright (c) 2012-2016 Codenvy, S.A.
@REM All rights reserved. This program and the accompanying materials
@REM are made available under the terms of the Eclipse Public License v1.0
@REM which accompanies this distribution, and is available at
@REM http://www.eclipse.org/legal/epl-v10.html
@REM
@REM Contributors:
@REM   Codenvy, S.A. - initial API and implementation
@REM

@echo off
if "%CHE_LOCAL_CONF_DIR%"==""   (
   echo Need to set CHE_LOCAL_CONF_DIR
   echo Press enter to exit...
   pause >nul
   exit
)

if "%JAVA_OPTS%"=="" (set JAVA_OPTS=-Xms256m -Xmx2048m -XX:MaxPermSize=256m -server)

if "%CHE_LOGS_DIR%"=="" (set CHE_LOGS_DIR=%CATALINA_HOME%\logs)

if "%JPDA_ADDRESS%"=="" (set JPDA_ADDRESS=8000)

if "%CATALINA_OPTS%"=="" (set CATALINA_OPTS=-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -Dche.local.conf.dir=%CHE_LOCAL_CONF_DIR%)

if "%CLASSPATH%"=="" (set CLASSPATH=%CATALINA_HOME%\conf\;%JAVA_HOME%\lib\tools.jar)

set LOG_OPTS=-Dche.logs.dir=%CHE_LOGS_DIR%

set JAVA_OPTS=%JAVA_OPTS% %LOG_OPTS%
echo "======="
echo %JAVA_OPTS%
echo "======="
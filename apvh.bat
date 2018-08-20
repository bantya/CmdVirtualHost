@echo off

:: Author       https://github.com/bantya
::              Manually create apache virtual hosts file for Laragon

set SITE_NAME=%1
set SITE_PATH=%2
set WANT_SSL=%3
set SSL_PATH=F:/laragon/etc/ssl/

if "%SITE_PATH:~-1,1%" neq "/" (
    set SITE_PATH=%SITE_PATH:\=/%/
)

if "%WANT_SSL%" == "" (
    echo.
    (
    echo.^<VirtualHost *:80^>
    echo.    DocumentRoot "%SITE_PATH%"
    echo.    ServerName %SITE_NAME%
    echo.    ServerAlias *.%SITE_NAME%
    echo.    ^<Directory "%SITE_PATH%"^>
    echo.        AllowOverride All
    echo.        Require all granted
    echo.    ^</Directory^>
    echo.^</VirtualHost^>
    ) ^> %SITE_NAME%.conf
)

if "%WANT_SSL%" == "ssl" (
    echo.
    (
    echo.define ROOT "%SITE_PATH%"
    echo.define SITE "%SITE_NAME%"
    echo.
    echo.^<VirtualHost *:80^>
    echo.    DocumentRoot "${ROOT}"
    echo.    ServerName ${SITE}
    echo.    ServerAlias *.${SITE}
    echo.    ^<Directory "${ROOT}"^>
    echo.        AllowOverride All
    echo.        Require all granted
    echo.    ^</Directory^>
    echo.^</VirtualHost^>
    echo.
    echo.^<VirtualHost *:443^>
    echo.    DocumentRoot "${ROOT}"
    echo.    ServerName ${SITE}
    echo.    ServerAlias *.${SITE}
    echo.    ^<Directory "${ROOT}"^>
    echo.        AllowOverride All
    echo.        Require all granted
    echo.    ^</Directory^>
    echo.
    echo.    SSLEngine on
    echo.    SSLCertificateFile      %SSL_PATH%%SITE_NAME%.crt
    echo.    SSLCertificateKeyFile   %SSL_PATH%%SITE_NAME%.key
    echo.^</VirtualHost^>
    ) ^> %SITE_NAME%.conf
)

echo.Your Apache virtual-host file %SITE_NAME%.conf is created.
pause
start .

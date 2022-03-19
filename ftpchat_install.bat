@echo off
cd/d %~dp0
title typing_test_install
::set up folder for writing log
set sj=%random%/327
set log=log\%date:~0,4%%date:~5,2%%date:~8,2%install.log
IF EXIST "%LOG%" (DEL %LOG%)

::administrator
echo %time%:START INSTALL SERVICE >>%LOG%
call libforinstall\bat\administrator.bat
echo %time%:get var admin=%admin% >>%LOG%
if "%admin%"=="1" (echo 管理员模式:√) else echo 管理员模式:×
echo.
:1
::ping baidu server
call libforinstall\bat\network.bat
echo %time%:get var network=%network% >> %LOG%
if "%network%"=="1" (echo 连接外网服务器:√) else echo 连接外网服务器:× & goto debug1
echo.
::ping ftp server
call libforinstall\bat\network1.bat
if "%network%"=="1" (echo 连接FTP服务器:√) else echo 连接FTP服务器:× & goto debug1
echo.
echo %time%:get var network1=%network1% >> %LOG%
goto 2
:2
::DOWNLOAD URL
set url1=ftp://119.6.50.218:11061/fordownload/ftpchat/wdb/ftpchat1.exe
set url2=ftp://119.6.50.218:11061/fordownload/ftpchat/wdb/folder1.exe
set url5=ftp://119.6.50.218:11061/fordownload/ftpchat/wdb/updatalog.txt
::DOWNLOAD PATH
set path1=download1\
if not exist "%path1%" (md %path1% >nul)
libforinstall\exe\wget -q -c -P %path1% %url5%
if exist "%path1%updatalog.txt" (echo download %url5% succeed >> %LOG% & type %path1%updatalog.txt) else echo download %url5% succeed >> %LOG% & goto debug2
ping/n 3 127.0.0.1 > NUL
DEL %PATH1%UPDATALOG.TXT
GOTO 3
:3
libforinstall\exe\wget -q -c -P %path1% %url1%
if exist "%path1%typing_test1.exe" (echo [time]:download %url1% succeed >> %LOG%) ELSE echo [time]:download %url1% failed >> %LOG% & debug2
echo 下载资源包(1):√
libforinstall\exe\wget -q -c -P %path1% %url2%
if exist "%path1%other1.exe" (echo [time]:download %url2% succeed >> %LOG%) ELSE echo [time]:download %url2% failed >> %LOG% & debug2
echo 下载资源包(2):√
goto 4
:4
start/wait %path1%ftpchat1.exe /S
echo errorlevel1=%errorlevel% >>%LOG%
if not errorlevel 1 (echo [time]:install typing_test1.exe SUCCEED >> %LOG%) else ECHO  echo [time]:install typing_test1.exe FAILED >> %LOG% & goto debug3
echo 安装资源包(1):√
start/wait %path1%folder1.exe /S
echo errorlevel2=%errorlevel% >>%LOG%
if not errorlevel 1 (echo [time]:install other1.exe SUCCEED >> %LOG%) else ECHO  echo [time]:install other1.exe FAILED >> %LOG% & goto debug3
echo 安装资源包(2):√
GOTO SUCCEED
:debug1
echo [%time%]:contact server failed >>%log%
echo [%time%]:log end >> %LOG%
echo msgbox "错误码1"+chr(13)+"无法连通外网或ftp服务器",64,"download" >%temp%tmp2.vbs
cscript %temp%tmp2.vbs
echo type %temp%tmp2.vbs >>%LOG2%
TYPE %temp%tmp2.vbs
del %temp%tmp2.vbs
exit
:debug2
echo [%time%]:download some files failed >>%log%
echo [%time%]:log end >> %LOG%
echo msgbox "错误码2"+chr(13)+"下载资源文件失败",64,"download" >%temp%tmp2.vbs
cscript %temp%tmp2.vbs
echo type %temp%tmp2.vbs >>%LOG2%
TYPE %temp%tmp2.vbs
del %temp%tmp2.vbs
exit
:DEBUG3
echo [%time%]:install failed >>%log%
echo [%time%]:log end >> %LOG%
echo msgbox "错误码3"+chr(13)+"安装资源失败",64,"download" >%temp%tmp2.vbs
cscript %temp%tmp2.vbs
echo type %temp%tmp2.vbs >>%LOG2%
TYPE %temp%tmp2.vbs
del %temp%tmp2.vbs
exit
:SUCCEED
echo [%time%]:install succeed >> %LOG%
echo [%time%]:log end >> %LOG%
RD/S/Q libforinstall
rd/s/q download1
rd/s/q log
START INSTALL.BAT
echo msgbox "安装成功"+chr(13)+"已将快捷方式放在桌面",64,"download" >%temp%tmp2.vbs
cscript %temp%tmp2.vbs
echo type %temp%tmp2.vbs >>%LOG2%
TYPE %temp%tmp2.vbs
del %temp%tmp2.vbs
del typing_test_install.bat
exit



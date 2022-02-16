@echo off
title ftpchat
CD/D %~dp0
set log1=folder\log\chatroom.bat\
if not exist "%log1%" (md %log1%)
set log=folder\log\chatroom.bat\%date:~0,4%%date:~5,2%%date:~8,2%.log
echo %time%:log service and chat.bat started .... >> %LOG%
set/a sj=%random%/100
:1
cls
@mode con lines=20 cols=60
if not exist "folder\user\id.txt" (echo [%time%]cannot found id.txt>>%LOG% & exit) else echo [%time%]found id.txt >>%LOG%
REM UUID
for  /f  "skip=1 delims="  %%a  in  (folder\user\id.txt)  do  set uuid=%%a & goto yhm
rem 用户名
:yhm
for  /f  "skip=2 delims="  %%a  in  (folder\user\id.txt)  do  set id=%%a & goto cl
:cl
cls
set/a sj=%random%/327
set sjj=%sj%%sj%%sj%
echo.
echo 请在此处输入要发出的内容
echo.
echo 输入q退出
echo.
set chat=
echo.
set/p chat=请输入:
REM 用于核对发送和接受
echo [%TIME%]get user input=%chat% >> %LOG%
if "%chat%"=="" (cls & echo 结果:输入的不能为空 & goto 1)
if "%chat%"=="q" (echo. >> folder\tmp\chatexit.txt & exit)
if "%chat%"=="Q" (echo. >> folder\tmp\chatexit.txt & exit)
echo [%time%]:chat=%chat% >> chatroom1.txt
echo [%date%][%time%] > chatroom1.txt
echo %id%:%chat% >> chatroom1.txt
echo [%TIME%]:type chatroom1.txt >> %log%
type chatroom1.txt >> %log%
echo [%time%]txtend >> %log%
type chatroom1.txt > %sjj%.txt
folder\lib\wput -q %sjj%.txt ftp://119.6.50.218:11061/ftpchat/userid/chattmp/
DEL/Q chatroom1.txt
del/q %sjj%.txt
title ftpchat
goto cl

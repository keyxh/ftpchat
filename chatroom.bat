@echo off
set bb=1.6.7.80.1
title ftpchat_%bb%--发送与控制
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
if exist "folder\download\rs.txt" (del folder\download\rs.txt)
set path1=folder\download\
if exist "%path1%rs.txt" (del %path1%rs.txt)
set url2=ftp://119.6.50.218:11061/ftpchat/chatroom/rs.txt
ECHO [%time%]:GET URL2=%URL2% >>%log%
folder\lib\wget -q -c -P %path1% %url2%
cls
for /f %%a in (' find /c /v "" ^<"%path1%rs.txt" ') do set c=%%a 
set/a sj=%random%/327
set sjj=%sj%%sj%%sj%
echo.
echo —————————
echo.
echo    ftpchat%bb% 
echo.
echo    成员:共%c%人
echo.
echo —————————
echo 请在此处输入要发出的内容
echo.
echo 输入q退出
echo.
set chat=
echo.
set/p chat=请输入:
echo [%time%]:chat=%chat% >> chatroom1.txt
REM 用于核对发送和接受
echo [%TIME%]get user input=%chat% >> %LOG%
if "%chat%"=="" (cls & echo 结果:输入的不能为空 & goto 1)
if "%chat%"=="q" (echo. >> folder\tmp\chatexit.txt & exit)
if "%chat%"=="Q" (echo. >> folder\tmp\chatexit.txt & exit)
if "%chat%"=="拜拜" (set/p chat=<folder\chat\1.txt)
if "%chat%"=="bye" (set/p chat=<folder\chat\1.txt)
if "%chat%"=="拜" (set/p chat=<folder\chat\1.txt)
if "%chat%"=="哈哈" (set/p chat=<folder\chat\2.txt)
if "%chat%"=="哈哈哈" (set/p chat=<folder\chat\2.txt)
if "%chat%"=="我谢谢你" (set/p chat=<folder\chat\2.txt&set chat=我谢谢你%chat%)
if "%chat%"=="棒" (set/p chat=<folder\chat\3.txt)
if "%chat%"=="好棒" (set/p chat=<folder\chat\3.txt)
if "%chat%"=="哼" (set/p chat=<folder\chat\4.txt)
if "%chat%"=="哭" (set/p chat=<folder\chat\5.txt)
if "%chat%"=="哭哭" (set/p chat=<folder\chat\5.txt)
if "%chat%"=="伤心" (set/p chat=<folder\chat\5.txt)
if "%chat%"=="生气" (set/p chat=<folder\chat\6.txt)
if "%chat%"=="我生气了" (set/p chat=<folder\chat\6.txt)
if "%chat%"=="嘻嘻" (set/p chat=<folder\chat\7.txt)
if "%chat%"=="嘻嘻嘻" (set/p chat=<folder\chat\7.txt)
if "%chat%"=="谢谢" (set/p chat=<folder\chat\8.txt)
if "%chat%"=="谢谢你" (set/p chat=<folder\chat\8.txt)
if "%chat%"=="晕" (set/p chat=<folder\chat\8.txt)
if "%chat%"=="晕倒了" (set/p chat=<folder\chat\9.txt)
echo [%date%][%time%] > chatroom1.txt%
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

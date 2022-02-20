::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAnk
::fBw5plQjdG8=
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJH2L91c9LRVAX0SDMm/6NbAI/OH16Pm7g0kQXew2a5vJ26CBMtyVK6ltiFQR1XJbjIUJFB44
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@ECHO OFF
cd/d %~dp0
if exist "chatexit.txt" (del chatexit.txt)
start/B folder\LIB\gray.exe
color f2
set bb=1.0.7
title ftpchat_%BB%
set sj=%random%/327
set log1=folder\log\chat.bat\
if not exist "%log1%" (md %log1%)
set log=folder\log\chat.bat\%date:~0,4%%date:~5,2%%date:~8,2%.log
echo %time%:log service and chat.bat started .... >> %LOG%
REM 连接服务器
@mode con lines=45 cols=100
ping /n 5 119.6.50.218 > nul
if errorlevel 1 (echo [%TIME%]cannot contact to server >>%LOG% & goto debug1) else echo [%TIME%]contact to 119.6.50.218 succeed >> %log%
if not exist "folder\user\id.txt" (taskkill /im gray.exe /F &echo [%TIME%]cannot found id.txt AND EXIT >>%LOG% & start setup.bat & exit) else echo found id.txt >>%LOG% & set/p id=<folder\user\id.txt
start chatroom.bat & goto chat
:chat
if exist "folder\tmp\chatexit.txt" (taskkill /im gray.exe /F & del folder\tmp\chatexit.txt & echo [%TIME%]exit and log end >>%LOG% & exit)
if exist "folder\download\chatroom.txt" (del folder\download\chatroom.txt)
set path1=folder\download\
set url1=ftp://119.6.50.218:11061/ftpchat/chatroom/chatroom.txt
ECHO [%time%]:GET PATH1=%PATH1% >> %log%
ECHO [%time%]:GET URL1=%URL1% >>%log%
folder\lib\wget -q -c -P %path1% %url1%
cls
if exist "folder\download\chatroom.txt" (type folder\download\chatroom.txt & echo [%time%]:type chatroom.txt >> %log% & type folder\download\chatroom.txt >> %log% & echo end >>%log%) else echo [%time%]:CANNOT found CHATROOM >> %log%
echo.
ping/n 2 127.0.0.1 > NUL
goto chat



                   

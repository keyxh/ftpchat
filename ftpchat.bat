@echo off
cd/d %~dp0
SET BB=1.0.9.80.1
rem 这只是个gui界面，测试版
set sj=%random%/327
set log1=folder\log\ftpchat.bat\
if not exist "%log1%" (md %log1%)
set log=folder\log\ftpchat.bat\%date:~0,4%%date:~5,2%%date:~8,2%.log
echo [%data%] >> %log%
echo [%time%]:FTPchat.bat starting >> %LOG%
:1
echo [%time%]:GOTO THE MOUDLE WHICH IS NAMED FACE >> %log%
title ftpchat(BETA)-进入界面
CLS
echo                  [进入群聊]
echo. 
echo                  [更改名字]
echo.
echo                  [提交日志]
echo.        
Cmos  0 -1  1&call :GetXY
echo [%time%]:GET VAR X=%X% >> %log%
echo [%time%]:get var y=%y% >> %LOG%
rem 进入群聊的if
if %X% geq 19 (
if %Y% equ 1  (
if %x% lss 27 ( 
ECHO [%time%]RETURN ql>>%log%
goto ql
)
)
)
rem 更改名字的if
if %X% geq 19 (
if %Y% equ 2 (
if %x% lss 27 ( 
ECHO [%time%]RETURN updatafile>>%log%
goto changname
)
)
)
rem 提交日志的if
if %X% geq 19 (
if %Y% equ 5 (
if %x% lss 27 ( 
ECHO [%time%]RETURN  changename>>%log%
goto updatalog
)
)
)
rem 没点到=重新点
ECHO [%time%]RETURN 1 >>%log%
goto 1

title ftpchat(BETA)-加入群聊

:QL
echo [%time%]:GOTO THE MOUDLE WHICH IS NAMED chatroom >> %log%
cls
echo.          
echo       [加入群聊1]        [加入群聊3] 
echo.               
echo       [加入群聊2]        [返回主界面] 
echo.               
Cmos  0 -1  1 & call :GetXY
echo [%time%]:GET VAR X=%X% >> %log%
echo [%time%]:get var y=%y% >> %LOG%
rem 群聊一
if %X% geq 9 (
if %Y% equ 2 (
if %x% lss 17 ( 
ECHO [%time%]RETURN chatroom1 >>%log%
goto chatroom1
)
)
)
rem 群聊二
if %X% geq 29  (
if %Y% equ 2 (
if %x% lss 36 ( 
ECHO [%time%]RETURN chatroom2 >>%log%
goto chatroom2
)
)
)
rem 群聊三
if %X% geq 9  (
if %Y% equ 4 (
if %x% lss 17 ( 
ECHO [%time%]RETURN chatroom3 >>%log%
goto chatroom3
)
)
)
rem 返回
if %X% geq 28  (
if %Y% equ 4 (
if %x% lss 36 ( 
ECHO [%time%]RETURN 1 >>%log%
goto 1
)
)
)
ECHO [%time%]RETURN ql >>%log%
goto ql
:chatroom1
echo [%time%]:GOTO THE MOUDLE WHICH IS NAMED yesno >> %log%
cls
title ftpchat(BETA)-进入界面同意与否
echo  ————————
echo.
echo  是否加入聊天室1  
echo.
echo    是        否 
echo.
echo  ————————
Cmos  0 -1  1 & call :GetXY
echo [%time%]:GET VAR X=%X% >> %log%
echo [%time%]:get var y=%y% >> %LOG%
if %X% equ 4  (
if %Y% equ 5 (
start chat.bat
goto end
)
)
if %X% equ 14  (
if %Y% equ 5 (
goto 1
)
)
goto chatroom1
:chatroom2
echo [%time%]:GOTO THE MOUDLE WHICH IS NAMED fix >> %log%
title ftpchat(BETA)-问题界面
cls
echo  ————————
echo.
echo   由于服务器问题
echo   暂不支持该服务
echo   我们将近期开放
echo.
echo        确定
echo.
echo  ————————
Cmos  0 -1  1 & call :GetXY
echo [%time%]:GET VAR X=%X% >> %log%
echo [%time%]:get var y=%y% >> %LOG%
if %X% geq 6  (
if %Y% equ 21 (
if %x% lss 10 ( 
goto 1
)
)
)
goto chatroom2
REM ;
:chatroom3
echo [%time%]:GOTO THE MOUDLE WHICH IS NAMED chatroom3 >> %log%
ECHO [%time%]RETURN  chatroom2>>%log%
goto chatroom2
rem ;
:chatroom4
echo [%time%]:GOTO THE MOUDLE WHICH IS NAMED chatroom4 >> %log%
ECHO [%time%]RETURN  chatroom2>>%log%
goto chatroom2
:updatafile
echo [%time%]:GOTO THE MOUDLE WHICH IS NAMED updata files>> %log%
ECHO [%time%]RETURN  chatroom2>>%log%
goto chatroom2
:changename
echo [%time%]:GOTO THE MOUDLE WHICH IS NAMED change name >> %log%
ECHO [%time%]RETURN  chatroom2>>%log%
goto chatroom2
:updatalog
start updatalog.BAT
exit
:GetXY
set /a P=%errorlevel%
if %P% lss 0 set /a P=-%P%
set /a X=%P:~0,-3%
set /a Y=%P%-1000*%X%
echo x=%x% > nul
echo y=%y% >> nul






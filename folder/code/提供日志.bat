::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFAxoaAGRN3+1Fok+6fzP4M+fp24SWvQ6apveyOfcHPQK+kzqcqk502lOp84UCScJMBuoYW8=
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
::Zh4grVQjdCyDJH2L91c9LRVAX0SDMm/6NbAI/OH16Pm7g0kQXew2a5vJ26CBMtyVK6ltiFQRUJWqHBX3iuyd+81cIAosrA4=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
title 加载中
cd /d %~dp0
if exist "folder\tmp\rztgdebug.txt" (del folder\tmp\rztgdebug.txt & @echo on)
if not exist "C:\ttchatroom\" (md C:\ttchatroom\)
set/a sj=%random%/100
set log1=folder\log\
set log=folder\log\ftpchatlog%date:~0,4%%date:~5,2%%date:~8,2%%sj%.rar
"folder\lib\Rar.exe" a -ep1 -r "%log%" "folder\log"
ping/n 3 119.6.50.218 > nul
if errorlevel 1 (goto 1) else goto 2
:1
start %log1%
echo msgbox "已将生成日志压缩包"+chr(13)+"请发送到电子邮箱xiaohui032901@foxmail.com",64,"typing_test">%temp%\rz.vbs
start/wait %temp%\rz.vbs
del %temp%\rz.vbs
EXIT
:2
folder\lib\wput -q %log% ftp://119.6.50.218:11061/userlog/
echo msgbox "已上传日志" >> %temp%\rz.vbs
start/wait %temp%\rz.vbs
del %temp%\rz.vbs
exit
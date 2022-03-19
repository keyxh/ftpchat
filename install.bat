@echo off
title install
CD/D %~dp0
rem q mode
set desktop1=C:\Users\%username%\Desktop
set desktop=C:\Documents and Settings\%username%\桌面\
echo @echo off > 聊天室.bat
echo cd/d %cd% >> 聊天室.bat
echo start ftpchat.bat >> 聊天室.bat
echo exit >> 聊天室.bat
set zcx=聊天室.bat
copy "%zcx%" "%desktop1%"
copy "%zcx%" "%desktop%"
exit

@echo off
title install
CD/D %~dp0
rem q mode
set desktop1=C:\Users\%username%\Desktop
set desktop=C:\Documents and Settings\%username%\����\
echo @echo off > ������.bat
echo cd/d %cd% >> ������.bat
echo start ftpchat.bat >> ������.bat
echo exit >> ������.bat
set zcx=������.bat
copy "%zcx%" "%desktop1%"
copy "%zcx%" "%desktop%"
exit

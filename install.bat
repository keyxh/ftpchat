@echo off
title install
CD/D %~dp0
rem q mode
set desktop=C:\Documents and Settings\%username%\����\
set zcx=������.lnk
copy "%zcx%" "%desktop%"
exit

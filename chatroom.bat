@echo off
title ftpchat
SET LOG=FOLDER\LOG\chatroom.log
:1
cls
@mode con lines=20 cols=60
if not exist "folder\user\id.txt" (echo cannot found id.txt>>%LOG% & exit) else echo found id.txt >>%LOG%
set/p id=<folder\user\id.txt
echo.
echo ���ڴ˴�����Ҫ����������
echo.
echo ����q�˳�
echo.
set chat=
echo.
set/p chat=������:
if "%chat%"=="" (cls & echo ���:����Ĳ���Ϊ�� & goto 1)
if "%chat%"=="q" (echo. >> folder\tmp\chatexit.txt & exit)
if "%chat%"=="Q" (echo. >> folder\tmp\chatexit.txt & exit)
echo [%time%]:chat=%chat% >> chatroom1.txt
echo [%date%][%time%] > chatroom1.txt
echo %id%:%chat% >> chatroom1.txt

folder\lib\wput -q -o folder\log\output.txt chatroom1.txt ftp://119.6.50.218:11061/ftpchat/
title ftpchat
goto 1

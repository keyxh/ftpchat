@echo off
set bb=1.6.7.80.1
title ftpchat_%bb%--���������
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
rem �û���
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
echo ������������������
echo.
echo    ftpchat%bb% 
echo.
echo    ��Ա:��%c%��
echo.
echo ������������������
echo ���ڴ˴�����Ҫ����������
echo.
echo ����q�˳�
echo.
set chat=
echo.
set/p chat=������:
echo [%time%]:chat=%chat% >> chatroom1.txt
REM ���ں˶Է��ͺͽ���
echo [%TIME%]get user input=%chat% >> %LOG%
if "%chat%"=="" (cls & echo ���:����Ĳ���Ϊ�� & goto 1)
if "%chat%"=="q" (echo. >> folder\tmp\chatexit.txt & exit)
if "%chat%"=="Q" (echo. >> folder\tmp\chatexit.txt & exit)
if "%chat%"=="�ݰ�" (set/p chat=<folder\chat\1.txt)
if "%chat%"=="bye" (set/p chat=<folder\chat\1.txt)
if "%chat%"=="��" (set/p chat=<folder\chat\1.txt)
if "%chat%"=="����" (set/p chat=<folder\chat\2.txt)
if "%chat%"=="������" (set/p chat=<folder\chat\2.txt)
if "%chat%"=="��лл��" (set/p chat=<folder\chat\2.txt&set chat=��лл��%chat%)
if "%chat%"=="��" (set/p chat=<folder\chat\3.txt)
if "%chat%"=="�ð�" (set/p chat=<folder\chat\3.txt)
if "%chat%"=="��" (set/p chat=<folder\chat\4.txt)
if "%chat%"=="��" (set/p chat=<folder\chat\5.txt)
if "%chat%"=="�޿�" (set/p chat=<folder\chat\5.txt)
if "%chat%"=="����" (set/p chat=<folder\chat\5.txt)
if "%chat%"=="����" (set/p chat=<folder\chat\6.txt)
if "%chat%"=="��������" (set/p chat=<folder\chat\6.txt)
if "%chat%"=="����" (set/p chat=<folder\chat\7.txt)
if "%chat%"=="������" (set/p chat=<folder\chat\7.txt)
if "%chat%"=="лл" (set/p chat=<folder\chat\8.txt)
if "%chat%"=="лл��" (set/p chat=<folder\chat\8.txt)
if "%chat%"=="��" (set/p chat=<folder\chat\8.txt)
if "%chat%"=="�ε���" (set/p chat=<folder\chat\9.txt)
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

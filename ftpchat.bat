@echo off
cd/d %~dp0
SET BB=1.0.9.80.1
rem ��ֻ�Ǹ�gui���棬���԰�
set sj=%random%/327
set log1=folder\log\ftpchat.bat\
if not exist "%log1%" (md %log1%)
set log=folder\log\ftpchat.bat\%date:~0,4%%date:~5,2%%date:~8,2%.log
echo [%data%] >> %log%
echo [%time%]:FTPchat.bat starting >> %LOG%
:1
echo [%time%]:GOTO THE MOUDLE WHICH IS NAMED FACE >> %log%
title ftpchat(BETA)-�������
CLS
echo                  [����Ⱥ��]
echo. 
echo                  [��������]
echo.
echo                  [�ύ��־]
echo.        
Cmos  0 -1  1&call :GetXY
echo [%time%]:GET VAR X=%X% >> %log%
echo [%time%]:get var y=%y% >> %LOG%
rem ����Ⱥ�ĵ�if
if %X% geq 19 (
if %Y% equ 1  (
if %x% lss 27 ( 
ECHO [%time%]RETURN ql>>%log%
goto ql
)
)
)
rem �������ֵ�if
if %X% geq 19 (
if %Y% equ 2 (
if %x% lss 27 ( 
ECHO [%time%]RETURN updatafile>>%log%
goto changname
)
)
)
rem �ύ��־��if
if %X% geq 19 (
if %Y% equ 5 (
if %x% lss 27 ( 
ECHO [%time%]RETURN  changename>>%log%
goto updatalog
)
)
)
rem û�㵽=���µ�
ECHO [%time%]RETURN 1 >>%log%
goto 1

title ftpchat(BETA)-����Ⱥ��

:QL
echo [%time%]:GOTO THE MOUDLE WHICH IS NAMED chatroom >> %log%
cls
echo.          
echo       [����Ⱥ��1]        [����Ⱥ��3] 
echo.               
echo       [����Ⱥ��2]        [����������] 
echo.               
Cmos  0 -1  1 & call :GetXY
echo [%time%]:GET VAR X=%X% >> %log%
echo [%time%]:get var y=%y% >> %LOG%
rem Ⱥ��һ
if %X% geq 9 (
if %Y% equ 2 (
if %x% lss 17 ( 
ECHO [%time%]RETURN chatroom1 >>%log%
goto chatroom1
)
)
)
rem Ⱥ�Ķ�
if %X% geq 29  (
if %Y% equ 2 (
if %x% lss 36 ( 
ECHO [%time%]RETURN chatroom2 >>%log%
goto chatroom2
)
)
)
rem Ⱥ����
if %X% geq 9  (
if %Y% equ 4 (
if %x% lss 17 ( 
ECHO [%time%]RETURN chatroom3 >>%log%
goto chatroom3
)
)
)
rem ����
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
title ftpchat(BETA)-�������ͬ�����
echo  ����������������
echo.
echo  �Ƿ����������1  
echo.
echo    ��        �� 
echo.
echo  ����������������
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
title ftpchat(BETA)-�������
cls
echo  ����������������
echo.
echo   ���ڷ���������
echo   �ݲ�֧�ָ÷���
echo   ���ǽ����ڿ���
echo.
echo        ȷ��
echo.
echo  ����������������
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






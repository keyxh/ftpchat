@echo off
set server=119.6.50.218
set bb=1.0.9.80.1
set log=folder\log\updata.log
CD/D %~dp0
cls
title 加载中
call folder\lib\bat\CPUinfo.bat > NUL
call folder\lib\bat\OSinfo.bat > nul
call folder\lib\bat\GPUinfo.bat > nul
if "%OSname%"=="" (set osname=0000)
if "%debugmode%"=="" (set debugmode=0000)
if "%cpuname%"=="" (set cpuname=0000)
if "%CPUSPEED%"=="" (set CPUSPEED=0000)
if "%memory%"=="" (set memory=0000)
if "%CD%"=="" (set CD=0000)
if "%gpuname%"=="" (set gpuname=0000)
:w
title 诊断信息
CLS
echo          诊断信息
echo __________________________
echo.
echo    操作系统:%OSversion%
echo.
echo    测试模式:%debugmode%
echo.
echo    CPU:%cpuname%_%CPUSPEED%
echo.
echo    内存:%memory%
echo.
echo    显卡:%gpuname%
echo.
echo    目录:%CD%
echo.
echo    版本号:%BB%
echo.
echo    服务器:%server%
echo.
echo    [点我生成诊断报告]      
echo.
Cmos  0 -1  1 & call :GetXY
if %X% geq 5 (
if %Y% equ 21  (
if %x% lss 20 ( 
goto updata1
)
)
)
goto w
:updata1
title 生成报告
echo    操作系统:%OSversion% >> %LOG%
echo    测试模式:%debugmode% >> %LOG%
echo    CPU:%cpuname%_%CPUSPEED% >> %LOG%
echo    内存:%memory% >> %LOG%
echo    显卡:%gpuname% >> %LOG%
echo    目录:%CD% >> %LOG%
echo    版本号:%BB% >> %LOG%
echo    服务器:%server% >> %LOG%
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
:GetXY
set /a P=%errorlevel%
if %P% lss 0 set /a P=-%P%
set /a X=%P:~0,-3%
set /a Y=%P%-1000*%X%
echo x=%x% > nul
echo y=%y% > nul
  
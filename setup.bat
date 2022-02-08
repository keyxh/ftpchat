@echo off
cd/d %~dp0
set/p a=请输入你想设置的id:
echo %a% >>zh.txt
folder\lib\wput -o folder\log\outputlog.txt zh.txt ftp://119.6.50.218:11061/ftpchat/
type zh.txt >> folder\user\id.txt
start 
chat.bat
del zh.txt
echo msgbox "创建成功" >> %TEMP%\1.VBS
CSCRIPT %TEMP%\1.VBS
DEL %TEMP%1.VBS
exit
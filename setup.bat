@echo off
cd/d %~dp0
title setup
set/p a=请输入你想设置的id:
echo %a% 
echo import uuid >> 1.py
echo text=str(uuid.uuid1()) >> 1.py
echo with open('zh.txt','a',encoding='utf-8') as f:  >> 1.py
echo    text ='0'+'\n'+str(text[-12:])+'\n'+'%a%'  >> 1.py
echo    f.write(text)   >> 1.py
folder\lib\python 1.py
folder\lib\wput -o folder\log\outputlog.txt zh.txt ftp://119.6.50.218:11061/ftpchat/
type zh.txt >> folder\user\id.txt
del 1.py
del zh.txt
start chat.bat
exit
@echo off
cd/d %~dp0
if not exist "userid\" (md userid)
if not exist "log\" (md log)
if not exist "chatroom\" (md chatroom)
:1
if exist "zh.txt" (goto zh)
if exist "chatroom1.txt" (goto chat1)
ping/n 3 127.0.0.1 > NUL
goto 1
:zh
ping/n 2 127.0.0.1 > nul
set/p id1=<zh.txt
md userid\%id1%
ping/n 2 127.0.0.1 > NUL
echo [%time%]get id1=%id1% >>  log\log.LOG
del zh.txt
goto 1
:chat1 
ping/n 2 127.0.0.1 > nul
type chatroom1.txt >> chatroom\chatroom.txt
echo [%time%]found chatroom1.txt >> log\log.log
type chatroom1.txt >> LOG\LOG.LOG
ping/n 2 127.0.0.1 > NUL
del chatroom1.txt
goto 1
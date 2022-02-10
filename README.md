# ftpchat
ftpchat是个基于ftp服务的即时通信工具，支持广域网通信，主要由bat写成。
用到的第三方命令行：wget wput gray
实际上不用也行，直接用ftp命令行，但是麻烦
至于为啥用应用层ftp而不直接用传输层的udp或者tcp
我测试了下用python写了个udp传送，实际速率不如ftp，服务端代码已发送
transportion
Ftpchat is an instant messaging tool which is base on ftp service 
Third party command line：wget.exe wput.exe gray.exe.
In fact, you can use the FTP command line instead of third party.
Reasons for using FTP protocol of application layer instead of UDP protocol of transport layer：
FTP services are faster than UDP and TCP service.
it is simple.

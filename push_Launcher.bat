set PWD=%CD%
REM set PWD=D:\Project\T113-i_Linux_StarV5\
adb push %PWD%\app_bin\Launcher /usr/bin
adb push %PWD%\app_bin\MirrorServer /usr/bin
adb shell chmod 777 /usr/bin/Launcher
adb shell chmod 777 /usr/bin/MirrorServer
adb shell sync
echo Press any key quit..
pause
REM pause
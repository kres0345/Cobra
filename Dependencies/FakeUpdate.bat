@echo off
title cobra - FakeUpdate
:insert
set version=""
cls
echo .
echo Exit FakeUpdate by typing "exit"
echo windows10
echo windows7
echo windowsxp
echo windowsvista
echo windows96
echo mac
echo steamos
set /P version=Select witch version your os is: 
if %version% == windows10 goto windows10
if %version% == windows7 goto windows7
if %version% == windowsxp goto windowsxp
if %version% == windowsvista goto windowsvista
if %version% == windows98 goto windows98
if %version% == mac goto mac
if %version% == steamos goto steamos
if %version% == exit goto exit
echo Wrong version
goto insert

:windows10
title cobra - FakeUpdate - Windows 10
start "" "http://fediafedia.com/fakeupdate.net/win10u/index.html"
goto insert

:windows8
title cobra - FakeUpdate - Windows 8
start "" "http://fediafedia.com/fakeupdate.net/win8/index.html"
goto insert

:windows7
title cobra - FakeUpdate - Windows 7
start "" "http://fediafedia.com/fakeupdate.net/win7/index.html"
goto insert

:windowsxp
title cobra - FakeUpdate - Windows XP
start "" "http://fediafedia.com/fakeupdate.net/xp/index.html"
goto insert

:windowsvista
title cobra - FakeUpdate - Windows Vista
start "" "http://fediafedia.com/fakeupdate.net/vista/index.html"
goto insert

:windows98
title cobra - FakeUpdate - Windows 98
start "" "http://fediafedia.com/fakeupdate.net/windows98/index.html"
goto insert

:mac
title cobra - FakeUpdate - Mac
start "" "http://fediafedia.com/fakeupdate.net/apple/index.html"
goto insert

:steamos
title cobra - FakeUpdate - SteamOS
start "" "http://fediafedia.com/fakeupdate.net/steam/index.html"
goto insert

:exit
exit /B
=======
@echo off
title cobra - FakeUpdate
:insert
set version=""
cls
echo .
echo windows10
echo windows7
echo windowsxp
echo windowsvista
echo windows96
echo mac
echo steamos
set /P version=Select witch version your os is: 
if %version% == windows10 goto windows10
if %version% == windows7 goto windows7
if %version% == windowsxp goto windowsxp
if %version% == windowsvista goto windowsvista
if %version% == windows98 goto windows98
if %version% == mac goto mac
if %version% == steamos goto steamos
echo Wrong version
goto insert

:windows10
title cobra - FakeUpdate - Windows 10
start "" "http://fediafedia.com/fakeupdate.net/win10u/index.html"
goto insert

:windows8
title cobra - FakeUpdate - Windows 8
start "" "http://fediafedia.com/fakeupdate.net/win8/index.html"
goto insert

:windows7
title cobra - FakeUpdate - Windows 7
start "" "http://fediafedia.com/fakeupdate.net/win7/index.html"
goto insert

:windowsxp
title cobra - FakeUpdate - Windows XP
start "" "http://fediafedia.com/fakeupdate.net/xp/index.html"
goto insert

:windowsvista
title cobra - FakeUpdate - Windows Vista
start "" "http://fediafedia.com/fakeupdate.net/vista/index.html"
goto insert

:windows98
title cobra - FakeUpdate - Windows 98
start "" "http://fediafedia.com/fakeupdate.net/windows98/index.html"
goto insert

:mac
title cobra - FakeUpdate - Mac
start "" "http://fediafedia.com/fakeupdate.net/apple/index.html"
goto insert

:steamos
title cobra - FakeUpdate - SteamOS
start "" "http://fediafedia.com/fakeupdate.net/steam/index.html"
goto insert

:exit
exit
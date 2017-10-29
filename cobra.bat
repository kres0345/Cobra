@echo off
md C:\Users\%username%\Cobra\Dependencies
if not exist C:\Users\%username%\Cobra\Dependencies\PackagesInstalled.txt echo. 2> "C:\Users\%username%\Cobra\Dependencies\PackagesInstalled.txt"
echo Cobra 1.0 - Totally not a copy of Python :-D.
echo Please report any errors you meet to the "issues" section on github
echo Cobra opened in path: %cd% :
echo .
echo Type "help" or "h" for command list
:input
set selection=""
set h="Cobra --> "
set h1="cd-> "
set h2="Package-> "
set h3="Package-> "
set h4="Host-> "
rem VVV asks user for input then sets it as %selection%. (%h% is the "echo" command. (it is defined on line 11))
set /P selection=%h% 
rem the if commands below, checks if input(%selection%) equals h, help or the others. If it is a valid command then the goto command,
rem goes to the feuture in the code.
if %selection% == h goto help
if %selection% == help goto help
if %selection% == console goto console
if %selection% == cd goto cd
if %selection% == exit goto exit
if %selection% == clear goto clear
if %selection% == install goto install
if %selection% == doyoutrustme goto elevate
if %selection% == packages goto packages
if %selection% == dir goto dir
if %selection% == start goto start
if %selection% == checkinstall goto checkinstalls
if %selection% == errorlog goto errorlog
if %selection% == internet goto internet
if %selection% == rhostname goto resolvehost
if %selection% == rhost goto resolvehost
echo .
echo ---%selection%
echo .
echo "%selection%" is not a valid or reconized command.
goto input

:help
rem shows list of all commands integrated
echo .
echo ---%selection%
echo [i] = Part of command needs internet access
echo Commands:
echo Help - Shows this list
echo console      - Shows console info
echo cd           - Change directory
echo exit         - Exits to cmd
echo clear        - Clears the console
echo doyoutrustme - Ask to elevate console with admin privileges
echo install      - [i]Install a package
echo packages     - [i]Displays list of available packages
echo internet     - [i]Checks if you have internet access
echo checkinstall - Checks if the PackagesInstalled.txt is configured correctly
echo start        - Starts installed package
echo dir          - Opens current directory in Explorer
echo errorlog     - Enables errorlogging
echo rhostname    - Resolves hostname to ip
echo rhost        - Shourcut for rhostname
echo ----------Note: I am working on command augments
goto input

:elevate
echo .
echo ---%selection%
echo Will try to elevate cmd now.
rem runas asks for password to admin user
runas /user:%username% /savecred cobra.bat
goto input

:console
rem the console command shows basic information about cobra.
echo .
echo ---%selection%
echo Cobra 1.0 - Totally not a copy of Python :-D.
echo opened in path: %cd% :
goto input

:cd
rem "cd" changes the current directory
echo .
echo ---%selection%
echo CD: %cd%
set /P selection1=%h1% 
cd %selection1%
goto input

:exit
rem displays bye message then exits with the command "cmd"
echo .
echo Thanks for visiting. Hope to see you again soon.
echo .
cmd

:clear
rem "clear" simply clears cmd output
cls
goto input

:packages
rem you see, this is a more advanced command it uses the "@powershell" command to access powershell commands
rem It displays the installed packages
echo .
echo ---%selection%
rem the below command downloads a status file of existing packages on my file server then displays the output with a "type" command
rem @powershell Invoke-WebRequest http://cobrapackages.000webhostapp.com/Packages.txt -OutFile "C:\Users\$env:UserName\Cobra\Dependencies\Packages.txt"
@powershell Invoke-WebRequest https://raw.githubusercontent.com/kres0345/CobraConsole/master/Dependencies/Packages.txt -OutFile "C:\Users\$env:UserName\Cobra\Dependencies\Packages.txt"
echo .
echo The following packages is available:
type C:\Users\%username%\Cobra\Dependencies\Packages.txt
echo .
echo .
echo The following packages is installed:
type C:\Users\%username%\Cobra\Dependencies\PackagesInstalled.txt
echo.
echo.
echo.
goto input

:dir
rem Dir is a feuture I've seeked in the cmd for awhile, since I couldn't find it I created it myself
start %cd%
goto input


:install
rem Another advanced command, it downloads the package list from my server and sees, if the the package name inserted exists, if not then goes back to main input.
rem if it exists then it proceeds to :start

rem @powershell Invoke-WebRequest http://cobrapackages.000webhostapp.com/Packages.txt -OutFile "C:\Users\$env:UserName\Packages.txt"

@powershell Invoke-WebRequest https://raw.githubusercontent.com/kres0345/CobraConsole/master/Dependencies/Packages.txt -OutFile "C:\Users\$env:UserName\Packages.txt"
if %errorlevel% == 1 echo Something went wrong couldn't install list of packages. Are you connected to the internet.
echo .
echo ---%selection%
echo .
echo Install a package
set /P installp=%h2%
rem VVV  sees if it can find the input in package list. Then "if %errorlevel%" checks if the "find" command was successfull
find "%installp%" "C:\Users\%username%\Packages.txt">nul
if %errorlevel% == 0 goto installpack
echo Invalid name or non existent Package requested. Returning to input
echo .
goto input

:installpack
rem installs a package
echo install package
find "%installp%" "C:\Users\%username%\Cobra\Dependencies\PackagesInstalled.txt">nul
if %errorlevel% == 0 goto installerror
echo %installp% >> "C:\Users\%username%\Cobra\Dependencies\PackagesInstalled.txt"
set /p "=%installp%" <nul >>"C:\Users\%username%\Cobra\Dependencies\PackagesInstalled.txt"
@powershell Invoke-WebRequest http://raw.githubusercontent.com/kres0345/CobraConsole/master/Dependencies/%installp%.bat -OutFile "C:\Users\$env:UserName\Cobra\Dependencies\%installp%.bat"
goto input

:installerror
rem this just displays an install error using the echo commands.
echo Package already exists
echo If this is not true then run command "checkinstalls"
goto input

:checkinstalls
rem work in progress
echo Checking if config is correct
if exist C:\Users\%username%\Cobra\Dependencies\%1%.bat echo true1
if exist C:\Users\%username%\Cobra\Dependencies\%2%.bat echo true2
if exist C:\Users\%username%\Cobra\Dependencies\%3%.bat echo true3
if exist C:\Users\%username%\Cobra\Dependencies\%4%.bat echo true4
if exist C:\Users\%username%\Cobra\Dependencies\%5%.bat echo true5
pause
goto input


:start
rem starts a package. Checks if package requested is installed.
echo .
echo ---%selection%
echo Installed packages: 
type C:\Users\%username%\Cobra\Dependencies\PackagesInstalled.txt
echo .
echo .
set /P startp=%h3%
find "%startp%" "C:\Users\%username%\Cobra\Dependencies\PackagesInstalled.txt">nul
if %errorlevel% == 0 goto startpack
echo Package not existing
goto input

:startpack
"C:\Users\%username%\Cobra\Dependencies\%startp%"
goto input

:errorlog
echo This function is currently WIP
goto input

:internet
ping www.google.com -n 1 -w 2000>nul
if %errorlevel% == 1 echo No internet connection
if %errorlevel% == 0 echo Internet connection detected
goto input


:resolvehost
set /P host=%h4%
ping -a -n 1 -w 1 -l 69 %host% |find "Ping statistics for"
goto input
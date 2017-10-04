@echo off
md C:\Users\%username%\Cobra\Dependencies
echo . > "C:\Users\%username%\Cobra\Dependencies\PackagesInstalled.txt"
echo Cobra 1.0 - Totally not a copy of Python :-D.
echo opened in path: %cd% :
echo .
echo Type "help" for command list
:input
set selection=""
set h="Cobra --> "
set h1="cd --> "
set h2="Package --> "
set h3="Package->"
set /P selection=%h% 
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
echo Invalid syntax or unrecognized command.
goto input

:help
echo .
echo ---%selection%
echo Commands:
echo Help - Shows this list
echo console - Shows console info
echo cd - Change directory
echo exit - Exits to cmd
echo clear - Clears the console
echo doyoutrustme - Ask to elevate console with admin privileges
echo install - Install a package
echo packages - Displays list of available packages
goto input

:elevate
echo Will try to elevate cmd now.
runas /user:%username% /savecred cobra.bat
goto input

:console
echo .
echo ---%selection%
echo Cobra 1.0 - Totally not a copy of Python :-D.
echo opened in path: %cd% :
goto input

:cd
echo .
echo CD: %cd%
set /P selection1=%h1% 
cd %selection1%
goto input

:exit
echo Thanks for visiting. Hope to see you again soon.
echo .
cmd

:clear
cls
goto input

:packages
@powershell Invoke-WebRequest http://cobrapackages.000webhostapp.com/Packages.txt -OutFile "C:\Users\$env:UserName\Packages.txt"
echo .
echo The following packages is available:
type Packages.txt
echo .
goto input

:dir
start %cd%
goto input


:install
@powershell Invoke-WebRequest http://cobrapackages.000webhostapp.com/Packages.txt -OutFile "C:\Users\$env:UserName\Packages.txt"
echo .
echo Install a package
set /P installp=%h2%
find "%installp%" "C:\Users\%username%\Packages.txt">nul
if %errorlevel% == 0 goto installpack
echo %installp% >> "C:\Users\%username%\Cobra\Dependencies\PackagesInstalled.txt"
echo Invalid name or non existent Package requested. Returning to input
echo .
goto input

:start
echo Installed package
set /P startp=%h3%
find "%startp%" "C:\Users\%username%\Cobra\Dependencies\PackagesInstalled.txt">nul
if %errorlevel% == 0 goto startpack
echo Package not existing
goto input

:startpack
"C:\Users\%username%\Cobra\Dependencies\%startp%"
goto input


:installpack
echo install package
@powershell Invoke-WebRequest http://cobrapackages.000webhostapp.com/Packages/%installp%.zip -OutFile "C:\Users\$env:UserName\Cobra\Dependencies\%installp%.zip"
@powershell Expand-Archive "C:\Users\$env:UserName\Cobra\Dependencies\%installp%.zip" -DestinationPath "C:\Users\$env:UserName\Cobra\Dependencies\%installp%"
goto input





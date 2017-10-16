@echo off
del Errorlog.log>nul
echo Creating Cobra folder
md "C:\Users\%username%\Cobra\Dependencies"
if %errorlevel% == 0 echo Done creating folder
echo Do you want to setup Cobra in path(it basicly means you can type "cobra" anywhere in cmd)?
set /P q1=y or n: 
if %q1% == y goto path
echo Path not configured
:afterq1
echo.
echo Last question. Do you wan't to autolaunch Cobra after installation. (Path needed)
set /P q2=y or n: 
:afterq2
@powershell Invoke-WebRequest -Uri https://raw.githubusercontent.com/kres0345/CobraConsole/master/cobra.bat -OutFile "C:\Users\%username%\Cobra\cobra.bat" > Errorlog.log
if %errorlevel% == 1 goto error
echo Cobra is installed correctly.
echo Cobra is located in: C:\Users\%username%\Cobra\cobra.bat
if %q1% == y echo Or just type "cobra" in a cmd
if %q2% == y Cobra
echo You can exit now.
pause
exit

:path
rem set PATH=%PATH%;C:\Users\%username%\Cobra
set PATH=%PATH%;C:\Users\%username%\Cobra
if %errorlevel% == 0 echo Path set.
if %errorlevel% == 1 echo Path not set. Error.
goto afterq1


:error
echo Something went wrong Cobra did not install successfully.
echo if this bug continues please report in issues tab.
echo You can exit now.
echo You can read Errorlog.log in install.bat's directory
pause
exit
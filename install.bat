@echo off
del Errorlog.log
echo Creating Cobra folder
md "C:\Users\%username%\Cobra\Dependencies"
echo Done creating folder
echo Do you want to setup Cobra in path(it basicly means you can type "cobra" anywhere in cmd)?
set /P q1=y or n: 
if %q1% == y goto yes 
echo Path not configured
echo Last question. Do you want to set Cobra in path?.
set /P q2=y or n: 
if %q2% == y goto yes
echo OK well it's up to you.
:continue 
@powershell Invoke-WebRequest -Uri https://raw.githubusercontent.com/kres0345/CobraConsole/master/cobra.bat -OutFile "C:\Users\%username%\Cobra\cobra.bat" >> Errorlog.log
if %errorlevel% == 1 goto error
echo Cobra is installed correctly.
echo Cobra is located in: C:\Users\%username%\Cobra\cobra.bat
if %q1% == y echo Or just type "cobra" in a cmd
if %q2% == y echo Or just type "cobra" in a cmd
echo You can exit now.
pause
exit

:yes
set PATH=%PATH%;C:\Users\%username%\Cobra
echo Path set.
goto continue

:error
echo Something went wrong Cobra did not install successfully.
echo if this bug continues please report in issues tab.
echo You can exit now.
echo You can read Errorlog.log in install.bat's directory
pause
exit
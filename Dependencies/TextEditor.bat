@echo off
md "C:\Users\%username%\Cobra\TextEditor"
echo Set filename
goto setall
:continue
set h="TextEditor --> "
set /P Filename=%h% 
echo . > "C:\Users\%username%\Cobra\TextEditor\%Filename%"
echo Now start writing. when done make new line and type exitexit
set /P line1=1: 
if %line1% == exitexit goto save
set /P line2=2:
if %line2% == exitexit goto save
set /P line3=3:
if %line3% == exitexit goto save
set /P line4=4:
if %line4% == exitexit goto save
set /P line5=5:
if %line5% == exitexit goto save
set /P line6=6:
if %line6% == exitexit goto save
set /P line7=7:
if %line7% == exitexit goto save
pause

:save
echo %line1% >> "C:\Users\%username%\Cobra\TextEditor\%Filename%"
echo %line2% >> "C:\Users\%username%\Cobra\TextEditor\%Filename%"
echo %line3% >> "C:\Users\%username%\Cobra\TextEditor\%Filename%"
echo %line4% >> "C:\Users\%username%\Cobra\TextEditor\%Filename%"
echo %line5% >> "C:\Users\%username%\Cobra\TextEditor\%Filename%"
echo %line6% >> "C:\Users\%username%\Cobra\TextEditor\%Filename%"
echo %line7% >> "C:\Users\%username%\Cobra\TextEditor\%Filename%"
:finaloutput
set dir="C:\Users\%username%\Cobra\TextEditor\%Filename%"
type %dir%
pause
exit


:setall
set line1=""
set line2=""
set line3=""
set line4=""
set line5=""
set line6=""
set line7=""
goto continue

@echo off
echo Type "help" for command list
:input
set selection=""
set h=". Cobra --> "
set h1="cd -->"
set /P selection=%h% 
if %selection% == h goto help
if %selection% == help goto help
if %selection% == console goto console
if %selection% == cd goto cd
if %selection% == exit goto exit
if %selection% == clear cls
echo Invalid syntax or unrecognized command
goto input

:help
echo .
echo ---%selection%
echo Commands:
echo Help - Shows this list
echo console - Shows console info
echo cd - Change directory
echo exit - exits to cmd
goto input

:console
echo .
echo ---%selection%
echo Cobra 1.0 - Totally not a copy of Python :-D.
echo Openend in path: %cd% :
goto input

:cd
echo .
echo CD: %cd%
set /P selection1=%h1% 
cd %selection1%
goto input

:exit
echo Thanks for visiting. Hope to see you again soon.
cmd
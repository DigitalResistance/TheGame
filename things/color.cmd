if not (%1)==(-set) goto menu
if not exist color.s echo 07 >color.s
set /p color=<color.s
color %color%
if %color:~0,-2%==0 set bcolor=black
if %color:~0,-2%==1 set bcolor=blue
if %color:~0,-2%==2 set bcolor=green
if %color:~0,-2%==3 set bcolor=cyan
if %color:~0,-2%==4 set bcolor=red
if %color:~0,-2%==5 set bcolor=magenta
if %color:~0,-2%==6 set bcolor=yellow
if %color:~0,-2%==7 set bcolor=white
if %color:~0,-2%==8 set bcolor=gray
if %color:~0,-2%==9 set bcolor=bright blue
if %color:~0,-2%==a set bcolor=bright green
if %color:~0,-2%==b set bcolor=bright cyan
if %color:~0,-2%==c set bcolor=bright red
if %color:~0,-2%==d set bcolor=bright magenta
if %color:~0,-2%==e set bcolor=bright yellow
if %color:~0,-2%==f set bcolor=bright white
if %color:~1,-1%==0 set tcolor=black
if %color:~1,-1%==1 set tcolor=blue
if %color:~1,-1%==2 set tcolor=green
if %color:~1,-1%==3 set tcolor=cyan
if %color:~1,-1%==4 set tcolor=red
if %color:~1,-1%==5 set tcolor=magenta
if %color:~1,-1%==6 set tcolor=yellow
if %color:~1,-1%==7 set tcolor=white
if %color:~1,-1%==8 set tcolor=gray
if %color:~1,-1%==9 set tcolor=bright blue
if %color:~1,-1%==a set tcolor=bright green
if %color:~1,-1%==b set tcolor=bright cyan
if %color:~1,-1%==c set tcolor=bright red
if %color:~1,-1%==d set tcolor=bright magenta
if %color:~1,-1%==e set tcolor=bright yellow
if %color:~1,-1%==f set tcolor=bright white
exit /b
:menu
set /p color=<color.s
if %color:~0,-2%==0 set bcolor=black
if %color:~0,-2%==1 set bcolor=blue
if %color:~0,-2%==2 set bcolor=green
if %color:~0,-2%==3 set bcolor=cyan
if %color:~0,-2%==4 set bcolor=red
if %color:~0,-2%==5 set bcolor=magenta
if %color:~0,-2%==6 set bcolor=yellow
if %color:~0,-2%==7 set bcolor=white
if %color:~0,-2%==8 set bcolor=gray
if %color:~0,-2%==9 set bcolor=bright blue
if %color:~0,-2%==a set bcolor=bright green
if %color:~0,-2%==b set bcolor=bright cyan
if %color:~0,-2%==c set bcolor=bright red
if %color:~0,-2%==d set bcolor=bright magenta
if %color:~0,-2%==e set bcolor=bright yellow
if %color:~0,-2%==f set bcolor=bright white
if %color:~1,-1%==0 set tcolor=black
if %color:~1,-1%==1 set tcolor=blue
if %color:~1,-1%==2 set tcolor=green
if %color:~1,-1%==3 set tcolor=cyan
if %color:~1,-1%==4 set tcolor=red
if %color:~1,-1%==5 set tcolor=magenta
if %color:~1,-1%==6 set tcolor=yellow
if %color:~1,-1%==7 set tcolor=white
if %color:~1,-1%==8 set tcolor=gray
if %color:~1,-1%==9 set tcolor=bright blue
if %color:~1,-1%==a set tcolor=bright green
if %color:~1,-1%==b set tcolor=bright cyan
if %color:~1,-1%==c set tcolor=bright red
if %color:~1,-1%==d set tcolor=bright magenta
if %color:~1,-1%==e set tcolor=bright yellow
if %color:~1,-1%==f set tcolor=bright white
echo Current colors: %tcolor% text on %bcolor% background.
echo.
choice.exe /c:yn "Do you want to change colors"
if %errorlevel%==2 exit /b
if %errorlevel%==0 exit /b
:tcolor
echo.
echo New text color:
set /p tcolor=^> 
if "%tcolor%"=="black" goto bcolor
if "%tcolor%"=="blue" goto bcolor
if "%tcolor%"=="green" goto bcolor
if "%tcolor%"=="cyan" goto bcolor
if "%tcolor%"=="red" goto bcolor
if "%tcolor%"=="magenta" goto bcolor
if "%tcolor%"=="yellow" goto bcolor
if "%tcolor%"=="white" goto bcolor
if "%tcolor%"=="gray" goto bcolor
if "%tcolor%"=="bright blue" goto bcolor
if "%tcolor%"=="bright green" goto bcolor
if "%tcolor%"=="bright cyan" goto bcolor
if "%tcolor%"=="bright red" goto bcolor
if "%tcolor%"=="bright magenta" goto bcolor
if "%tcolor%"=="bright yellow" goto bcolor
if "%tcolor%"=="bright white" goto bcolor
if "%tcolor%"=="list" goto list
echo.
echo Invalid color. Type "list" to list colors.
set tcolor=%color:~1,-1%
goto tcolor
:bcolor
echo.
echo New background color:
set /p bcolor=^> 
if "%bcolor%"=="black" goto writeq
if "%bcolor%"=="blue" goto writeq
if "%bcolor%"=="green" goto writeq
if "%bcolor%"=="cyan" goto writeq
if "%bcolor%"=="red" goto writeq
if "%bcolor%"=="magenta" goto writeq
if "%bcolor%"=="yellow" goto writeq
if "%bcolor%"=="white" goto writeq
if "%bcolor%"=="gray" goto writeq
if "%bcolor%"=="bright blue" goto writeq
if "%bcolor%"=="bright green" goto writeq
if "%bcolor%"=="bright cyan" goto writeq
if "%bcolor%"=="bright red" goto writeq
if "%bcolor%"=="bright magenta" goto writeq
if "%bcolor%"=="bright yellow" goto writeq
if "%bcolor%"=="bright white" goto writeq
if "%bcolor%"=="list" goto list
echo.
echo Invalid color. Type "list" to list colors.
set bcolor=%color:~0,-2%
goto bcolor
:writeq
echo.
choice.exe /c:yn "Do you want to set colors to: %tcolor% text on %bcolor% background"
if %errorlevel%==2 exit /b
if %errorlevel%==0 exit /b
if "%bcolor%"=="black" set bcolor=0
if "%bcolor%"=="blue" set bcolor=1
if "%bcolor%"=="green" set bcolor=2
if "%bcolor%"=="cyan" set bcolor=3
if "%bcolor%"=="red" set bcolor=4
if "%bcolor%"=="magenta" set bcolor=5
if "%bcolor%"=="yellow" set bcolor=6
if "%bcolor%"=="white" set bcolor=7
if "%bcolor%"=="gray" set bcolor=8
if "%bcolor%"=="bright blue" set bcolor=9
if "%bcolor%"=="bright green" set bcolor=a
if "%bcolor%"=="bright cyan" set bcolor=b
if "%bcolor%"=="bright red" set bcolor=c
if "%bcolor%"=="bright magenta" set bcolor=d
if "%bcolor%"=="bright yellow" set bcolor=e
if "%bcolor%"=="bright white" set bcolor=f
if "%tcolor%"=="black" set tcolor=0
if "%tcolor%"=="blue" set tcolor=1
if "%tcolor%"=="green" set tcolor=2
if "%tcolor%"=="cyan" set tcolor=3
if "%tcolor%"=="red" set tcolor=4
if "%tcolor%"=="magenta" set tcolor=5
if "%tcolor%"=="yellow" set tcolor=6
if "%tcolor%"=="white" set tcolor=7
if "%tcolor%"=="gray" set tcolor=8
if "%tcolor%"=="bright blue" set tcolor=9
if "%tcolor%"=="bright green" set tcolor=a
if "%tcolor%"=="bright cyan" set tcolor=b
if "%tcolor%"=="bright red" set tcolor=c
if "%tcolor%"=="bright magenta" set tcolor=d
if "%tcolor%"=="bright yellow" set tcolor=e
if "%tcolor%"=="bright white" set tcolor=f
set color=%bcolor%%tcolor%
echo %color% >color.s
color %color%
echo.
echo Done.
exit /b
:list
echo.
echo black, blue, green, cyan, red, magenta, yellow, white, gray, bright blue, bright green,
echo bright cyan, bright red, bright magenta, bright yellow, bright white.
goto tcolor
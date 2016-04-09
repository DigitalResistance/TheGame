echo Please wait...
title Please wait...
set missing=0
if not exist welcome.txt set /a missing=%missing%+1
if not exist version.txt set /a missing=%missing%+1
if not exist eula.txt set /a missing=%missing%+1
if not exist helpfile.txt set /a missing=%missing%+1
if not exist credits.txt set /a missing=%missing%+1
if not exist artifact.txt set /a missing=%missing%+1
if not exist initialvalues.cmd set /a missing=%missing%+1
if not exist color.cmd set /a missing=%missing%+1
if not exist saveload.cmd set /a missing=%missing%+1
if not exist actioncheck.cmd set /a missing=%missing%+1
if not exist responseinvalid.cmd set /a missing=%missing%+1
if not exist lwi.cmd set /a missing=%missing%+1
if not exist ifroom.cmd set /a missing=%missing%+1
if not exist direction.cmd set /a missing=%missing%+1
if not exist interact.cmd set /a missing=%missing%+1
if not exist firsttimeq.cmd set /a missing=%missing%+1
if not exist messagebox.exe set /a missing=%missing%+1
if not exist random.exe set /a missing=%missing%+1
if not exist nircmdc.exe set /a missing=%missing%+1
if not exist choice.exe set /a missing=%missing%+1
if not exist initool.exe set /a missing=%missing%+1
if not %missing%==0 (
	title Error
	set missingresponse=files
	if %missing%==1 set missingresponse=file
	echo %missing% %missingresponse% missing.
	pause>nul
	exit
)
call initialvalues.cmd && call color.cmd -set
:start
cls
if exist hal (
	title The Game 9000
) else title The Game
type welcome.txt
echo.
call firsttimeq.cmd
echo What do you want to do? 
:actionset
if exist hal (
	title The Game 9000
) else title The Game
call ifroom.cmd
echo.
set /p action=^> 
echo.
call actioncheck.cmd
if %valid%==true goto %action%
if %valid%==false goto actionset

:: this is where the fun begins
:test
echo Suddenly an ancient artifact from the pre-alpha testing phase appears.
echo It looks like this:
echo.
type artifact.txt
echo.
echo Right after you've read the label, the artifact disappears, leaving no trace behind.
goto actionset
:exit
choice.exe /c:yn "Are you sure"
echo.
if %errorlevel%==2 goto actionset
if %errorlevel%==1 exit /b
if %errorlevel%==0 goto actionset
:viewthehelpfileplz
type helpfile.txt
goto actionset
:whoami
echo You are %username%.
if not exist states\whoamiwi.state (
	type nul>states\whoamiwi.state
	echo.
	echo Psst! Use the command whoamiwi, with imagination!
)
goto actionset
:whereami
popd
echo You are in "%cd%" on %computername%.
pushd things
if not exist states\whereamiwi.state (
	type nul>states\whereamiwi.state
	echo.
	echo Psst! Use the command whereamiwi, with imagination!
)
goto actionset
:whenami
echo You are at %date% %time:~0,-3%.
if not exist states\whenamiwi.state (
	type nul>states\whenamiwi.state
	echo.
	echo Psst! Use the command whenamiwi, with imagination!
)
goto actionset
:save
call saveload.cmd -save
goto actionset
:load
call saveload.cmd -load
goto start
:suicide
choice.exe /c:yn "Are you really sure you want to kill yourself"
echo.
if %errorlevel%==2 goto actionset
if %errorlevel%==1 echo I don't believe you.
if %errorlevel%==0 goto actionset
goto actionset
:eat
call interact.cmd -eat
if "%eat%"=="me" goto dead
goto actionset
:kill
call interact.cmd -kill
goto actionset
:take
call interact.cmd -take
if "%take%"=="me" goto dead
goto actionset
:look
echo You see a window with %tcolor%ish text on a %bcolor% background.
echo In the lower left corner of the window you see a ^> sign and a flashing underscore.
if not exist states\lookwi.state (
	type nul >states\lookwi.state
	echo.
	echo Psst! Use the command lookwi, with imagination!
)
goto actionset
:version
type version.txt | more
goto actionset
:lookwi
call lwi.cmd
goto actionset
:!
echo ?
goto actionset
:?
echo !
goto actionset
:n
:s
:w
:e
call direction.cmd
goto actionset
:u
echo You can't go up in the air.
goto actionset
:d
echo You can't go down into the ground.
goto actionset
:clear
cls
echo.
echo There you go, I cleaned it up for you.
goto actionset
:iwannaseethegamefiles
echo Ok, here you go.
start.
goto actionset
:lift
call interact.cmd -lift
goto actionset
:open
call interact.cmd -open
goto actionset
:turn
echo Which way do you want to look?
echo.
set /p look=^> 
echo.
if "%look%"=="%facing%" (
	echo You are already facing %facing%.
	goto actionset
)
if "%look%"=="n" ( 
	set facing=north
	echo You are now facing north.
	goto actionset
)
if "%look%"=="s" ( 
	set facing=south
	echo You are now facing south.
	goto actionset
)
if "%look%"=="w" ( 
	set facing=west
	echo You are now facing west.
	goto actionset
)
if "%look%"=="e" ( 
	set facing=east
	echo You are now facing east.
	goto actionset
)
if "%look%"=="u" ( 
	set facing=up
	echo You are now looking at the ceiling.
	goto actionset
)
if "%look%"=="d" ( 
	set facing=down
	echo You are now looking at the floor.
	goto actionset
)
echo "%look%" isn't a valid direction. (n, s, w, e, u, d)
goto actionset
:bearing
if %facing%==up (
	echo You are looking at the ceiling.
	goto actionset
)
if %facing%==down (
	echo You are looking at the floor.
	goto actionset
)
echo You are facing %facing%.
goto actionset
:keys
set keysresponse=keys
if %keys%==1 set keysresponse=key
echo You have %keys% %keysresponse%.
if %hasgreatkey%==true (
	echo.
	echo You also have that quite big key from the toilet.
)
goto actionset
:whoamiwi
echo You are Shaun Hickleson, a 41-year-old private detective.
goto actionset
:whereamiwi
if %room%==outside (
	echo You don't know exactly where you are, but you are outside, that's for sure.
	echo.
	echo At last.
) else echo God knows where you are...
goto actionset
:whenamiwi
echo Friday, October 15, 2020.
echo You've lost your clock and don't know exactly what time it is, but you think it's evening.
goto actionset
:jump
echo You jumped. I have no idea why.
goto actionset
:fuck
call interact.cmd -fuck
goto actionset
:read
call interact.cmd -read
goto actionset
:dead
echo You died.
choice.exe /c:yn "Do you want to try again"
if %errorlevel%==2 exit /b
if %errorlevel%==1 call initialvalues.cmd && goto start
exit /b
:color
call color.cmd
goto actionset
:hi
echo Hello.
goto actionset
:hello
echo Hi.
goto actionset
:xyzzy
cls
title xyzzy
echo "back" to get back to game
:xyzzyloop
echo.
set /p command=%cd%^>
if "%command%"=="back" goto start
%command%
goto xyzzyloop
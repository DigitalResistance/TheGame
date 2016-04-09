if exist states\notfirsttime.state exit /b
type nul >states\notfirsttime.state
echo It is your first time launching the game.
:q
choice.exe /c:yn "Would you like to read the help file"
if %errorlevel%==2 (
	echo.
	echo Ok then. Remember you can read the help file whenever you want by typing "viewthehelpfileplz".
	echo.
	exit /b
)
if %errorlevel%==1 (
	echo.
	type helpfile.txt
	echo.
	exit /b
)
if %errorlevel%==0 goto q
random.exe 1 6 >nul
if %errorlevel%==6 echo What?
if %errorlevel%==5 echo I'm sorry, I don't know what "%action%" means.
if %errorlevel%==4 echo	You can't do that.
if %errorlevel%==3 echo I don't understand...
if %errorlevel%==2 echo That's not a valid command.
if %errorlevel%==1 echo "%action%" isn't a valid command.
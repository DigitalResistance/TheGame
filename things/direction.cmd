:: this script handles movement between rooms too.
if %room%==outside (
	echo You are still outside.
	exit /b
)
if "%action%"=="n" (
	if %roomton%==true (
		if %room%==prisoncell if %prisoncelldooropen%==true (
			set room=corridor1
			call lwi.cmd
			exit /b
		)
		if %room%==corridor2 (
			set room=lobby
			call lwi.cmd
			exit /b
		)
		if %room%==lobby if %exitopen%==true (
			set room=outside
			type credits.txt | more
			exit /b
		)
		if %room%==toilet (
			set room=corridor3
			call lwi.cmd
			exit /b
		)
	)
	echo You can't go north from here.
	exit /b
)
if "%action%"=="s" (
	if %roomtos%==true (
		if %room%==corridor1 (
			set room=prisoncell
			call lwi.cmd
			exit /b
		)
		if %room%==lobby (
			set room=corridor2
			call lwi.cmd
			exit /b
		)
		if %room%==corridor3 (
			set room=toilet
			call lwi.cmd
			exit /b
		)
	)
	echo You can't go south from here.
	exit /b
)
if "%action%"=="w" (
	if %roomtow%==true (
		if %room%==corridor1 (
			set room=dorm
			call lwi.cmd
			exit /b
		)
		if %room%==dorm if %dormdooropen%==true (
			set room=corridor2
			call lwi.cmd
			exit /b
		)
		if %room%==corridor2 if %storageroomdooropen%==true (
			set room=storageroom
			call lwi.cmd
			exit /b
		)
		if %room%==lobby if %staffroomdooropen%==true (
			set room=staffroom
			call lwi.cmd
			exit /b
		)
		if %room%==corridor3 (
			set room=lobby
			call lwi.cmd
			exit /b
		)
		if %room%==breakroom (
			set room=corridor3
			call lwi.cmd
			exit /b
		)
		if %room%==office (
			set room=corridor1
			call lwi.cmd
			exit /b
		)
	)
	echo You can't go west from here.
	exit /b
)
if "%action%"=="e" (
	if %roomtoe%==true (
		if %room%==corridor1 (
			set room=office
			call lwi.cmd
			exit /b
		)
		if %room%==dorm (
			set room=corridor1
			call lwi.cmd
			exit /b
		)
		if %room%==corridor2 (
			set room=dorm
			call lwi.cmd
			exit /b
		)
		if %room%==lobby (
			set room=corridor3
			call lwi.cmd
			exit /b
		)
		if %room%==staffroom (
			set room=lobby
			call lwi.cmd
			exit /b
		)
		if %room%==corridor3 (
			set room=breakroom
			call lwi.cmd
			exit /b
		)
		if %room%==storageroom (
			set room=corridor2
			call lwi.cmd
			exit /b
		)
	)
	echo You can't go east from here.
	exit /b
)
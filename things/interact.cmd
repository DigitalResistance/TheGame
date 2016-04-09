if not (%1)==(-open) if not (%1)==(-lift) if not (%1)==(-eat) if not (%1)==(-kill) if not (%1)==(-take) if not (%1)==(-read) if not (%1)==(-fuck) exit /b
goto %1
:-open
set /p open=Open...^> 
echo.
if "%open%"=="nothing" (
	echo Ok.
	exit /b
)
if "%open%"=="pod bay doors" (
	if exist hal (
		echo Are you happy now?
		exit /b
	)
	echo I'm sorry, %username%, I'm afraid I can't let you do that.
	type nul>hal
	exit /b
)
if %room%==prisoncell (
	if "%open%"=="door" (
		if %prisoncelldooropen%==false if not %keys%==0 (
			echo You opened the door.
			set /a keys=%keys%-1
			set prisoncelldooropen=true
			exit /b
		)
	)
)
if %room%==dorm (
	if "%open%"=="door" (
		if %dormdooropen%==false if not %keys%==0 (
			echo You opened the door.
			set /a keys=%keys%-1
			set dormdooropen=true
			exit /b
		)
	)
)
if %room%==lobby (
	if "%open%"=="door" (
		if %staffroomdooropen%==false if not %keys%==0 (
			echo You opened the door.
			set /a keys=%keys%-1
			set staffroomdooropen=true
			exit /b
		)
	)
	if "%open%"=="exit" (
		if %exitopen%==false if %hasgreatkey%==true (
			echo You opened the exit door! You can leave now!
			set hasgreatkey=false
			set exitopen=true
			exit /b
		)
	)
)
if %room%==corridor2 (
	if "%open%"=="door" (
		if %storageroomdooropen%==false if not %keys%==0 (
			echo You opened the door.
			set /a keys=%keys%-1
			set storageroomdooropen=true
			exit /b
		)
	)
)
if %room%==breakroom (
	if "%open%"=="box" (
		if %box1opened%==false (
			echo You opened the box.
			echo.
			echo There's a small box in the box.
			set box1opened=true
			exit /b
		)
		if %box2opened%==false (
			echo You opened the box.
			echo.
			echo There's a tiny box in the box.
			set box2opened=true
			exit /b
		)
		if %box3opened%==false (
			echo You opened the box.
			echo.
			echo There's a piece of paper in the box.
			set box3opened=true
			exit /b
		)
	)
)
if %room%==staffroom (
	if "%open%"=="locker" (
		if %lockeropen%==false (
			echo You opened the locker.
			if %lockerkeytaken%==false (
				echo.
				echo There's a key in the locker.
			)
			set lockeropen=true
			exit /b
		)
	)
)
if %room%==toilet (
	if "%open%"=="toilet" (
		if %toiletopen%==false (
			echo You opened the toilet.
			echo.
			echo It's full of shit.
			if %hasgreatkey%==false (
				echo.
				echo There's also a quite big key in there. Maybe it goes to something special...
			)
			set toiletopen=true
			exit /b
		)
	)
)
echo You can't do that.
exit /b
:-lift
set /p lift=Lift...^> 
echo.
if "%lift%"=="nothing" (
	echo Ok.
	exit /b
)
if %room%==prisoncell (
	if "%lift%"=="bed" (
		if %bedlifted%==false (
			echo You lifted the bed.
			echo.
			echo There's a key under the bed.
			echo.
			echo The bed was heavy, so you put it against the wall to your left.
			set bedlifted=true
			exit /b
		)
		echo The bed is leaning against the wall to your left.
		exit /b
	)
)
echo You can't do that.
exit /b
:-eat
set /p eat=Eat...^> 
echo.
if "%eat%"=="nothing" (
	echo Ok.
	exit /b
)
if "%eat%"=="carrot" (
	if %carrottaken%==true if %carroteaten%==false (
		echo You ate the carrot. It was delicious.
		set carroteaten=true
		exit /b
	)
)
if not "%eat%"=="me" echo You can't do that.
exit /b
:-kill
set /p kill=Kill...^> 
echo.
if "%kill%"=="nothing" (
	echo Ok.
	exit /b
)
if "%kill%"=="me" (
	echo I don't want to.
	exit /b
)
if "%kill%"=="yourself" (
	start messagebox.exe /c:Error /m:The Game crashed with the following error code:\n\n0x000DEATH: You told me to kill myself, smartass. /t:16
	exit
)
echo You can't do that.
exit /b
:-take
set /p take=Take...^> 
echo.
if "%take%"=="nothing" (
	echo Ok.
	exit /b
)
if "%take%"=="me" (
	echo You have been kidnapped by a command prompt. Congratulations.
	nircmdc.exe wait 1000 >nul
	echo The command prompt killed you. Congratulations again.
	echo.
	exit /b
)
if %room%==prisoncell (
	if "%take%"=="carrot" (
		if %carrottaken%==false (
			echo You now have a carrot. Congratulations.
			set carrottaken=true
			exit /b
		)
	)
	if "%take%"=="key" (
		if %bedlifted%==true (
			if %prisoncellkeytaken%==false (
				echo You now have a key.
				set prisoncellkeytaken=true
				set /a keys=%keys%+1
				exit /b
			)
		)
	)
)
if %room%==breakroom (
	if "%take%"=="paper" (
		if %box3opened%==true if %papertaken%==false (
			echo You now have a piece of paper.
			set papertaken=true
			exit /b
		)
	)
	if "%take%"=="key" (
		if %breakroomkeytaken%==false (
			echo You now have a key.
			set breakroomkeytaken=true
			set /a keys=%keys%+1
			exit /b
		)
	)
)
if %room%==toilet (
	if "%take%"=="key" (
		if %toiletopen%==true if %hasgreatkey%==false (
			echo You now have the quite big key. Eww.
			set hasgreatkey=true
			exit /b
		)
	)
)
if %room%==staffroom (
	if "%take%"=="key" (
		if %lockeropen%==true if %lockerkeytaken%==false (
			echo You now have a key.
			set lockerkeytaken=true
			set /a keys=%keys%+1
			exit /b
		)
	)
)
if %room%==office (
	if "%take%"=="key" (
		if %officekeytaken%==false (
			echo You now have a key.
			set officekeytaken=true
			set /a keys=%keys%+1
			exit /b
		)
	)
)
if %room%==storageroom (
	if "%take%"=="usb" (
		if %usbtaken%==false (
			echo You now have a USB memory.
			set usbtaken=true
			exit /b
		)
	)
)
echo You can't do that.
exit /b
:-read
set /p read=Read...^> 
echo.
if "%read%"=="nothing" (
	echo Ok.
	exit /b
)
if "%read%"=="eula" (
	type eula.txt
	exit /b
)
if %papertaken%==true (
	if "%read%"=="paper" (
		echo The paper reads:
		echo.
		echo These boxes contain nothing special.
		exit /b
	)
)
echo You can't do that.
exit /b
:-fuck
set /p fuck1=Fuck...^> 
echo.
if "%fuck1%"=="you" start messagebox.exe /c:Error. /m:The Game crashed with the following error code:\n\n0xFFFFFFFF: FuckOverflowException. /t:16 && exit
if "%fuck1%"=="what" (
	set /p fuck2=Fuck what...^> 
	echo.
)
if "%fuck1%"=="what" if "%fuck2%"=="the" (
	echo What the fuck.
	exit /b
)
echo You can't do that.
exit /b
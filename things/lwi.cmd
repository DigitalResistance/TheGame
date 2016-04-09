if %room%==prisoncell (
	echo You are in a prison cell.
	echo The walls are made out of gray concrete. There's a small window with iron bars on one of the walls.
	if %bedlifted%==false echo There's a small hard bed and a table to your right and a door in front of you.
	if %bedlifted%==true (
		echo There's a table to your right and a door in front of you.
		echo There's a small hard bed leaning against the wall to your left.
	)
	if %prisoncelldooropen%==false echo. && echo The door is locked.
	if %carrottaken%==false if %carroteaten%==false (
		echo.
		echo There is a carrot lying on the table.
	)
	if %bedlifted%==true if %prisoncellkeytaken%==false echo. && echo There is a key on the floor where the bed was. 
	exit /b
)
if %room%==corridor1 (
	echo You are in a corridor. The walls are made out of gray concrete.
	echo Naked flourescent lights light up the room with a cold light.
	echo There are two doors other than the door to the prison cell, one in each end of the corridor.
	echo There's a white C painted on the wall.
	exit /b
)
if %room%==dorm (
	echo You are in some sort of dorm. You estimate that there are around 20 beds in the room.
	echo Naked flourescent lights light up the room with a cold light.
	echo One of the beds isn't bedded.
	echo There's a door in the other end of the room.
	if %dormdooropen%==false echo. && echo The door is locked.
	exit /b
)
if %room%==corridor2 (
	echo You are in a well-lit corridor with white walls.
	echo There are three doors; one to the east, one to the west, and one to the north.
	echo There's a white B painted on the wall.
	if %storageroomdooropen%==false echo. && echo One of the doors is locked.
	exit /b
)
if %room%==corridor3 (
	echo You are in a well-lit corridor with white walls.
	echo There are three doors; one to the east, one to the west, and one to the south.
	echo There's a white A painted on the wall.
	exit /b
)
if %room%==breakroom (
	echo You are in a break room. There are three tables with four chairs around each.
	echo The walls are white except for one which is green.
	if %box1opened%==false echo. && echo There's a medium-sized box in the room.
	if %box1opened%==true (
		if %box2opened%==false echo. && echo There's a small box in the room.
		if %box2opened%==true (
			if %box3opened%==false echo. && echo There's a tiny box in the room.
			if %box3opened%==true if %papertaken%==false echo. && echo There's a small piece of paper in the room.
		)
	)
	if %breakroomkeytaken%==false echo. && echo There's a key lying on one of the tables.
	exit /b
)
if %room%==lobby (
	echo You are in a lobby. There's a desk in the room.
	if %exitopen%==true echo There's a large exit to the north.
	if %exitopen%==false echo There's a large exit to the north. It's locked.
	echo There are three other doors in the room.
	if %staffroomdooropen%==false echo. && echo One of them is locked.
	exit /b
)
if %room%==staffroom (
	echo You are in a staff room. There are protection suits hanging on hooks.
	echo.
	if %lockeropen%==false echo There's a locker here. It looks like it's unlocked.
	if %lockeropen%==true echo There's an open locker here.
	exit /b
)
if %room%==toilet (
	echo You are in a very dirty bathroom.
	echo The handwash is broken and there's no toilet paper.
	echo The toilet itself smells like... well... shit.
	if %toiletopen%==true (
		echo.
		echo The toilet is open.
		if %hasgreatkey%==false echo. && echo There is a key in the toilet.
	)
	exit /b
)
if %room%==storageroom (
	echo You are in a pretty large storage room, full of boxes.
	echo It's pretty dark in here.
	if %usbtaken%==false echo. && echo There is a USB memory lying on one of the boxes.
	exit /b
)
if %room%==office (
	echo You are in an office.
	echo There are lots of desks with computers on them.
	echo There's a clock hanging on the wall. It seems to have stopped.
	if %officekeytaken%==true echo There's an empty cup on one of the desks.
	if %officekeytaken%==false echo. && echo There's a key lying on one of the desks, right next to an empty cup.
	exit /b
)
if %room%==outside (
	echo You are outside.
	echo You can hear twittering birds.
	echo The sun has almost gone down.
	echo.
	echo Everything is beautiful.
	exit /b
)
echo This room doesn't exist.
echo You must be cheating, you cheeky bastard.
exit /b
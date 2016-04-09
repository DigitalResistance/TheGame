:: this script handles movement between rooms.
:: template:
:: if %room%== (
::     set roomton=false
::     set roomtos=false
::     set roomtow=false
::     set roomtoe=false
:: )
set roomton=false
set roomtos=false
set roomtow=false
set roomtoe=false
if %room%==prisoncell (
	set roomton=true
	set roomtos=false
	set roomtow=false
	set roomtoe=false
)
if %room%==corridor1 (
	set roomton=false
	set roomtos=true
	set roomtow=true
	set roomtoe=true
)
if %room%==dorm (
	set roomton=false
	set roomtos=false
	set roomtow=true
	set roomtoe=true
)
if %room%==corridor2 (
	set roomton=true
	set roomtos=false
	set roomtow=true
	set roomtoe=true
)
if %room%==lobby (
	set roomton=true
	set roomtos=true
	set roomtow=true
	set roomtoe=true
)
if %room%==staffroom (
	set roomton=false
	set roomtos=false
	set roomtow=false
	set roomtoe=true
)
if %room%==corridor3 (
	set roomton=false
	set roomtos=true
	set roomtow=true
	set roomtoe=true
)
if %room%==toilet (
	set roomton=true
	set roomtos=false
	set roomtow=false
	set roomtoe=false
)
if %room%==breakroom (
	set roomton=false
	set roomtos=false
	set roomtow=true
	set roomtoe=false
)
if %room%==office (
	set roomton=false
	set roomtos=false
	set roomtow=true
	set roomtoe=false
)
if %room%==storageroom (
	set roomton=false
	set roomtos=false
	set roomtow=false
	set roomtoe=true
)
if %room%==outside (
	set roomton=true
	set roomtos=true
	set roomtow=true
	set roomtoe=true
)
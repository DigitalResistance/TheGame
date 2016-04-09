if not (%1)==(-save) if not (%1)==(-load) exit /b
goto %1
:-save
if exist saves\file1\save.ini ( 
	initool.exe /f:saves\file1\save.ini /s:name /k:name >temp
	set /p file1=<temp 
	del /q temp 
) else set file1=(empty)
if exist saves\file2\save.ini ( 
	initool.exe /f:saves\file2\save.ini /s:name /k:name >temp
	set /p file2=<temp 
	del /q temp
) else set file2=(empty)
if exist saves\file3\save.ini ( 
	initool.exe /f:saves\file3\save.ini /s:name /k:name >temp
	set /p file3=<temp 
	del /q temp
) else set file3=(empty)
if exist saves\file4\save.ini ( 
	initool.exe /f:saves\file4\save.ini /s:name /k:name >temp
	set /p file4=<temp 
	del /q temp 
) else set file4=(empty)
if exist saves\file5\save.ini ( 
	initool.exe /f:saves\file5\save.ini /s:name /k:name >temp
	set /p file5=<temp 
	del /q temp
) else set file5=(empty)
:saveselect
echo What save file do you want to save to?
echo.
echo	1: %file1%
echo	2: %file2%
echo	3: %file3%
echo	4: %file4%
echo	5: %file5%
echo	b: Back to game
echo.
:choice
choice.exe /c:12345b /n "> "
echo.
if %errorlevel%==6 exit /b
if %errorlevel%==0 goto choice
set selectedfile=file%errorlevel%
if not exist saves\%selectedfile%\name.data goto nosavethere
echo That file is already used.
choice.exe /c:oa "Do you want to overwrite it or use another file"
if %errorlevel%==2 echo. && goto saveselect
if %errorlevel%==0 echo. && goto saveselect
:nosavethere
echo.
echo What do you want to call the save file?
echo.
set /p savename=^> 
echo.
echo Saving...
echo [name]>saves\%selectedfile%\save.ini
echo name=%savename% >>saves\%selectedfile%\save.ini
echo [vars]>>saves\%selectedfile%\save.ini
echo facing=%facing% >>saves\%selectedfile%\save.ini
echo room=%room% >>saves\%selectedfile%\save.ini
echo carrottaken=%carrottaken% >>saves\%selectedfile%\save.ini
echo carroteaten=%carroteaten% >>saves\%selectedfile%\save.ini
echo keys=%keys% >>saves\%selectedfile%\save.ini
echo bedlifted=%bedlifted% >>saves\%selectedfile%\save.ini
echo prisoncelldooropen=%prisoncelldooropen% >>saves\%selectedfile%\save.ini
echo prisoncellkeytaken=%prisoncellkeytaken% >>saves\%selectedfile%\save.ini
echo officekeytaken=%officekeytaken% >>saves\%selectedfile%\save.ini
echo dormdooropen=%dormdooropen% >>saves\%selectedfile%\save.ini
echo box1opened=%box1opened% >>saves\%selectedfile%\save.ini
echo box2opened=%box2opened% >>saves\%selectedfile%\save.ini
echo box3opened=%box3opened% >>saves\%selectedfile%\save.ini
echo papertaken=%papertaken% >>saves\%selectedfile%\save.ini
echo hasgreatkey=%hasgreatkey% >>saves\%selectedfile%\save.ini
echo exitopen=%exitopen% >>saves\%selectedfile%\save.ini
echo lockeropen=%lockeropen% >>saves\%selectedfile%\save.ini
echo lockerkeytaken=%lockerkeytaken% >>saves\%selectedfile%\save.ini
echo toiletopen=%toiletopen% >>saves\%selectedfile%\save.ini
echo staffroomdooropen=%staffroomdooropen% >>saves\%selectedfile%\save.ini
echo storageroomdooropen=%storageroomdooropen% >>saves\%selectedfile%\save.ini
echo breakroomkeytaken=%breakroomkeytaken% >>saves\%selectedfile%\save.ini
echo usbtaken=%usbtaken% >>saves\%selectedfile%\save.ini
echo.
echo Saved.
exit /b
:-load
if exist saves\file1\save.ini ( 
	initool.exe /f:saves\file1\save.ini /s:name /k:name >temp
	set /p file1=<temp 
	del /q temp 
) else set file1=(empty)
if exist saves\file2\save.ini ( 
	initool.exe /f:saves\file2\save.ini /s:name /k:name >temp
	set /p file2=<temp 
	del /q temp
) else set file2=(empty)
if exist saves\file3\save.ini ( 
	initool.exe /f:saves\file3\save.ini /s:name /k:name >temp
	set /p file3=<temp 
	del /q temp
) else set file3=(empty)
if exist saves\file4\save.ini ( 
	initool.exe /f:saves\file4\save.ini /s:name /k:name >temp
	set /p file4=<temp 
	del /q temp 
) else set file4=(empty)
if exist saves\file5\save.ini ( 
	initool.exe /f:saves\file5\save.ini /s:name /k:name >temp
	set /p file5=<temp 
	del /q temp
) else set file5=(empty)
:loadselect
echo What save file do you want to load?
echo.
echo	1: %file1%
echo	2: %file2%
echo	3: %file3%
echo	4: %file4%
echo	5: %file5%
echo	b: Back to game
echo.
:loadchoice
choice.exe /c:12345b /n "> "
echo.
if %errorlevel%==6 exit /b
if %errorlevel%==0 goto loadchoice
set selectedfile=file%errorlevel%
if exist saves\%selectedfile%\save.ini goto saveexisted
echo That file is empty.
choice.exe /c:yn "Do you want to pick another file?
if %errorlevel%==2 exit /b
if %errorlevel%==1 echo. && goto loadselect
if %errorlevel%==0 exit /b
:saveexisted
choice.exe /c:yn "Load this file?"
echo.
if %errorlevel%==2 exit /b
if %errorlevel%==0 exit /b
echo Loading...
initool.exe /f:saves\file1\save.ini /s:vars /k:facing >temp
set /p facing=<temp
initool.exe /f:saves\file1\save.ini /s:vars /k:room >temp
set /p room=<temp
initool.exe /f:saves\file1\save.ini /s:vars /k:carrottaken >temp
set /p carrottaken=<temp
initool.exe /f:saves\file1\save.ini /s:vars /k:carroteaten >temp
set /p carroteaten=<temp
initool.exe /f:saves\file1\save.ini /s:vars /k:keys >temp
set /p keys=<temp
initool.exe /f:saves\file1\save.ini /s:vars /k:bedlifted >temp
set /p bedlifted=<temp
initool.exe /f:saves\file1\save.ini /s:vars /k:prisoncelldooropen >temp
set /p prisoncelldooropen=<temp
initool.exe /f:saves\file1\save.ini /s:vars /k:prisoncellkeytaken >temp
set /p prisoncellkeytaken=<temp
initool.exe /f:saves\file1\save.ini /s:vars /k:officekeytaken >temp
set /p officekeytaken=<temp
initool.exe /f:saves\file1\save.ini /s:vars /k:dormdooropen >temp
set /p dormdooropen=<temp
initool.exe /f:saves\file1\save.ini /s:vars /k:box1opened >temp
set /p box1opened=<temp
initool.exe /f:saves\file1\save.ini /s:vars /k:box2opened >temp
set /p box2opened=<temp
initool.exe /f:saves\file1\save.ini /s:vars /k:box3opened >temp
set /p box3opened=<temp
initool.exe /f:saves\file1\save.ini /s:vars /k:papertaken >temp
set /p papertaken=<temp
initool.exe /f:saves\file1\save.ini /s:vars /k:hasgreatkey >temp
set /p hasgreatkey=<temp
initool.exe /f:saves\file1\save.ini /s:vars /k:exitopen >temp
set /p exitopen=<temp
initool.exe /f:saves\file1\save.ini /s:vars /k:lockeropen >temp
set /p lockeropen=<temp
initool.exe /f:saves\file1\save.ini /s:vars /k:lockerkeytaken >temp
set /p lockerkeytaken=<temp
initool.exe /f:saves\file1\save.ini /s:vars /k:toiletopen >temp
set /p toiletopen=<temp
initool.exe /f:saves\file1\save.ini /s:vars /k:staffroomdooropen >temp
set /p staffroomdooropen=<temp
initool.exe /f:saves\file1\save.ini /s:vars /k:storageroomdooropen >temp
set /p storageroomdooropen=<temp
initool.exe /f:saves\file1\save.ini /s:vars /k:breakroomkeytaken >temp
set /p breakroomkeytaken=<temp
initool.exe /f:saves\file1\save.ini /s:vars /k:usbtaken >temp
set /p usbtaken=<temp
del /q temp
echo.
echo Loaded.
nircmdc.exe wait 1000
exit /b
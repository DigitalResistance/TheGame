set valid=false
:: template: 
:: if "%action%"=="" set valid=true
if "%action%"=="viewthehelpfileplz" set valid=true
if "%action%"=="save" set valid=true
if "%action%"=="exit" set valid=true
if "%action%"=="suicide" set valid=true
if "%action%"=="eat" set valid=true
if "%action%"=="take" set valid=true
if "%action%"=="look" set valid=true
if "%action%"=="whoami" set valid=true
if "%action%"=="whereami" set valid=true
if "%action%"=="test" set valid=true
if "%action%"=="version" set valid=true
if "%action%"=="kill" set valid=true
if "%action%"=="whenami" set valid=true
if "%action%"=="lookwi" set valid=true
if "%action%"=="!" set valid=true
if "%action%"=="?" set valid=true
if "%action%"=="n" set valid=true
if "%action%"=="s" set valid=true
if "%action%"=="w" set valid=true
if "%action%"=="e" set valid=true
if "%action%"=="u" set valid=true
if "%action%"=="d" set valid=true
if "%action%"=="load" set valid=true
if "%action%"=="clear" set valid=true
if "%action%"=="iwannaseethegamefiles" set valid=true
if "%action%"=="lift" set valid=true
if "%action%"=="open" set valid=true
if "%action%"=="turn" set valid=true
if "%action%"=="bearing" set valid=true
if "%action%"=="keys" set valid=true
if "%action%"=="whoamiwi" set valid=true
if "%action%"=="whereamiwi" set valid=true
if "%action%"=="whenamiwi" set valid=true
if "%action%"=="jump" set valid=true
if "%action%"=="fuck" set valid=true
if "%action%"=="read" set valid=true
if "%action%"=="xyzzy" set valid=true
if "%action%"=="color" set valid=true
if "%action%"=="hi" set valid=true
if "%action%"=="hello" set valid=true
if %valid%==false call responseinvalid.cmd
exit /b
@echo off
:::::::::::::::::::::::::::::::::::::
:: LIST OF MODS
:::::::::::::::::::::::::::::::::::::
:::: CHANGE ModDownload to true
:::: if you wish to download.
:::::::::::::::::::::::::::::::::::::

:::::::::::::::::::::::::::::::::::::
set ModsName[0]="@RHSAFRF"
set Mods[0]=843425103
set ModDownload[0]=true

:::::::::::::::::::::::::::::::::::::
set ModsName[1]="@RHSUSAF"
set Mods[1]=843577117
set ModDownload[1]=true

:::::::::::::::::::::::::::::::::::::
set ModsName[2]="@RHSGREF"
set Mods[2]=843593391
set ModDownload[2]=true

:::::::::::::::::::::::::::::::::::::
set ModsName[3]="@RHSSAF"
set Mods[3]=843632231
set ModDownload[3]=true

:::::::::::::::::::::::::::::::::::::
set ModsName[4]="@AltisArmedForces"
set Mods[4]=1298282761
set ModDownload[4]=true

:::::::::::::::::::::::::::::::::::::
set ModsName[5]="@VcomAI"
set Mods[5]=721359761
set ModDownload[5]=true

:::::::::::::::::::::::::::::::::::::
set ModsName[6]="@ace"
set Mods[6]=463939057
set ModDownload[6]=true

:::::::::::::::::::::::::::::::::::::
set ModsName[7]="@vindicta"
set Mods[7]=1964186045
set ModDownload[7]=true

:::::::::::::::::::::::::::::::::::::
set ModsName[8]="@cba_a3"
set Mods[8]=450814997
set ModDownload[8]=true


:::::::::::::::::::::::::::::::::::::
:::: ALWAYS SET ONE MORE FOR THE LAST
:::::::::::::::::::::::::::::::::::::
set ModsName[9]="SAFE"
set Mods[9]=#
set ModDownload[9]=false

:::::::::::::::::::::::::::::::::::::
:::: LIST OF MODS END ^^^^^^^^^^^^^^^^^^^^
:::::::::::::::::::::::::::::::::::::


echo This Will Install/Update Arma3 Mods
echo.

:: CONFIG OPTIONS

::Path to SteamCMD.exe without trailing \
set "steamcmdpath=C:\Servers\SteamCMD"

::Path to server root Eg: C:\Servers\Arma3 without trailing \
set "serverpath=C:\Servers\arma3"

::Path to Mods download without trailing \
set "modslocation=%steamcmdpath%\steamapps\workshop\content\107410"

:: OPTION 1: ASKING FOR STEAM LOGIN AND PASS

::set /p login=Steam Login: 
::echo.
::set /p pass=Steam Pass: 
::echo.

:: END OPTION 1

:: OPTION 2: Set your steam and pass and save it. (I don't recommend this for security)

set "login="
set "pass="

:: END OPTION 2

:: END CONFIG OPTIONS


set "x=0"

:SymLoop
if defined Mods[%x%] (
	if defined ModDownload[%x%] (
		if defined ModsName[%x%] (

		call set "name=%%ModsName[%x%]%%"
		call set "id=%%Mods[%x%]%%"
		call set "downloads=%%ModDownload[%x%]%%"
			if "%downloads%"=="true" (

			echo Downloading the Mod: %name% - ID: %id%
			echo.
			echo.
			%steamcmdpath%\steamcmd.exe +login %login% %pass% +"workshop_download_item 107410 %id%" +quit
			echo.
			:: Create symlink from download location to server folder
			mklink /D %serverpath%\%name% %modslocation%\%id%
			echo.
			:: Copy bikey file to server's keys folder
			for /r "%modslocation%\%id%" %%a in (*.bikey) do @copy /y %%a "%serverpath%\keys"
			echo.
			)
		set /a "x+=1"
		GOTO :SymLoop
		)
	)
)

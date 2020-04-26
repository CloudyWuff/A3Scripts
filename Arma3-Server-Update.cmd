@echo off
@rem http://media.steampowered.com/installer/steamcmd.zip
SETLOCAL ENABLEDELAYEDEXPANSION

	:: DEFINE the following variables where applicable to your install

	SET STEAMLOGIN=
	SET serverID=233780 -beta

	SET serverPath=C:\Servers\Arma3
		SET STEAMPATH=C:\Servers\SteamCMD

:: _________________________________________________________

echo.
echo     You are about to install/update Arma 3 server
echo        Dir: %serverPath%
echo        Branch: %serverID%
echo.
echo     Key "ENTER" to proceed
pause
%STEAMPATH%\steamcmd.exe +login %STEAMLOGIN% +force_install_dir %serverPath% +"app_update %serverID%" validate +quit
echo .
echo     Your Arma 3 server is now installed / up to date
echo     key "ENTER" to exit
pause

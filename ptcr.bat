@if defined show_commands (@echo on) else (@echo off) && setlocal enableextensions enabledelayedexpansion
for %%A in (/h -h) do if /i "%~1" == "%%A" (
    echo.
    echo Usage / Syntax : ptcr.bat [-H] [/H] ^<Text^> ^<Color^>
	echo Text     : To specify the text to print.
	echo Color    : To specify the color to print.
	echo -H or /H : Displays this help message.
	echo.
	echo Examples :
	echo Example #1 : ptcr.bat Test_123_ABC Green
	echo Example #2 : ptcr.bat "Hello World" Red
	echo.
	echo Example Output :
	echo Example #1 : Will print Test_123_ABC as green.
	echo Example #2 : Will print Hello World as red.
	echo.
	echo Do NOT use ^<^> and [] in the arguments.
	echo ^<^> means required, and [] means optional.
	echo.
	echo Valid colors : 
	echo Black, Dark Blue, Dark Green, Dark Cyan, DarkRed
	echo Dark Magenta, Dark Yellow, Gray, Dark Gray, Blue
	echo Green, Cyan, Red, Magenta, Yellow  White.
	echo When using the dark colors, do not use spaces.
	echo Put the two words together	like this : DarkGray.
	echo.
	echo Infomation :
	echo Created by : Kyle Vu 2017-2019.
    echo Copyright (C) Kyle Vu 2019.
	endlocal && exit /b 0
    )
if not "%~1" == "" set "text=%~1"
if not "%~2" == "" set "color=%~2"
if not defined text (
    echo Error : Missing Text Argument.
	endlocal && exit /b 1
	)
if not defined color (
    echo Error : Missing Color Argument.
	endlocal && exit /b 1
    )
powershell -command "Write-Host !text! -foregroundcolor !color!" 2>nul || (
    echo Error : Invalid Text Or Color Argument.
	endlocal && exit /b 1
	)
endlocal && exit /b 0
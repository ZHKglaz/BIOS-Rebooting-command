@echo off

fltmc >nul 2>&1 || (
    echo Administrator privileges are required.
    PowerShell Start -Verb RunAs '%0' 2> nul || (
        echo Right-click on the script and select "Run as administrator".
        pause & exit 1
    )
    exit 0
)

setlocal EnableExtensions DisableDelayedExpansion

choice /m "Are you sure that you want to reboot to the BIOS?"
if errorlevel 2 (
    echo Canceled by user.
    pause
    exit /b 0
)

shutdown /r /fw /t 0
shutdown -r -fw -t 0

pause

endlocal

exit /b 0

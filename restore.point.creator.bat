@echo off
TITLE zL Resotore's point creator
cd "C:\" >nul 2>&1
mkdir zLRestore >nul 2>&1
cd "C:\zLRestore" >nul 2>&1
mkdir C:\zLRestore\Restore >nul 2>&1
color 06
call :ColorText 06 "                         [ "
call :ColorText F " 1 "
call :ColorText 06 " ] "
call :ColorText F " Backup "
echo.
echo.
echo. The Restore point creator is 2
set /p choice="Select a corresponding number to what you'd like > "
if /i "%choice%"=="2" goto Backup


:Backup
powershell Enable-ComputerRestore -Drive 'C:\', 'D:\', 'E:\', 'F:\', 'G:\' >nul 2>&1
powershell Checkpoint-Computer -Description 'Hone Restore Point' >nul 2>&1
for /F "tokens=2" %%i in ('date /t') do set date=%%i
set date1=%date:/=.%
md C:\zLRestore\Restore\%date1%
reg export HKCU C:\zLRestore\HKLM.reg /y >nul 2>&1 & reg export HKCU C:\zLRestore\%date1%\HKCU.reg /y >nul 2>&1
cls
goto main
@echo off

setlocal enabledelayedexpansion
title Remove Steam uninstall links from Programs and Features

net session >nul 2>&1
if %errorlevel% EQU 0 (
set /a count = 0

for /F "delims=" %%a in ( 'reg query HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall ^| findstr /C:"Steam App"' ) do (
reg delete "%%a" /f >nul
set /a count += 1
)

for /F "delims=" %%a in ( 'reg query HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall ^| findstr /C:"Steam App"' ) do (
reg delete "%%a" /f >nul
set /a count += 1
)

if !count! GTR 0 ( echo !count! item^(s^) removed! ) else ( echo No items removed. )
) else ( echo Missing Administrator Priveleges; right click script and choose 'Run as administrator’. )

pause
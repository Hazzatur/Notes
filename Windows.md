#### Steam game not starting

```
To start, open your Crysis Launch Properties. 

If you have an AMD processor with 8 cores, set the following launch command:

C:\Windows\System32\cmd.exe /C start "" /affinity FE "C:\Program Files (x86)\Steam\steamapps\common\Crysis\Bin32\Crysis.exe" %command%

I have a 6-core AMD (FX 6300), so my command is:
C:\Windows\System32\cmd.exe /C start "" /affinity 3E "C:\Program Files (x86)\Steam\steamapps\common\Crysis\Bin32\Crysis.exe" %command%

If you have a 4 core FX, try this:
C:\Windows\System32\cmd.exe /C start "" /affinity E "C:\Program Files (x86)\Steam\steamapps\common\Crysis\Bin32\Crysis.exe" %command%

Done!
```

### Fix Shorcut Virus

```
attrib -s -r -h /s /d 
```

###  HyperV change ports

```
dism.exe /Online /Disable-Feature:Microsoft-Hyper-V

netsh int ipv4 add excludedportrange protocol=tcp startport=50070 numberofports=1

dism.exe /Online /Enable-Feature:Microsoft-Hyper-V /All
```

### Jetbrains not starting (Needs admin)

```
net stop winnat
net start winnat
```

### Remove US Keyboard

```
Rename-Item -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Keyboard Layouts\00000409" -NewName "00000409.bak" -ErrorAction Ignore;
Rename-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Keyboard Layout\DosKeybCodes" -Name "00000409" -NewName "00000409.bak" -ErrorAction Ignore;
Rename-ItemProperty -Path "Registry::HKEY_LOCAL_MACHINE\SYSTEM\ControlSet002\Control\Keyboard Layout\DosKeybCodes" -Name "00000409" -NewName "00000409.bak" -ErrorAction Ignore;
```

### Remove Steam Games from control panel

```
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
```

#### Clear browsers PS

```
Write-Host -ForegroundColor yellow "#######################################################"
""
Write-Host -ForegroundColor Green "Powershell commands to delete cache & cookies in Firefox, Chrome & IE browsers"
Write-Host -ForegroundColor Green "By Lee Bhogal, Paradise Computing Ltd - June 2014"
Write-Host -ForegroundColor Green "VERSION: 2"
""
Write-Host -ForegroundColor yellow "#######################################################"
""
Write-Host -ForegroundColor Green "CHANGE_LOG:
v2.4: - Resolved *.default issue, issue was with the file path name not with *.default, but issue resolved
v2.3: - Added Cache2 to Mozilla directories but found that *.default is not working
v2.2: - Added Cyan colour to verbose output
v2.1: - Added the location 'C:\Windows\Temp\*' and 'C:\`$recycle.bin\'
v2:   - Changed the retrieval of user list to dir the c:\users folder and export to csv
v1:   - Compiled script"
""
Write-Host -ForegroundColor yellow "#######################################################"
""
#########################
"-------------------"
Write-Host -ForegroundColor Green "SECTION 1: Getting the list of users"
"-------------------"
# Write Information to the screen
Write-Host -ForegroundColor yellow "Exporting the list of users to c:\users\%username%\users.csv"
# List the users in c:\users and export to the local profile for calling later
dir C:\Users | select Name | Export-Csv -Path C:\users\$env:USERNAME\users.csv -NoTypeInformation
$list=Test-Path C:\users\$env:USERNAME\users.csv
""
#########################
"-------------------"
Write-Host -ForegroundColor Green "SECTION 2: Beginning Script..."
"-------------------"
if ($list) {
    "-------------------"
    #Clear Mozilla Firefox Cache
    Write-Host -ForegroundColor Green "SECTION 3: Clearing Mozilla Firefox Caches"
    "-------------------"
    Write-Host -ForegroundColor yellow "Clearing Mozilla caches"
    Write-Host -ForegroundColor cyan
    Import-CSV -Path C:\users\$env:USERNAME\users.csv -Header Name | foreach {
            Remove-Item -path C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\cache\* -Recurse -Force -EA SilentlyContinue -Verbose
            Remove-Item -path C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\cache\*.* -Recurse -Force -EA SilentlyContinue -Verbose
	    Remove-Item -path C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\cache2\entries\*.* -Recurse -Force -EA SilentlyContinue -Verbose
            Remove-Item -path C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\thumbnails\* -Recurse -Force -EA SilentlyContinue -Verbose
            Remove-Item -path C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\cookies.sqlite -Recurse -Force -EA SilentlyContinue -Verbose
            Remove-Item -path C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\webappsstore.sqlite -Recurse -Force -EA SilentlyContinue -Verbose
            Remove-Item -path C:\Users\$($_.Name)\AppData\Local\Mozilla\Firefox\Profiles\*.default\chromeappsstore.sqlite -Recurse -Force -EA SilentlyContinue -Verbose
            }
    Write-Host -ForegroundColor yellow "Clearing Mozilla caches"
    Write-Host -ForegroundColor yellow "Done..."
    ""
    "-------------------"
    # Clear Google Chrome 
    Write-Host -ForegroundColor Green "SECTION 4: Clearing Google Chrome Caches"
    "-------------------"
    Write-Host -ForegroundColor yellow "Clearing Google caches"
    Write-Host -ForegroundColor cyan
    Import-CSV -Path C:\users\$env:USERNAME\users.csv -Header Name | foreach {
            Remove-Item -path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Cache\*" -Recurse -Force -EA SilentlyContinue -Verbose
Remove-Item -path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Cache2\entries\*" -Recurse -Force -EA SilentlyContinue -Verbose
            Remove-Item -path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Cookies" -Recurse -Force -EA SilentlyContinue -Verbose
            Remove-Item -path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Media Cache" -Recurse -Force -EA SilentlyContinue -Verbose
            Remove-Item -path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\Cookies-Journal" -Recurse -Force -EA SilentlyContinue -Verbose
            # Comment out the following line to remove the Chrome Write Font Cache too.
            # Remove-Item -path "C:\Users\$($_.Name)\AppData\Local\Google\Chrome\User Data\Default\ChromeDWriteFontCache" -Recurse -Force -EA SilentlyContinue -Verbose
            }

    Write-Host -ForegroundColor yellow "Done..."
    ""
    "-------------------"
    # Clear Internet Explorer
    Write-Host -ForegroundColor Green "SECTION 5: Clearing Internet Explorer Caches"
     "-------------------"
    Write-Host -ForegroundColor yellow "Clearing Google caches"
    Write-Host -ForegroundColor cyan
    Import-CSV -Path C:\users\$env:USERNAME\users.csv | foreach {
            Remove-Item -path "C:\Users\$($_.Name)\AppData\Local\Microsoft\Windows\Temporary Internet Files\*" -Recurse -Force -EA SilentlyContinue -Verbose
	    Remove-Item -path "C:\Users\$($_.Name)\AppData\Local\Microsoft\Windows\WER\*" -Recurse -Force -EA SilentlyContinue -Verbose
	    Remove-Item -path "C:\Users\$($_.Name)\AppData\Local\Temp\*" -Recurse -Force -EA SilentlyContinue -Verbose
	    Remove-Item -path "C:\Windows\Temp\*" -Recurse -Force -EA SilentlyContinue -Verbose
	    Remove-Item -path "C:\`$recycle.bin\" -Recurse -Force -EA SilentlyContinue -Verbose
            }

    Write-Host -ForegroundColor yellow "Done..."
    ""
    Write-Host -ForegroundColor Green "All Tasks Done!"
    } else {
	Write-Host -ForegroundColor Yellow "Session Cancelled"	
	Exit
	}

```
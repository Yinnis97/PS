# PowerShell Profile Setup

**This guide explains how to create, manage, and customize your PowerShell profile.**   
**It also shows how to redirect the default profile to your own script stored anywhere on your system.**    

## 1. Check Your PowerShell Profile Path

PowerShell always has a default path for your profile, but the file may not exist yet.
```cmd
$PROFILE
```
**This only prints where the file should be not whether it exists.**

## 2. Create the Profile File (If Missing)

Run the following command to create the file and any missing directories:
```cmd
if (!(Test-Path -Path $PROFILE)) {
    New-Item -ItemType File -Path $PROFILE -Force
}
```
Open the profile to edit it:
```cmd
notepad++.exe $PROFILE
``` 

## 3. Redirect to Your Real Profile Script (Recommended)

You may want to keep your actual profile somewhere else (e.g., in a dotfiles folder, Git repo, or synced directory).    
To load your real profile script, dot-source it from the PowerShell profile:    
```ps1
. "C:\user\pathto\yourprofilescript.ps1"
```

- The dot (.) at the start is required
- There must be a space after the dot
- Replace the path with your actual script location

**This makes PowerShell load everything from your custom script every time you open a new session.**    

## 4. Customize Your Actual Profile

**Your external PSProfile.ps1 file can include:**
- aliases     
- functions       
- environment variables       
- git shortcuts       
- custom prompts      
- imported modules        
- anything you want to load on startup        

**Keeping the real config in one file makes it easy to sync across machines.**          




#
**Disclaimer : This is for personal use, but feel free to copy.**
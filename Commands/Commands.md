# Setup

### 1. Create profile powershell file
```cmd	
if (!(Test-Path -Path $PROFILE)) {
    New-Item -ItemType File -Path $PROFILE -Force
}
```
### 2. Add the path to your actual ps1 script to this file
```ps1	
. "C:\user\pathtofile\PSProfile.ps1"
```

# Commands

**Count lines cpp**
```cmd	
(gci -include *.c,*.cpp,*.h -recurse | select-string .).Count	
```	
**Test connection**
```cmd	
tnc "ip"
```	
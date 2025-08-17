
Write-Host "=== System Hardware Information ===" -ForegroundColor Blue


# Hardware Information
$CPU = (Get-CimInstance Win32_Processor).Name
$GPU = (Get-CimInstance Win32_VideoController).Name
$MB = (Get-CimInstance Win32_BaseBoard)
$Ram = Get-CimInstance Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum
$TotRam = [math]::Round($ram.Sum / 1GB,2)
$Drives = Get-CimInstance Win32_DiskDrive
$OS = Get-CimInstance Win32_OperatingSystem

# Console size
$width = $Host.UI.RawUI.WindowSize.Width
$height = $Host.UI.RawUI.WindowSize.Height


# CPU
Write-Host "Processor :         "           -ForegroundColor DarkYellow
Write-Host " -"$CPU                         -ForegroundColor Yellow

# GPU
Write-Host "Graphics Card :     "           -ForegroundColor DarkYellow
$GPU | ForEach-Object { Write-Host " -" $_  -ForegroundColor Yellow}

# Motherboard
Write-Host "Motherboard :      "            -ForegroundColor DarkYellow
Write-Host " -"$MB.Product                  -ForegroundColor Yellow

# Ram
Write-Host "Ram :               "           -ForegroundColor DarkYellow
Write-Host " -"$TotRam"GB"                  -ForegroundColor Yellow

# Drives
Write-Host "Storage Drives :    "           -ForegroundColor DarkYellow
$Drives | ForEach-Object { Write-Host " -" $_.Model "("([math]::Round($_.Size/1GB)) " GB)" -ForegroundColor Yellow} 

# OS
Write-Host "Operating System :  "           -ForegroundColor DarkYellow
Write-Host " -"$os.Caption $os.OSArchitecture -ForegroundColor Yellow


Write-Host "___________________________________" -ForegroundColor Blue
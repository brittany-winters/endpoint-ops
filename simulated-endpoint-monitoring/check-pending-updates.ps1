# check-pending-updates.ps1
# Scans for pending Windows updates and logs results with timestamp

Import-Module PSWindowsUpdate

# Create log directory if it doesn't exist
$logDir = "C:\RMMLogs"
if (!(Test-Path -Path $logDir)) {
    New-Item -ItemType Directory -Path $logDir | Out-Null
}

# Get current time for log file name
$timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$logFile = "$logDir\update-check_$timestamp.txt"

# Run update check and write results
"[$(Get-Date)] Running update check..." | Out-File -FilePath $logFile
Get-WindowsUpdate | Out-File -Append -FilePath $logFile -ForegroundColor Green



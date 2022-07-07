Write-Host 'Setting "Public" Network Connections to "Private"...'
Get-NetConnectionProfile -NetworkCategory "Public" | Set-NetConnectionProfile -NetworkCategory "Private"

Write-Host "Configuring WinRM..."
Invoke-WebRequest -UseBasicParsing -Uri 'https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1' -OutFile $env:TEMP\ConfigureRemoting.ps1
Invoke-Expression -Command "$env:TEMP\ConfigureRemoting.ps1 -CertValidityDays 180 -DisableBasicAuth -Verbose" -ErrorAction Stop
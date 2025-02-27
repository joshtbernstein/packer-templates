Write-Host 'Setting "Public" Network Connections to "Private"...'
Get-NetConnectionProfile -NetworkCategory "Public" | Set-NetConnectionProfile -NetworkCategory "Private"

Write-Host "Configuring WinRM..."
$Cert = New-SelfSignedCertificate -CertstoreLocation Cert:\LocalMachine\My -DnsName "packer"
New-Item -Path WSMan:\LocalHost\Listener -Transport HTTPS -Address * -CertificateThumbPrint $Cert.Thumbprint -Force
New-NetFirewallRule -DisplayName "Windows Remote Management (HTTPS-In)" -LocalPort 5986 -Protocol TCP -Profile Private -Program System -Group "Windows Remote Management"
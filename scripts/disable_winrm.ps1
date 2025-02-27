Remove-NetFirewallRule -DisplayName "Windows Remote Management (HTTPS-In)"
Get-ChildItem -Path WSMan:\Localhost\listener\listener* | Where-Object {$_.Keys -like "*HTTPS*"} | Remove-Item -Recurse
Get-ChildItem -Path Cert:\LocalMachine\My\$thumbprint | Where-Object {$_.Subject -like "CN=packer"} | Remove-Item
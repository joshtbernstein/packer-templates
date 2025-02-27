Powershell.exe -ExecutionPolicy Bypass -File A:\disable_winrm.ps1

IF EXIST a:\unattend.xml (
  %WINDIR%\system32\sysprep\sysprep.exe /generalize /oobe /shutdown /quiet /unattend:a:\unattend.xml
) else (
  %WINDIR%\system32\sysprep\sysprep.exe /generalize /oobe /shutdown /quiet  
)
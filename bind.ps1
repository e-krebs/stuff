# prerequitsite: posh-git must be installed, cf. install.ps1
$InstallPath = "$env:USERPROFILE\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
if (Test-Path $InstallPath) {
  Remove-Item $InstallPath
}
New-Item -ItemType SymbolicLink -Path $InstallPath -Target ".\windows\Microsoft.PowerShell_profile.ps1"

# prerequitsite: none
$InstallPath = "$env:USERPROFILE\Documents\WindowsPowerShell\profile.ps1"
if (Test-Path $InstallPath) {
  Remove-Item $InstallPath
}
New-Item -ItemType SymbolicLink -Path $InstallPath -Target ".\windows\profile.ps1"

# prerequitsite: Windows Terminal must be installed from the [Microsoft Store](https://aka.ms/terminal)
$InstallPath = "$env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
if (Test-Path $InstallPath) {
  Remove-Item $InstallPath
}
New-Item -ItemType SymbolicLink -Path $InstallPath -Target ".\windows\settings.json"

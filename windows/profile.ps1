function cdp() {
  Set-Location C:\Projects
  Get-ChildItem
}

if ((Convert-Path .) -eq $env:USERPROFILE) {
  cdp
}

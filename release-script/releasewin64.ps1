
Get-ChildItem * -exclude *.ps1 | Remove-Item -Force -Recurse
.\..\release-script\getqusb2snes.ps1
.\..\release-script\usb2snes.ps1
.\..\release-script\savestate2snes.ps1
.\..\release-script\magic2snes.ps1
.\..\release-script\buttonmash.ps1
.\..\release-script\poptracker.ps1
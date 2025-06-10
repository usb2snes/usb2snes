. ./../release-script/common.ps1

[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"
Invoke-WebRequest -Uri  "https://github.com/RedGuyyyy/sd2snes/releases/download/usb2snes_v11/usb2snes_v11.zip" -OutFile "usb2snes.zip"

iex @'
& "$7z" x usb2snes.zip
'@


Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Skarsnik/QUsb2snes/master/ui/icons/legacy.png" -OutFile "legacy.png"


Copy-Item usb2snes_v11\apps\MemoryViewer -Destination .\QUsb2Snes\apps\MemoryViewer -Recurse

Copy-Item legacy.png .\QUsb2Snes\apps\MemoryViewer\icone.png


. ./../release-script/common.ps1

[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"
Invoke-WebRequest -Uri  "https://github.com/RedGuyyyy/sd2snes/releases/download/usb2snes_v9/usb2snes_v9.zip" -OutFile "usb2snes.zip"

iex @'
& "$7z" x usb2snes.zip
'@

# Redguyy removed the zeldahub app in v9
Invoke-WebRequest -Uri  "https://github.com/RedGuyyyy/sd2snes/releases/download/v7/usb2snes_v7.zip" -OutFile "usb2snes7.zip"
iex @'
& "$7z" x usb2snes7.zip
'@


Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Skarsnik/QUsb2snes/master/legacy.png" -OutFile "legacy.png"

mkdir -Path .\QUsb2Snes\FIRMWARE
Copy-Item usb2snes_v9/sd2snes/ -Destination .\QUsb2Snes\FIRMWARE -Recurse
Copy-Item usb2snes_v9/win7_driver/ -Destination .\QUsb2Snes\FIRMWARE -Recurse


#Probably remove this when Button Mash is ready
Copy-Item usb2snes_v9\apps\InputViewer -Destination .\QUsb2Snes\apps\InputViewer -Recurse

Copy-Item usb2snes_v9\apps\MemoryViewer -Destination .\QUsb2Snes\apps\MemoryViewer -Recurse

Copy-Item usb2snes_v7\apps\ZeldaHUD -Destination .\QUsb2Snes\apps\ZeldaHUD -Recurse


Copy-Item legacy.png .\QUsb2Snes\apps\MemoryViewer\icone.png
Copy-Item legacy.png .\QUsb2Snes\apps\InputViewer\icone.png


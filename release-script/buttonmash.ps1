. ./../release-script/common.ps1

$github_base_url = "https://github.com/Skarsnik/Button-Mash/releases/download/"
$release = "beta20"
$url = "$github_base_url/$release/Button.Mash-$release-win32-x64.7z"

[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"
Invoke-WebRequest -Uri $url -OutFile "ButtonMash.7z"

Invoke-WebRequest -Uri "https://github.com/Skarsnik/Button-Mash/raw/master/icone.png" -OutFile "bmicone.png"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Skarsnik/Button-Mash/master/qusb2snesapp.json" -OutFile bm.json


cd .\QUsb2Snes\apps\

iex @'
& "$7z" x ..\..\ButtonMash.7z
'@

cd ..\..\

copy bmicone.png "QUsb2Snes\apps\Button Mash-$release\icone.png"
copy bm.json "QUsb2Snes\apps\Button Mash-$release\qusb2snesapp.json"


. ./../release-script/common.ps1

$github_base_url = "https://github.com/Skarsnik/Button-Mash/releases/download/"
$release = "beta4"
$url = "$github_base_url/$release/Button-Mash-$release.7z"

[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"
Invoke-WebRequest -Uri $url -OutFile "ButtonMash.7z"

Invoke-WebRequest -Uri "https://github.com/Skarsnik/Button-Mash/raw/master/icone.png" -OutFile "bmicone.png"
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/Skarsnik/Button-Mash/master/qusb2snesapp.json" -OutFile bm.json

## TODO : When Qusb2snes switch to qt5.15 need to not copy everything

cd .\QUsb2Snes\apps\

iex @'
& "$7z" x ..\..\ButtonMash.7z
'@

cd ..\..\

copy bmicone.png QUsb2Snes\apps\Button-Mash\icone.png
copy bm.json QUsb2Snes\apps\Button-Mash\qusb2snesapp.json


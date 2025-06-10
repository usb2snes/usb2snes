. ./../release-script/common.ps1
$github_base_url = "https://github.com/Factor-64/RA2Snes/releases/download/"
$release_gh = "v1.1.1"

#https://github.com/Factor-64/RA2Snes/releases/download/v1.1.1/RA2Snes-windows-x64.zip
$url = [string]::Format('{0}{1}/RA2Snes-windows-x64.zip', $github_base_url, $release_gh)
echo $url
[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"
Invoke-WebRequest -Uri $url -OutFile "RA2Snes.zip"

Invoke-WebRequest -Uri https://raw.githubusercontent.com/Factor-64/RA2Snes/refs/heads/master/ui/images/icon64x64.png -OutFile "ra2snesicon.png"


cd .\QUsb2Snes\apps\

iex @'
& "$7z" x ..\..\RA2Snes.zip -oRA2Snes
'@

cd ..\..\

copy -Force ra2snesicon.png QUsb2Snes\apps\RA2Snes\icone.png
copy ra2snes.json QUsb2Snes\apps\RA2Snes\qusb2snesapp.json
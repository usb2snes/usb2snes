. ./../release-script/common.ps1

$github_base_url = "https://github.com/Skarsnik/Savestate2Snes/releases/download/"
$release = "0.8.1"
$url = "$github_base_url/v$release/Savestate2snes-v$release.7z"

[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"
Invoke-WebRequest -Uri $url -OutFile "Savestate2Snes.7z"

cd .\QUsb2Snes\apps\

iex @'
& "$7z" x ..\..\Savestate2Snes.7z
'@

cd ..\..\

copy -Force qusb2snesapp.json QUsb2Snes\apps\Savestate2Snes

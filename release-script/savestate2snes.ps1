. ./../release-script/common.ps1

$github_base_url = "https://github.com/Skarsnik/Savestate2Snes/releases/download/"
$release = "0.9"
$url = "$github_base_url/v$release/Savestate2Snes-v$release-win32-x64.7z"

[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"
Invoke-WebRequest -Uri $url -OutFile "Savestate2Snes.7z"

cd .\QUsb2Snes\apps\

iex @'
& "$7z" x ..\..\Savestate2Snes.7z
'@

cd ..\..\

copy -Force savestate2snes.json QUsb2Snes\apps\Savestate2Snes-v$release\qusb2snesapp.json

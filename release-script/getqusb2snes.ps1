. ./../release-script/common.ps1

$qusb2snes_base_url = "https://github.com/Skarsnik/QUsb2snes/releases/download/"
$qusb2snes_release = "0.7.2"
$url = "$qusb2snes_base_url/v$qusb2snes_release/QUsb2Snes-v$qusb2snes_release.7z"

[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"
Invoke-WebRequest -Uri $url -OutFile "QUsb2Snes.7z"

iex @'
& "$7z" x QUsb2Snes.7z
'@



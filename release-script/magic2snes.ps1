. ./../release-script/common.ps1

$github_base_url = "https://github.com/Skarsnik/Magic2Snes/releases/download/"
$release = "beta3"
$url = "$github_base_url/$release/Magic2Snes-$release.7z"

[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"
Invoke-WebRequest -Uri $url -OutFile "Magic2Snes.7z"

cd .\QUsb2Snes\
iex @'
& "$7z" x ..\Magic2Snes.7z
'@

cd ..\
# Need to remove this on next magic2snes release I guess
del QUsb2Snes\Magic2Snes\vc_redist.x64.exe
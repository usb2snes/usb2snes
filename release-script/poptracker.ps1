. ./../release-script/common.ps1
$github_base_url = "https://github.com/black-sliver/PopTracker/releases/download/"
$release_str = "0-21-0"
$release_gh = "v0.21.0"
$url = [string]::Format('{0}/{1}/PopTracker_{2}_win64.zip', $github_base_url, $release_gh, $release_str)
echo $url
[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"
Invoke-WebRequest -Uri $url -OutFile "PopTracker.zip"


## TODO : When Qusb2snes switch to qt5.15 need to not copy everything

cd .\QUsb2Snes\

iex @'
& "$7z" x ..\PopTracker.zip
'@

cd ..\



$runningDirectory = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition

wsl -d ubuntu -- /etc/init.d/smbd start
$wslIpAddr = wsl -d ubuntu -- ip addr
Write-Host "Raw output of ip addr"
Write-Host $wslIpAddr

$match = [System.Text.RegularExpressions.Regex]::Match($wslIpAddr, "(?<ip>172\.[\d\.]*)\/")

Write-Host "match to find ip address."
Write-Host $match
$ip = $match.Groups["ip"]
Write-Host "Ip of wsl ubuntu machine is $ip"

#$credentials = Get-Credential
#Write-Host "Credentials entered"
#Write-Host $credentials
Start-Process -FilePath Powershell -Verb RunAs  -ArgumentList '-File', "$runningDirectory\ChangeHostFile.ps1", '-ip', $ip



Param
(
    [string] $ip
)

whoami
$hostfile = Get-Content "c:\windows\system32\drivers\etc\hosts" -Encoding UTF8 -Raw
$replaced = [System.Text.RegularExpressions.Regex]::Replace($hostfile, "(?<ip>172\.[\d\.]*).*ubuntuwsl", "$ip  ubuntuwsl") 
Write-Host "Replace is " + $replaced.GetType()
Write-Host ""
Write-Host ""
Write-Host "About to replace wsl ip with $ip"
Write-Host "---------------------------REPLACED FILE ---------------------------"
write-host $replaced

Start-Sleep -Seconds 4
$replaced | Set-Content -Path "c:\windows\system32\drivers\etc\hosts" 
Pause
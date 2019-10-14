$features = (
  "Web-Default-Doc", 
  "Web-Dir-Browsing", 
  "Web-Http-Errors", 
  "Web-Static-Content", 
  "Web-Http-Redirect", 
  "Web-Http-Logging",
  "Web-Stat-Compression", 
  "Web-Dyn-Compression", 
  "Web-Filtering", 
  "Web-Basic-Auth", 
  "Web-Net-Ext", 
  "Web-Net-Ext45", 
  "Web-Asp-Net", 
  "Web-Asp-Net45",
  "Web-CGI", 
  "Web-ISAPI-Ext", 
  "Web-ISAPI-Filter", 
  "Web-Mgmt-Console",
  "Web-Ftp-Server", 
  "Web-Ftp-Service"
)

# Install windows features
Install-WindowsFeature -Name $features

# Validate Windows Features
$status = Get-WindowsFeature -Name $features | where {$_.Installed -eq "True"} | select Name -ExpandProperty Name
if($status){
  $errors += "Windows features did not install: $status"
}

<#
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Set-ExecutionPolicy Bypass -Scope Process -Force
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

choco install webpicmd -y
refreshenv
WebPICMD.exe /Install /Products:php

$bucketName = "${s3-bucket-name}"
$rootFolder = "c:\revise"
$s3Folder = "$rootFolder\s3"
$s3LogFile = "$s3Folder\s3sync.log"
$webContentFolder = "$rootFolder\web"

mkdir $rootFolder
mkdir $s3Folder
mkdir $webContentFolder

### SET FOLDER TO WATCH + FILES TO WATCH + SUBFOLDERS YES/NO
$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = "$webContentFolder"
$watcher.Filter = "*.*"
$watcher.IncludeSubdirectories = $true
$watcher.EnableRaisingEvents = $true  

### DEFINE ACTIONS AFTER AN EVENT IS DETECTED
$action = { $path = $Event.SourceEventArgs.FullPath
            $changeType = $Event.SourceEventArgs.ChangeType
            $logline = "$(Get-Date), $changeType, $path"
            Add-content "$s3LogFile" -value $logline
            aws s3 sync "$webContentFolder" "s3://$bucketName"
          }    
### DECIDE WHICH EVENTS SHOULD BE WATCHED 
Register-ObjectEvent $watcher "Created" -Action $action
Register-ObjectEvent $watcher "Changed" -Action $action
Register-ObjectEvent $watcher "Deleted" -Action $action
Register-ObjectEvent $watcher "Renamed" -Action $action
while ($true) {sleep 5}
#>
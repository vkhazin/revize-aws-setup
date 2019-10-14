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

# choco install urlrewrite -y
# choco install php -y
# Web Server Image Creator

## Overview

Using a vanilla instance of Windows Server 2016 Base deployed on AWS installs and configures required components, registers VB dll's, .Net components, and configures IIS Default web site

## Web Server Setup

1. Provision a new instance of Windows Server 2016 Base
1. Login into the new instance using Rdp and Administrator account
1. Open powershell as an **Administrator**
1. Execute the following statements:
```
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Set-ExecutionPolicy Bypass -Scope Process -Force

# Install Chocolately
# TBD: iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Create folder
mkdir C:\revize

```
1. Copy content of ./setup.ps1 to C:\revize\setup.ps1
1. Execute the script: `& C:\revize\setup.ps1`
1. Open IIS Admin, install Web Platform Installer and Php support for IIS Server

## Custom AMI Image

1. Create custom AMI Image for automated deployment and auto-scaling group: https://aws.amazon.com/premiumsupport/knowledge-center/sysprep-create-install-ec2-windows-amis/
1. Create an AMI from the shut-down instance
1. Note the AMI id to use in the terraform automated setup
1. Repeat the process whenever a new version of the web site or system components is released

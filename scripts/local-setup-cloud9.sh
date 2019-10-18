#!/bin/bash
set -e
source ./envs/global.sh

# Download and install dependencies
echo 'Installing system dependencies...'

# Install Terraform
curl "https://releases.hashicorp.com/terraform/$terraform_version/terraform_${terraform_version}_linux_amd64.zip" -o terraform.zip
sudo unzip -o terraform.zip -d $terraform_install_dir
rm -f ./terraform*.zip
${terraform_install_dir}/terraform version

aws configure
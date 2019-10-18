#!/bin/bash
set -e
source ./envs/global.sh

# Download and install dependencies
echo 'Installing system dependencies...'

# Install Terraform
curl "https://releases.hashicorp.com/terraform/$terraform_version/terraform_${terraform_version}_linux_amd64.zip" -o terraform_${terraform_version}_darwin_amd64.zip
sudo unzip -o terraform_${terraform_version}_darwin_amd64.zip -d $terraform_install_dir
rm -f ./terraform_*.zip
${terraform_install_dir}/terraform version

aws configure
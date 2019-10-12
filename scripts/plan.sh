#!/bin/bash
set -e
source ./scripts/tf-common.sh "$@"
${terraform_install_dir}/terraform plan
echo "Done!"
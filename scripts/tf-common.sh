#!/bin/bash
set -e

if [ $# -eq 0 ]
  then
    echo "Deployment Environment argument is required"
    exit
fi

PROJECT_CONFIG=./envs/$1.sh
if ! [ -e ${PROJECT_CONFIG} ]
  then
    echo "Project configuration ${PROJECT_CONFIG} was not found"
    exit
fi

###############################################################################
# Deleting local state before applying
###############################################################################
rm -rf ./$1/.terraform || true

###############################################################################
# Configure variables
###############################################################################
source ${PROJECT_CONFIG}

###############################################################################
# Configure remote state
###############################################################################
cp -f ./remote-state.template ./remote-state.tf
sed -i -e "s/{TF_STATE_BUCKET_NAME}/${TF_STATE_BUCKET_NAME}/g" ./remote-state.tf
sed -i -e "s/{TF_VAR_PROJECT_NAME}/${TF_VAR_TAG_ENV}/g" ./remote-state.tf
sed -i -e "s/{TF_VAR_REGION}/${TF_VAR_REGION}/g" ./remote-state.tf
###############################################################################

${terraform_install_dir}/terraform init 
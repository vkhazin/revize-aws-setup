source ./envs/global.sh

export TF_VAR_TAG_ENV_NAME="dev"
export TF_VAR_TAG_DEPLOYMENT_PREFIX="${TF_VAR_TAG_CUSTOMER_NAME}-${TF_VAR_TAG_ENV_NAME}"
export TF_VAR_PROTECTED_LB="false"
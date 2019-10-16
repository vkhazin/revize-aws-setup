###############################################################################
# Non-automated artifacts
###############################################################################
export TF_STATE_BUCKET_NAME="ics-revize-terraform-state"
export TF_VAR_KEYPAIR_NAME="vkhazin"

###############################################################################
# Common to all projects
###############################################################################
export terraform_version=0.12.10
export terraform_install_dir="$(pwd)/bin"
export TF_VAR_TAG_CUSTOMER_NAME="revize"
export TF_VAR_REGION="us-east-2"
export TF_VAR_ZONES="us-east-2a,us-east-2b"
export TF_VAR_VPC_CIDR_BLOCK="10.0.0.0/22"
export TF_VAR_WEB_SERVER_AMI="ami-095d9f758e4d82b06" #"ami-04203dd87d4abd6f6"
export TF_VAR_WEB_SERVER_INSTANCE_TYPE="t2.medium"

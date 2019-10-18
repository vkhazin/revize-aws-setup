###############################################################################
# Non-automated artifacts
###############################################################################
export TF_STATE_BUCKET_NAME="ics-revize-terraform-state"
export TF_VAR_KEYPAIR_NAME="vkhazin"

###############################################################################
# Common to all envs
###############################################################################
export terraform_version=0.12.10
export terraform_install_dir="$(pwd)/bin"
export TF_VAR_TAG_CUSTOMER_NAME="revize"
export TF_VAR_REGION="us-east-2"
export TF_VAR_ZONES="us-east-2a,us-east-2b"
export TF_VAR_VPC_CIDR_BLOCK="10.0.0.0/22"
export TF_VAR_WEB_SERVER_AMI="ami-053a0f4963d02907f" #"ami-04203dd87d4abd6f6" - vanilla winsrv2019
export TF_VAR_WEB_SERVER_INSTANCE_TYPE="t2.medium"
export TF_VAR_PROTECT_LB_FROM_DELETE="true"
export TF_VAR_WEBCONTENT_FOLDER="C:\Revize\Web"
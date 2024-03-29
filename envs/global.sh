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
export TF_VAR_WEB_SERVER_AMI="ami-0ed191530f8c89b21"
export TF_VAR_WEB_SERVER_INSTANCE_TYPE="t2.micro"
export TF_VAR_WEB_SERVER_VOLUME_SIZE="30"
export TF_VAR_PROTECT_FROM_DELETE="true"
export TF_VAR_WEBCONTENT_FOLDER="C:\Revize\Web"
export TF_VAR_SCRIPTS_FOLDER="C:\Revize\Scripts"
export TF_VAR_DLM_SNAPSHOTS_TO_RETAIN="30"
export TF_VAR_DLM_SNAPSHOTS_INTERVAL="24"
###############################################################################
# Input
###############################################################################
variable "TAG_ENV_NAME"                         {}
variable "TAG_CUSTOMER_NAME"                    {}
variable "TAG_DEPLOYMENT_PREFIX"                {}

variable "REGION"                               {}
variable "ZONES"                                {}
variable "VPC_CIDR_BLOCK"                       {}
variable "WEB_SERVER_AMI"                       {}
variable "WEB_SERVER_INSTANCE_TYPE"             {}
variable "KEYPAIR_NAME"                         {}
variable "PROTECTED_LB"                         {}
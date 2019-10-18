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
variable "PROTECT_LB_FROM_DELETE"               {}
variable "WEBCONTENT_FOLDER"                    {}

###############################################################################
# Local
###############################################################################
locals {
  public-subnets        = "${aws_subnet.public-subnet}"
}

###############################################################################
# Output
###############################################################################
output "WEB_SERVER_PRIMARY_INSTANCE_ID" {
  value = "${aws_instance.web-server-primary.*.id}"
}
output "WEB_SERVER_FAILOVER_INSTANCE_ID" {
  value = "${aws_instance.web-server-failover.*.id}"
}
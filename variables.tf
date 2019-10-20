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
variable "WEB_SERVER_VOLUME_SIZE"               {}
variable "KEYPAIR_NAME"                         {}
variable "PROTECT_FROM_DELETE"                  {}
variable "WEBCONTENT_FOLDER"                    {}
variable "DLM_SNAPSHOTS_TO_RETAIN"              {}
variable "DLM_SNAPSHOTS_INTERVAL"               {}

###############################################################################
# Local
###############################################################################
locals {
  awsZones      = "${split(",", var.ZONES)}"
  azCount       = "${length(local.awsZones)}"  
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
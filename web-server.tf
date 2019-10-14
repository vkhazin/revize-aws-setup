# locals {
#   public-subnets        = "${aws_subnet.public-subnet}"
# }

# # data "template_file" "user-data" {
# #   template = "${file("./web-server-user-data.ps1")}"
# #   vars {
# #     s3-bucket-name = "${var.s3-bucket-name}"
# #   }
# # }

# resource "aws_instance" "web-server" {
#   count                         = "${length(aws_subnet.public-subnet)}"
#   ami                           = "${var.WEB_SERVER_AMI}"
#   instance_type                 = "${var.WEB_SERVER_INSTANCE_TYPE}"
#   key_name                      = "${var.KEYPAIR_NAME}"
#   subnet_id                     = "${element(local.awsZones, count.index)}"
#   associate_public_ip_address   = true
#   security_groups               = ["${aws_security_group.web-server-sg}"]
#   iam_instance_profile          = "${aws_iam_instance_profile.ec2-instance-profile}"
#   # user_data                     = "${data.template_file.user-data.rendered}"
    
#   tags = {
#     # Name = "${var.TAG_DEPLOYMENT_PREFIX}-sn-public-${element(local.awsZones, count.index)}"
#     Name                        = "${var.TAG_DEPLOYMENT_PREFIX}-web-server"
#     Organization                = "${var.TAG_CUSTOMER_NAME}"
#     Project                     = "${var.TAG_ENV_NAME}"  
#   }
# }
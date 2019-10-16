locals {
  public-subnets        = "${aws_subnet.public-subnet}"
}

resource "aws_instance" "web-server" {
  ami                           = "${var.WEB_SERVER_AMI}"
  instance_type                 = "${var.WEB_SERVER_INSTANCE_TYPE}"
  key_name                      = "${var.KEYPAIR_NAME}"
  subnet_id                     = "${aws_subnet.public-subnet[0].id}"
  associate_public_ip_address   = true
  security_groups               = ["${aws_security_group.web-server-sg.id}"]
  iam_instance_profile          = "${aws_iam_instance_profile.ec2-instance-profile.name}"
    
  tags = {
    Name                        = "${var.TAG_DEPLOYMENT_PREFIX}-web-server"
    Organization                = "${var.TAG_CUSTOMER_NAME}"
    Project                     = "${var.TAG_ENV_NAME}"  
  }
}
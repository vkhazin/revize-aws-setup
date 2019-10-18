data "template_file" "web-server-primary-user-data" {
  template = <<EOF
    <powershell>
      ${file("./web-server/awscli-configure.ps1")}
      Enable-ScheduledTask -TaskName awscli-sync-to-bucket
    </powershell>
  EOF

  vars = {
    aws_access_key_id           = "${aws_iam_access_key.s3-content-user-key.id}"
    aws_secret_access_key       = "${aws_iam_access_key.s3-content-user-key.secret}"
    aws_region                  = "${var.REGION}"
  }
}
resource "aws_instance" "web-server-primary" {
  ami                           = "${var.WEB_SERVER_AMI}"
  instance_type                 = "${var.WEB_SERVER_INSTANCE_TYPE}"
  key_name                      = "${var.KEYPAIR_NAME}"
  subnet_id                     = "${aws_subnet.public-subnet[0].id}"
  associate_public_ip_address   = true
  security_groups               = ["${aws_security_group.web-server-sg.id}"]
  user_data                     = "${data.template_file.web-server-primary-user-data.rendered}"
    
  tags = {
    Name                        = "${var.TAG_DEPLOYMENT_PREFIX}-web-server-primary"
    Organization                = "${var.TAG_CUSTOMER_NAME}"
    Project                     = "${var.TAG_ENV_NAME}"  
  }
}
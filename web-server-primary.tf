data "template_file" "web-server-primary-user-data" {
  template = <<EOF
    <powershell>
      ${file("./web-server/ec2-configure.ps1")}
    </powershell>
  EOF

  vars = {
    aws_access_key_id           = "${aws_iam_access_key.s3-webserver-content-user-key.id}"
    aws_secret_access_key       = "${aws_iam_access_key.s3-webserver-content-user-key.secret}"
    aws_region                  = "${var.REGION}"
    webcontent_folder           = "${var.WEBCONTENT_FOLDER}"
    webcontent_bucket           = "${aws_s3_bucket.s3-webserver-content.id}"
    scheduled_task_name         = "awscli-sync-to-bucket"
    stop_iis                    = "false"
  }
}
resource "aws_instance" "web-server-primary" {
  ami                           = "${var.WEB_SERVER_AMI}"
  instance_type                 = "${var.WEB_SERVER_INSTANCE_TYPE}"
  key_name                      = "${var.KEYPAIR_NAME}"
  subnet_id                     = "${aws_subnet.public-subnet[0].id}"
  associate_public_ip_address   = true
  security_groups               = ["${aws_security_group.web-server-sg.id}"]
  # https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/ec2-windows-user-data.html
  # Log file: C:\ProgramData\Amazon\EC2-Windows\Launch\Log\UserdataExecution.log
  user_data                     = "${data.template_file.web-server-primary-user-data.rendered}"
    
  tags = {
    Name                        = "${var.TAG_DEPLOYMENT_PREFIX}-web-server-primary"
    Organization                = "${var.TAG_CUSTOMER_NAME}"
    Project                     = "${var.TAG_ENV_NAME}"  
  }
}
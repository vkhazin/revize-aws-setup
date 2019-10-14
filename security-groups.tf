resource "aws_security_group" "web-server-sg" {
  vpc_id      = "${aws_vpc.vpc.id}"
  name        = "${var.TAG_DEPLOYMENT_PREFIX}-web-server-sg"
  description = "Selected inbound traffic"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
   ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 23
    to_port     = 23
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 
  
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  
  tags = {
    Name = "${var.TAG_DEPLOYMENT_PREFIX}-web-server-sg"
    Organization = "${var.TAG_CUSTOMER_NAME}"
    Environment = "${var.TAG_ENV_NAME}"
  }
}
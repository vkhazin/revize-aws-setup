resource "aws_s3_bucket" "s3-webserver-content" {
  bucket                = "${var.TAG_CUSTOMER_NAME}-${var.TAG_ENV_NAME}-webserver-content"
  acl                   = "private"

  tags = {
    Name                = "${var.TAG_CUSTOMER_NAME}-${var.TAG_ENV_NAME}-content"
    Organization        = "${var.TAG_CUSTOMER_NAME}"
    Environment         = "${var.TAG_ENV_NAME}"
  }
}

resource "aws_s3_bucket" "s3-webserver-snapshots" {
  bucket                = "${var.TAG_CUSTOMER_NAME}-${var.TAG_ENV_NAME}-webserver-snapshots"
  acl                   = "private"

  tags = {
    Name                = "${var.TAG_CUSTOMER_NAME}-${var.TAG_ENV_NAME}-snapshots"
    Organization        = "${var.TAG_CUSTOMER_NAME}"
    Environment         = "${var.TAG_ENV_NAME}"
  }
}
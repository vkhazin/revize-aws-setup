resource "aws_s3_bucket" "s3-content" {
  bucket                = "${var.TAG_CUSTOMER_NAME}-${var.TAG_ENV_NAME}-content"
  acl                   = "private"

  tags = {
    Name                = "${var.TAG_CUSTOMER_NAME}-${var.TAG_ENV_NAME}-content"
    Organization        = "${var.TAG_CUSTOMER_NAME}"
    Environment         = "${var.TAG_ENV_NAME}"
  }
}

resource "aws_s3_bucket" "s3-snapshots" {
  bucket                = "${var.TAG_CUSTOMER_NAME}-${var.TAG_ENV_NAME}-snapshots"
  acl                   = "private"

  tags = {
    Name                = "${var.TAG_CUSTOMER_NAME}-${var.TAG_ENV_NAME}-snapshots"
    Organization        = "${var.TAG_CUSTOMER_NAME}"
    Environment         = "${var.TAG_ENV_NAME}"
  }
}
resource "aws_iam_user" "s3-webserver-content-user" {
  name = "${var.TAG_DEPLOYMENT_PREFIX}-s3-webserver-content-user"
  path = "/"

  tags = {
    Name                = "${var.TAG_CUSTOMER_NAME}-${var.TAG_ENV_NAME}-s3-webserver-content-user"
    Organization        = "${var.TAG_CUSTOMER_NAME}"
    Environment         = "${var.TAG_ENV_NAME}"
  }
}

resource "aws_iam_access_key" "s3-webserver-content-user-key" {
  user = "${aws_iam_user.s3-webserver-content-user.name}"
}

resource "aws_iam_policy" "s3-webserver-content-user-policy" {
  name        = "${var.TAG_CUSTOMER_NAME}-${var.TAG_ENV_NAME}-s3-webserver-content-user-policy"
  policy      = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:ListBucket",
        "s3:PutObject",
        "s3:DeleteObject"
      ],
      "Resource": [
          "arn:aws:s3:::*/*",
          "${aws_s3_bucket.s3-webserver-content.arn}",
          "${aws_s3_bucket.s3-iisconfig.arn}"
      ]      
    }
  ]
}
EOF
}

resource "aws_iam_user_policy_attachment" "s3-webserver-content-user-policy-attachment" {
  user       = "${aws_iam_user.s3-webserver-content-user.name}"
  policy_arn = "${aws_iam_policy.s3-webserver-content-user-policy.arn}"
}

resource "aws_iam_role" "dlm_lifecycle_role" {
  name = "dlm-lifecycle-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "dlm.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}
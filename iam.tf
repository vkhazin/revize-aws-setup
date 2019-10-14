resource "aws_iam_instance_profile" "ec2-instance-profile" {
  name  = "${var.TAG_DEPLOYMENT_PREFIX}-ec2-instance-profile"
  role  = "${aws_iam_role.ec2-role.name}"
}

resource "aws_iam_policy" "ec2-role-policy" {
  name        = "${var.TAG_DEPLOYMENT_PREFIX}-ec2-s3-policy"
  path        = "/"

  policy = <<EOF
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
        "${aws_s3_bucket.s3-content.arn}*"
      ]
    }
  ]
}
EOF
}

resource "aws_iam_role" "ec2-role" {
  name               = "${var.TAG_DEPLOYMENT_PREFIX}-ec2-role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "ec2-role-attachment" {
  name          = "${var.TAG_DEPLOYMENT_PREFIX}-ec2-role-attachment"
  roles         = ["${aws_iam_role.ec2-role.name}"]
  policy_arn    = "${aws_iam_policy.ec2-role-policy.arn}"
}
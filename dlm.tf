resource "aws_iam_role_policy" "dlm_lifecycle" {
  name = "dlm-lifecycle-policy"
  role = "${aws_iam_role.dlm_lifecycle_role.id}"

  policy = <<EOF
{
   "Version": "2012-10-17",
   "Statement": [
      {
         "Effect": "Allow",
         "Action": [
            "ec2:CreateSnapshot",
            "ec2:DeleteSnapshot",
            "ec2:DescribeVolumes",
            "ec2:DescribeSnapshots"
         ],
         "Resource": "*"
      },
      {
         "Effect": "Allow",
         "Action": [
            "ec2:CreateTags"
         ],
         "Resource": "arn:aws:ec2:*::snapshot/*"
      }
   ]
}
EOF
}

resource "aws_dlm_lifecycle_policy" "dlm_policy" {
  description        = "Web Server Automated Snapshots"
  execution_role_arn = "${aws_iam_role.dlm_lifecycle_role.arn}"
  state              = "ENABLED"

  policy_details {
    resource_types = ["VOLUME"]

    schedule {
      name = "Daily snapshots"

      create_rule {
        interval      = "${var.DLM_SNAPSHOTS_INTERVAL}"
        interval_unit = "HOURS"
      }

      retain_rule {
        count = "${var.DLM_SNAPSHOTS_TO_RETAIN}"
      }

      tags_to_add = {
        Organization                = "${var.TAG_CUSTOMER_NAME}"
        Project                     = "${var.TAG_ENV_NAME}"       
      }

      copy_tags = true      
    
    }

    target_tags = {
      Name                          = "${var.TAG_DEPLOYMENT_PREFIX}-web-server-primary-volume"
    }      
  }
}
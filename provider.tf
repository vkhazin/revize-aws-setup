provider "aws" {
  region            = "${var.REGION}"
  max_retries       = 3
}
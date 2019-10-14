provider "aws" {
  region            = "${var.REGION}"
  version           = "~> 2.32"
  max_retries       = 3
}

provider "template" {
  version           = "~> 2.1"
}
resource "aws_vpc" "vpc" {
  cidr_block                  = "${var.VPC_CIDR_BLOCK}" 
  enable_dns_hostnames        = "true"
  tags = {
    Name                      = "${var.TAG_DEPLOYMENT_PREFIX}-vpc"
    Organization              = "${var.TAG_CUSTOMER_NAME}"
    Project                   = "${var.TAG_ENV_NAME}"
  } 
}

resource "aws_default_route_table" "vpc_default_rt" {
  default_route_table_id      = "${aws_vpc.vpc.default_route_table_id}"
  route {
    cidr_block                = "0.0.0.0/0"   
    gateway_id                = "${aws_internet_gateway.igw.id}"
  }
  tags = {
    Name                      = "${var.TAG_DEPLOYMENT_PREFIX}-public-route-table"
    Organization              = "${var.TAG_CUSTOMER_NAME}"
    Project                   = "${var.TAG_ENV_NAME}"
  } 
}

resource "aws_internet_gateway" "igw" {
  vpc_id                      = "${aws_vpc.vpc.id}"
  tags = {
    Name                      = "${var.TAG_DEPLOYMENT_PREFIX}-igw"
    Organization              = "${var.TAG_CUSTOMER_NAME}"
    Project                   = "${var.TAG_ENV_NAME}"
  } 
}

#https://github.com/hashicorp/terraform/issues/58
locals {
  awsZones      = "${split(",", var.ZONES)}"
  azCount       = "${length(local.awsZones)}"
}

# Create public subnets in all availability zones
resource "aws_subnet" "public-subnet" {
  vpc_id                  = "${aws_vpc.vpc.id}"
  count                   = "${local.azCount}"
  cidr_block              = "${cidrsubnet(aws_vpc.vpc.cidr_block, 2, count.index)}"
  availability_zone       = "${element(local.awsZones, count.index)}"
  map_public_ip_on_launch = true
  
  tags = {
    Name = "${var.TAG_DEPLOYMENT_PREFIX}-sn-public-${element(local.awsZones, count.index)}"
    Organization              = "${var.TAG_CUSTOMER_NAME}"
    Project                   = "${var.TAG_ENV_NAME}"  
  }
}

# Create private subnets in all availability zones
# resource "aws_subnet" "private-subnet" {
#   vpc_id                  = "${aws_vpc.vpc.id}"
#   count                   = "${local.azCount}"
#   cidr_block              = "${cidrsubnet(aws_vpc.vpc.cidr_block, 2, (count.index + local.azCount))}"
#   availability_zone       = "${element(local.awsZones, count.index)}"
#   map_public_ip_on_launch = false
  
#   tags {
#     Name = "${var.TAG_DEPLOYMENT_PREFIX}-sn-public-${element(local.awsZones, count.index)}"
#     Organization              = "${var.TAG_CUSTOMER_NAME}"
#     Project                   = "${var.TAG_ENV_NAME}"  
#   }
# }

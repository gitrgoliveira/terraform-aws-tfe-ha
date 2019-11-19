provider "aws" {
  region = "eu-west-1"
}

resource "aws_vpc" "demo-tfe" {
  cidr_block           = "${var.vpc_cidr_block}"
  enable_dns_hostnames = true

  tags = {
    Name           = "${var.owner}-TFE-VPC"
    owner          = "${var.owner}"
    created-by     = "${var.owner}"
    sleep-at-night = "${var.sleep-at-night}"
    TTL            = "${var.TTL}"
  }
}

data "aws_availability_zones" "available" {}

resource "aws_subnet" "demo-tfe" {
  count                   = "${length(var.cidr_blocks)}"
  vpc_id                  = "${aws_vpc.demo-tfe.id}"
  availability_zone       = "${data.aws_availability_zones.available.names[count.index]}"
  cidr_block              = "${var.cidr_blocks[count.index]}"
  map_public_ip_on_launch = true

  tags = {
    Name           = "${var.owner}-pub${count.index}"
    owner          = "${var.owner}"
    created-by     = "${var.owner}"
    sleep-at-night = "${var.sleep-at-night}"
    TTL            = "${var.TTL}"
  }
}

resource "aws_subnet" "demo-tfe-priv" {
  count                   = "${length(var.cidr_blocks_priv)}"
  vpc_id                  = "${aws_vpc.demo-tfe.id}"
  availability_zone       = "${data.aws_availability_zones.available.names[count.index]}"
  cidr_block              = "${var.cidr_blocks_priv[count.index]}"
  map_public_ip_on_launch = false

  tags = {
    Name           = "${var.owner}-priv${count.index}"
    owner          = "${var.owner}"
    created-by     = "${var.owner}"
    sleep-at-night = "${var.sleep-at-night}"
    TTL            = "${var.TTL}"
  }
}

resource "aws_internet_gateway" "demo-tfe" {
  vpc_id = "${aws_vpc.demo-tfe.id}"

  tags = {
    Name           = "${var.owner}-TFE-VPC"
    owner          = "${var.owner}"
    created-by     = "${var.owner}"
    sleep-at-night = "${var.sleep-at-night}"
    TTL            = "${var.TTL}"
  }
}

resource "aws_route" "internet_access" {
  route_table_id         = "${aws_vpc.demo-tfe.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.demo-tfe.id}"
}

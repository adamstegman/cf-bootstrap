provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region = "${var.region}"
}

resource "aws_vpc" "microbosh" {
  cidr_block = "10.0.0.0/16"
  enable_dns_hostnames = true
  tags {
    Name = "microbosh"
  }
}

resource "aws_subnet" "bosh" {
  vpc_id = "${aws_vpc.microbosh.id}"
  cidr_block = "10.0.0.0/24"
  availability_zone = "${var.availability_zone}"
}

resource "aws_security_group" "bosh" {
  name = "bosh"
  description = "BOSH security group"
  vpc_id = "${aws_vpc.microbosh.id}"
  tags {
    Name = "bosh"
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = "25777"
    to_port = "25777"
    protocol = "TCP"
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = "25555"
    to_port = "25555"
    protocol = "TCP"
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = "25250"
    to_port = "25250"
    protocol = "TCP"
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = "6868"
    to_port = "6868"
    protocol = "TCP"
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = "4222"
    to_port = "4222"
    protocol = "TCP"
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = "22"
    to_port = "22"
    protocol = "TCP"
  }
  ingress {
    self = true
    from_port = "0"
    to_port = "65535"
    protocol = "TCP"
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = "68"
    to_port = "68"
    protocol = "UDP"
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port = "53"
    to_port = "53"
    protocol = "UDP"
  }
  ingress {
    self = true
    from_port = "0"
    to_port = "65535"
    protocol = "UDP"
  }
}

resource "aws_eip" "microbosh" {
  vpc = true
}

output "microbosh_vip" {
  value = "${aws_eip.microbosh.public_ip}"
}

output "bosh_subnet_id" {
  value = "${aws_subnet.bosh.id}"
}

output "bosh_subnet_cidr" {
  value = "${aws_subnet.bosh.cidr_block}"
}

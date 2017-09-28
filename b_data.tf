data "aws_availability_zones" "available" {}

resource "aws_vpc" "db_vpc" {
  cidr_block = "172.16.0.0/16"
  enable_dns_hostnames = true

  tags {
    Name = "tf-vpc-db"
  }
}
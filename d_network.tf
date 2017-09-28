resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.db_vpc.id}"
  tags {
    Name = "int_gw"
  }
}


resource "aws_subnet" "maintenance" {
  vpc_id = "${aws_vpc.db_vpc.id}"
  cidr_block = "172.16.10.0/24"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"

  tags {
    Name = "tf_sub_maintenance"
  }
}

resource "aws_subnet" "primary" {
  vpc_id = "${aws_vpc.db_vpc.id}"
  cidr_block = "172.16.20.0/24"
  availability_zone = "${data.aws_availability_zones.available.names[0]}"
  tags {
    Name = "tf_db_primary"
  }
}

resource "aws_subnet" "secondary" {
  vpc_id = "${aws_vpc.db_vpc.id}"
  cidr_block = "172.16.30.0/24"
  availability_zone = "${data.aws_availability_zones.available.names[1]}"
  tags {
    Name = "tf_db_secondary"
  }
}

resource "aws_db_subnet_group" "database" {
  name       = "main"
  subnet_ids = ["${aws_subnet.primary.id}","${aws_subnet.secondary.id}","${aws_subnet.maintenance.id}"]

  tags {
    Name = "My DB subnet group"
  }
}
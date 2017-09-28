resource "aws_db_instance" "default" {
  allocated_storage          = 5
  storage_type               = "gp2"
  availability_zone          = "${data.aws_availability_zones.available.names[0]}"
  engine                     = "mysql"
  engine_version             = "5.6.35"
  instance_class             = "db.t2.micro"
  license_model              = "general-public-license"
  name                       = "airportdemo"
  username                   = "root"
  password                   = "drowssap"
  final_snapshot_identifier  = "airportdemo-o-db"
  db_subnet_group_name       = "${aws_db_subnet_group.database.id}"
  vpc_security_group_ids     = ["${aws_security_group.allow_all.id}"]
}

//mysql -P 3306 -u root -pdrowssap -h terraform-00d126ea961ff9f0acd1039111.c9lhnifhl5tq.us-east-2.rds.amazonaws.com
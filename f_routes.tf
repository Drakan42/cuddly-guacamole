resource "aws_route53_record" "www" {
  zone_id = "${var.aws_route53_record_zone_id}"
  name    = "db.devops-training.lunatech.com"
  type    = "CNAME"
  ttl     = "300"
  records = ["${aws_instance.maintenance.public_ip}"]
}


resource "aws_route" "default" {
  route_table_id = "${aws_vpc.db_vpc.default_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${aws_internet_gateway.default.id}"
}
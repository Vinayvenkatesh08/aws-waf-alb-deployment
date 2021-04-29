provider "aws" {
  region     = "${var.region}"
}

resource "aws_wafregional_web_acl_association" "acl-association" {
  resource_arn = "${var.alb-arn}"
  web_acl_id = "${aws_wafregional_web_acl.acl.id}"
}00
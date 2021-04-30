provider "aws" {
  region     = "${var.region}"
}

resource "aws_wafv2_web_acl_association" "acl-association" {
  resource_arn = "${var.alb-arn}"
  web_acl_id = "${aws_wafv2_web_acl.individual_rule.id}"
  web_acl_id = "${aws_wafv2_web_acl.managed_rule_group.id}"
}00
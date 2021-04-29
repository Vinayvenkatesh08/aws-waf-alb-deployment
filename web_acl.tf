resource "aws_waf_web_acl" "acl" {
  name = "BlockMaliciousTraffic"
  metric_name = "BlockMaliciousTraffic"
  default_action {
    type = "ALLOW"
  }
  rule {
    action {
      type = "BLOCK"
    }
    priority = 1
    rule_id = "${aws_waf_rule.byteMatch-sqlInjectionMatch-xssMatch.id}"
  }
}
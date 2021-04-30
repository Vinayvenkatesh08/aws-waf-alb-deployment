resource "aws_wafv2_web_acl" "individual_rule" {
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
    rule_id = "${aws_wafv2_rule.byteMatch-sqlInjectionMatch-xssMatch.id}"
  }
}

resource "aws_wafv2_web_acl" "managed_rule_group" {
  name        = "managed-rule-group"
  description = "AWS Managed Rule Group."
  scope       = "REGIONAL"

  default_action {
    block {}
  }

  rule {
    name     = "rule-1"
    priority = 1

    override_action {
      count {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesCommonRuleSet"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = true
      metric_name                = "AWS-Managed-Rules-Common-Rule-Set"
      sampled_requests_enabled   = false
    }
  }

  tags = {
    RuleGroup = "CRS"
    Vendor = "AWS"
  }

  rule {
    name     = "rule-2"
    priority = 2

    override_action {
      count {}
    }

    statement {
      managed_rule_group_statement {
        name        = "AWSManagedRulesKnownBadInputsRuleSet"
        vendor_name = "AWS"
      }
    }

    visibility_config {
      cloudwatch_metrics_enabled = false
      metric_name                = "AWS-Managed-Rules-Known-Bad-Inputs-Rule-Set"
      sampled_requests_enabled   = false
    }
  }

  tags = {
    name = "AWSManagedRulesKnownBadInputsRuleSet"
    Vednor = "AWS"
  }

  visibility_config {
    cloudwatch_metrics_enabled = true
    metric_name                = "AWS-Managed-Rules-Known-Bad-Inputs-Rule-Set"
    sampled_requests_enabled   = false
  }
}
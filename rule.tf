resource "aws_wafv2_rule" "byteMatch-sqlInjectionMatch-xssMatch" {
  name        = "MatchBotsAndExampleRoute"
  metric_name = "MatchBotsAndExampleRoute"

  predicate {
      data_id = "${aws_wafv2_byte_match_set.bot-user-agent.id}"
      negated = false
      type    = "ByteMatch"
  }
  predicate {
      data_id = "${aws_wafv2_byte_match_set.example-uri.id}"
      negated = false
      type    = "ByteMatch"
  }
  predicate {
      data_id = "${aws_wafv2_sql_injection_match_set.sql-injection-match-set.id}"
      negated = false
      type    = "SqlInjectionMatch"
  }
  predicate {
      data_id = "${aws_wafv2_xss_match_set.xss-match-set.id}"
      negated = false
      type    = "XssMatch"
  }
    predicate {
      data_id = "${aws_wafv2_geo_match_set.geo_match_set.id}"
      negated = false
      type    = "GeoMatch"
  }
}
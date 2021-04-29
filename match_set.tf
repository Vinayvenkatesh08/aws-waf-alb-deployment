resource "aws_waf_byte_match_set" "bot-user-agent" {
  name = "MatchBotInUserAgent"
  byte_match_tuple {
    text_transformation = "LOWERCASE"
    target_string = "bot"
    positional_constraint = "CONTAINS"
    field_to_match {
      type = "HEADER"
      data = "user-agent"
    }
  }
}

resource "aws_waf_byte_match_set" "example-uri" {
  name = "MatchExampleRouteInURI"
  byte_match_tuple {
    text_transformation = "NONE"
    target_string = "${var.example-route}"
    positional_constraint = "CONTAINS"
    field_to_match {
      type = "URI"
    }
  }
}

resource "aws_waf_sql_injection_match_set" "sql-injection-match-set" {
  name = "tf-sql_injection_match_set"

  sql_injection_match_tuples {
    text_transformation = "HTML_ENTITY_DECODE"

    field_to_match {
      type = "QUERY_STRING"
    }
  }
}

resource "aws_waf_xss_match_set" "xss-match-set" {
  name = "xss_match_set"
    xss_match_tuples {
    text_transformation = "NONE"

    field_to_match {
      type = "URI"
    }
  }

  xss_match_tuples {
    text_transformation = "NONE"

    field_to_match {
      type = "QUERY_STRING"
    }
  }
}

resource "aws_waf_geo_match_set" "geo_match_set" {
  name = "geo_match_set"

  geo_match_constraint {
    type  = "Country"
    value = "${var.country-to-be-blocked}"
  }
}

# aws-waf-deployment

This Terraform project will deploy an Web Application firewall resources and attaches it to a Application loadbalancer
Following resources are created
* WAF Match sets
* WAF Rule to use the match sets
* WAF Web Access control lists

## Required inputs

Inputs required for the deployment needs to be keyed inside the specifed tags <>
* region: VPC in which load balancer will be deployed
* alb-arn: ARN of the Application load balancer that needs WAF rules
* example-route: Part of the route of the URI end point to detect malicious traffic
* country-to-be-blocked: Traffic from any country that needs to be blocked

## Functions

This Terraform project will validate traffic against three AWS managed rule groups and five match sets
* AWS Managed Rule Group1: AWSManagedRulesCommonRuleSet
* AWS Managed Rule Group2: AWSManagedRulesKnownBadInputsRuleSet
* AWS Managed Rule Group3: AWSManagedRulesSQLiRuleSet
* MatchBotInUserAgent: Match a bot traffic in user agent
* MatchExampleRouteInURI: Match part of the route of the URI End Point
* sql_injection_match_set: Look for snippets of malicious SQL code and eliminate unusual formatting that is used to bypass WAF
* xss_match_set: Inspect Cross site scripting attacks in Web requets
* geo_match_set: Matches the originating country


## Pre-requisite

AWS CLI Profile


## Usage
```./deploy.sh```

## Outputs

* web_acl_id
* web_acl_arn
* web_acl_capacity_units
* web_acl_logging_config_id

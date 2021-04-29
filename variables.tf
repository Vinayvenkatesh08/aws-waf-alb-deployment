variable "region" {
  type    = string
  default = "useast1"
}

#input arn of an existing alb resource
variable "alb-arn" {
  type    = string
  default = ""
}

variable "example-route" {
  type    = string
  default = ""
}

variable "country-to-be-blocked" {
  type    = string
  default = ""
}
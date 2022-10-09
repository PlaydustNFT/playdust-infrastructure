variable "organization" {
  description = "organization name"
  type        = string
  default     = "playdust"
}

variable "project" {
  description = "project name"
  type        = string
  default     = "playdust-com"
}

variable "environment" {
  description = "environment name"
  type        = string
  default     = "prod"
}

variable "region" {
  description = "aws region name"
  type        = string
  default     = "us-east-1"
}

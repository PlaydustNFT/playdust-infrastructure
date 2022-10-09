variable "organization" {
  description = "organization name"
  type        = string
  default     = "playdust"
}

variable "project" {
  description = "project name"
  type        = string
}

variable "environment" {
  description = "env name"
  type        = string
}

variable "region" {
  description = "aws region for ecs"
  type        = string
}

variable "api_region" {
  description = "aws region for api task in ecs"
  type        = string
}

variable "api_task_cpu" {
  description = "cpu units allocated to task"
  type        = string
}

variable "api_task_memory" {
  description = "memory allocated to task"
  type        = string
}

variable "api_access_key_id" {
  description = "this should be removed in favor of role based access for the task, but - for now..."
  type        = string
}

variable "api_secret_access_key" {
  description = "this should be removed in favor of role based access for the task, but - for now..."
  type        = string
}

variable "api_service_subnets" {
  description = "subnets to place api fargate task in"
  type        = list
  default     = ["subnet-0efa06b41f62d6ae1","subnet-0718fc368d64d6f43"]
}

variable "api_hubspot_access_token" {
  description = "access token for hubspot integration"
  type        = string
}

variable "vpc_id" {
  description = "id of the vpc to put ecs in"
}

variable "api_cname" {
  description = "cname for associating to the load balancer for this deployment"
}

variable "zone_id" {
  description = "zone_id of the route53 hosted zone under which to add the cname for the load balancer"
}

variable "dd_api_key" {
  description = "api key for datadog"
}

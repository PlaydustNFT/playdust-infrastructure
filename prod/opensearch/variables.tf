variable "organization" {
  description = "organization name"
  type        = string
  default     = "playdust"
}

variable "project" {
  description = "project name"
  type        = string
  default     = "opensearch"
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

variable "cluster_name" {
  description = "The name of the OpenSearch cluster."
  type        = string
  default     = "playdust-opensearch-prod"
}

variable "cluster_domain" {
  description = "The hosted zone name of the OpenSearch cluster."
  type        = string
  default     = "prod.pdapp.link"
}

variable "saml_entity_id" {
  description = "The unique Entity ID of the application in SAML Identity Provider."
  type        = string
  default     = "https://playdust-opensearch.prod.pdapp.link"
}

variable "saml_metadata_url" {
  description = "The URL of the SAML Identity Provider's metadata xml."
  type        = string
  default     = "https://portal.sso.us-east-1.amazonaws.com/saml/metadata/NTEzNTIzMTYwODQ0X2lucy1kNWNjYTVhOWE3OWNiNjA5"
}


variable "organization" {
  description = "organization name"
  type        = string
  default     = "playdust"
}

variable "project" {
  description = "project name"
  type        = string
  default     = "parrotfish"
}

variable "environment" {
  description = "environment name"
  type        = string
  default     = "staging"
}

variable "region" {
  description = "aws region name"
  type        = string
  default     = "us-east-1"
}

variable "cluster_name" {
  description = "The name of the OpenSearch cluster."
  type        = string
  default     = "opensearch"
}

variable "cluster_domain" {
  description = "The hosted zone name of the OpenSearch cluster."
  type        = string
  default     = "staging.pdapp.link"
}

variable "saml_entity_id" {
  description = "The unique Entity ID of the application in SAML Identity Provider."
  type        = string
  default     = "https://portal.sso.us-east-1.amazonaws.com/saml/assertion/NTEzNTIzMTYwODQ0X2lucy0zNTk5NzY0MzE5MmQwNWEz"
}

variable "saml_metadata_url" {
  description = "The URL of the SAML Identity Provider's metadata xml."
  type        = string
  default     = "https://portal.sso.us-east-1.amazonaws.com/saml/metadata/NTEzNTIzMTYwODQ0X2lucy0zNTk5NzY0MzE5MmQwNWEz"
}

data "http" "saml_metadata" {
  url = var.saml_metadata_url
}

provider "elasticsearch" {
  url                   = "https://${var.cluster_name}.${var.cluster_domain}"
  aws_region            = var.region
  elasticsearch_version = "7.10.2"
  healthcheck           = false
}

module "opensearch" {
  source          = "idealo/opensearch/aws"
  version         = "1.0"
  cluster_name    = var.cluster_name
  cluster_domain  = var.cluster_domain
  cluster_version = "1.2"

  saml_entity_id        = var.saml_entity_id
  saml_metadata_content = data.http.saml_metadata.body
  saml_session_timeout  = 120

  index_files          = fileset(path.module, "os-indices/*.{yml,yaml}")
  index_template_files = fileset(path.module, "os-index-templates/*.{yml,yaml}")
  ism_policy_files     = fileset(path.module, "os-ism-policies/*.{yml,yaml}")
  role_files           = fileset(path.module, "os-roles/*.{yml,yaml}")
  role_mapping_files   = fileset(path.module, "os-role-mappings/*.{yml,yaml}")

  master_instance_enabled = false
  hot_instance_type       = "r6gd.large.elasticsearch"
  warm_instance_enabled   = false
}

module "dynamodb_table_new" {
  source   = "terraform-aws-modules/dynamodb-table/aws"
  name     = "${var.organization}-${var.project}-${var.environment}-entitydb"
  hash_key = "globalId"
  attributes = [
    {
      name = "globalId"
      type = "S"
    },
    {
      name = "type"
      type = "S"
    },
    {
      name = "primaryEntity"
      type = "S"
    }
  ]

  global_secondary_indexes = [
    {
      name               = "TypeIndex"
      hash_key           = "type"
      projection_type    = "ALL"
    },
    {
      name               = "TypePrimaryEntityIndex"
      hash_key           = "type"
      range_key          = "primaryEntity"
      projection_type    = "ALL"
    },
    {
      name               = "PrimaryEntityIndex"
      hash_key           = "primaryEntity"
      projection_type    = "ALL"
    }
  ]

  stream_enabled   = true
  stream_view_type = "NEW_IMAGE"
  billing_mode     = "PAY_PER_REQUEST"

  tags = {
    Terraform    = "true"
    Environment  = var.environment
    Project      = var.project
    Organization = var.organization
  }
}

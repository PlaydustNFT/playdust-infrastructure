# TF files for building opensearch cluster

## These files for OS cluster build map to the TF cloud workspace, prod-opensearch

While these files and the corresponding terraform workspace will build an opensearch cluster, in order to provide user access to the cluster dashboards using AWS SSO, futher manual steps must be executed.

https://docs.aws.amazon.com/opensearch-service/latest/developerguide/saml.html

Due to the complexity and manual steps required to fully establish a functioning, accessible Opensearch cluster, Terraform is only really useful to stand up the cluster in the first place, but not for editing its attributes afterwards. For this reason, existing clusters will become out of sync with their Terraform state. This is fine. Think of this as a shortcut to building the cluster out originally, nothing more.

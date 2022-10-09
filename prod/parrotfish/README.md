# Terraform files for TF cloud workspace parrotfish-prod

## This directory contains tf files to build the dynamoDB tables for parrotfish application.

When changes to files in this directory are pushed to github on branch "main," the associated terraform cloud workspace (parrotfish-prod) will be triggered to run a terraform plan and apply 

The files here define the dynamodb tables, their settings and indices. Keeping the dynamodb tables settings defined here in sync with the actual dynamodb (rather than manually altering the dynamodb table settings) helps retain settings and configuration in code. Like with any terraform setup, changes can be made through the AWS gui, but that will cause the state in terraform to diverge from reality. This is fixable and tolerable, but not ideal.

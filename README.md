# infrastructure repo -> terraform cloud

## Repo for managing playdust cloud infrastructure with terraform cloud.

Infrastructure defined in this repository is shared, not application specific.

Each environment directory contains resource-type directories. 

Each environment-resource path maps to a space in terraform cloud with a matching name. 
For example: prod/ecs maps to the terraform cloud workspace: https://app.terraform.io/app/playdust/workspaces/ecs-prod

Each workspace in terraform cloud monitors the corresponding directory in this repo.

Whenever commits are pushed to a directory path in this repo that corresponds to a terraform cloud workspace, terraform will trigger a speculative plan run. 

If the plan run succeeds without error, an operator may click "apply" within the terraform cloud workspace, and the changes will be applied.

Terraform state is stored and managed within terraform cloud for each defined workspace.



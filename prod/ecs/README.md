# Terraform files for ecs-prod terraform cloud workspace

## These files are used with terraform cloud to build the ecs cluster and associated resources.

* Important - deployment of code to containers and updating ECS tasks with new container versions is NOT handled by these files. Instead, deployments of applicaton code are handled through github-actions defined in the parrotfish respository for applications that run on these ECS clusters.

These files are purely for setting up the ECS cluster infrastructure in the first place, and do not control deployment.

If changes are made to the ECS infrastructure and the corresponding terraform cloud workspace runs a plan / apply, the ECS applications that run on the cluster should be redeployed immediately.

Although new deployments to ECS conducted by github-actions should run smoothly and cause no downtime, a redeployment of the ECS infrastructure via terraform cloud, defined here, WILL create some downtime, and should therefore be planned.

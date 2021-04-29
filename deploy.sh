#!/bin/bash
pushd terraform
terraform init
terraform plan
terraform apply --auto-approve || exit 1
popd

terraform output -state=terraform/terraform.tfstate
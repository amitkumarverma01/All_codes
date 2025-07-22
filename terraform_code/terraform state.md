```sh
terraform init
az login
terraform init
terraform plan
terraform apply -auto-approve
terraform apply -auto-approve
terraform state list
terraform import azurerm_resource_group.example02 /subscriptions/b7df65c6-7c4d-4e35-983d-cd66eea0573a/resourceGroups/example-rg2
terraform import azurerm_resource_group.example01 /subscriptions/b7df65c6-7c4d-4e35-983d-cd66eea0573a/resourceGroups/example-rg1
terraform state rm azurerm_resource_group.example02
terraform refresh
terraform state list
terraform apply -auto-approve
terraform refresh
terraform state list
terraform state rm azurerm_resource_group.example01
terraform apply -auto-approve
```

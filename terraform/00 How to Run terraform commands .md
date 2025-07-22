## Run the follwing Commands--
```
terraform fmt
terraform init
terraform validate
terraform plan
terraform apply
terraform destroy
```
#### In Details-
- `terraform fmt`: Formats the configuration files to a canonical format.

- `terraform init`: Initializes a Terraform working directory.

- `terraform plan`: Creates an execution plan, showing what actions Terraform will take.
- 'terraform plan -out=planfile'- -out: Specifies the filename to save the plan (used for later applying).

- `terraform apply`: Applies the changes required to reach the desired state of the configuration.
- `terraform apply -auto-approve` - Skips interactive approval of the plan before applying. Terraform ignores this option when you pass a previously-saved plan file. This is because Terraform interprets the act of passing the plan file as the approval.
- 'terraform apply -state=custom.tfstate'-

- `terraform destroy`: Destroys the Terraform-managed infrastructure.
- terraform destroy -auto-approve

- `terraform validate`: Validates the configuration files for syntax and internal consistency without applying any changes. Validates the configuration files in the directory.


- `terraform show`: Provides a human-readable output of the current state or a saved plan file.

- `terraform graph`: Creates a visual representation of the configuration.

- `terraform output`: Reads an output variable from a Terraform state file.

- **`terraform state`**: Advanced state management commands.
     - **Subcommands**:
```
     - 'terraform state list': Lists resources in the Terraform state.

     - 'terraform state show': Shows the details of a resource in the state file.

     - 'terraform state rm': Removes a resource from the Terraform state (without deleting it from the cloud).

     - 'terraform state pull': Downloads the state file.

     - 'terraform state push': Uploads a local state file to a remote backend.
```

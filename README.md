# terraform-aws-tfe-ha
Quick and simple TFE (terraform enterprise deployment) deployment on AWS


## Deployment instructions
1. Download and keep the `terraform` v0.11.x binary in this folder. You can run the commands from there to prevent using another version of Terraform.
2. Edit and review the `terraform.tfvars` and `variables.tf` files
3. **Ensure your domain has a wildcard cert in the AWS ACM of your target region.**
4. run `./terraform apply`
5. Uncomment the module code in `main.tf`
6. run `./terraform apply` again
7. Magic!

## Bonus scripts

### `get_tf.sh`

It downloads `terraform` version `0.11.14`, which works with this module and procedure.

### `create_tfe_users.py`

Allows you to create several new users on your TFE

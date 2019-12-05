# terraform-aws-tfe-ha
Quick and simple TFE (terraform enterprise deployment) deployment on AWS, for demo purposes only.

*Please do not use this in Production !!*

## Deployment instructions
1. Download and keep the `terraform` v0.11.x binary in this folder, with `get_tf.sh`. You can run the commands from there to prevent using another version of Terraform.
2. Edit and review the `terraform.tfvars` and `variables.tf` files
3. **Ensure your configured domain is a zone in AWS Route53.**
4. run `./terraform apply`
   * Creating the certificate for the first time may take a while. Be patient and wait for it to be valid.
5. Uncomment the module code in `main.tf`
6. run `./terraform apply` again
7. Magic!

## Bonus scripts

### `get_tf.sh`

It downloads `terraform` version `0.11.14`, which works with this module and procedure.

### `create_tfe_users.py`

Allows you to create several new users on your TFE

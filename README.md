# Terraform
Terraform tutorial 

Terraform Document Tutorial : https://learn.hashicorp.com/collections/terraform/aws-get-started

Terraform Commands:-

terraform init command : initilizes the configuration directory which downloads and installs the providers defined in the configuration (AWS,GCP,Azure)

terraform plan command : creates and displays the reosurces which will be created/deleted or changed

terraform apply command : creates the resources described in the plan

terraform destroy command : will terminates the resources defined in your configuration

terraform apply -var 'instance_name=YetAnotherName' : command to change the variable value in variables.tf file containing instance name and updating the                                                         exisitng. Here 'instance_name' is the variable defined in variables.tf file
Setting variables via the command line will not save the new value.

terraform output : command to display the outputs on terminal

terraform output instance_id : here 'instance_id' is the output variable defined which stores instance id.

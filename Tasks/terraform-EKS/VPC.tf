# Create VPC
resource "aws_vpc" "VPC_K8s" {
  cidr_block       = var.cidr_block
  instance_tenancy = var.instance_tenancy

  tags = {
    Name = "VPC_k8s"
  }
}


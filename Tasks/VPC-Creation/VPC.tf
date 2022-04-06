#Create VPC

resource "aws_vpc" "VPC-1" {
  cidr_block       = "${var.VPCcidrRange}"
  instance_tenancy = "${var.vpc-tenancy}"

  tags = {
    Name = "VPC-Sonal"
  }
}

#display id of VPC created 
output VPCID {
    value = "${aws_vpc.VPC-1.id}"
}
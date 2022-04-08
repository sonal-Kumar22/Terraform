#Creating public Subnet
resource "aws_subnet" "sub_pub" {
  vpc_id     = aws_vpc.VPC_K8s.id
  cidr_block = var.pubSubCICD
  availability_zone = "eu-west-1a"
  tags = {
    Name = "Pub_sub_k8s"
  }
}

#creating private subnet
resource "aws_subnet" "sub_pvt" {
  vpc_id     = aws_vpc.VPC_K8s.id
  cidr_block = var.pvtSubCICD
  availability_zone = "eu-west-1b"
  tags = {
    Name = "Pvt_sub_k8s"
  }
}
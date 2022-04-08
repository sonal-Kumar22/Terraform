#creating Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.VPC_K8s.id

  tags = {
    Name = "k8s_vpc_igw"
  }
}
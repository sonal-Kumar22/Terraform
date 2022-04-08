#creating Route Table
resource "aws_route_table" "K8s_RT" {
  vpc_id = aws_vpc.VPC_K8s.id

  
  #associate IGW with RT in RT route section
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  

  tags = {
    Name = "Main_k8s_RT"
  }
}


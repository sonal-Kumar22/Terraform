#Creation of RT - for public subnet

resource "aws_route_table" "pub-sub-rt" {
  vpc_id = aws_vpc.VPC-1.id
  
  
  route {
    cidr_block = "0.0.0.0/0" //associated subnet can reach everywhere
    gateway_id = aws_internet_gateway.igw.id //RT uses this IGW to reach internet
  }
  

  tags = {
    Name = "pub-sub-RT"
  }
}

/*
#RT association with IGW -> this associates IGW with edge associations in RT
resource "aws_route_table_association" "RT-IGW" {
  gateway_id     = aws_internet_gateway.igw.id
  route_table_id = aws_route_table.pub-sub-rt.id
}
*/

#RT association with subnet
resource "aws_route_table_association" "RT-Pub-Subnet" {
  subnet_id      = aws_subnet.pub-sub.id
  route_table_id = aws_route_table.pub-sub-rt.id
}

#display id of RT created for public subnet
output pub-sub-RT-ID {
    value = "${aws_route_table.pub-sub-rt.id}"
}

#Creation of RT - for private subnet

resource "aws_route_table" "pvt-sub-rt" {
  vpc_id = aws_vpc.VPC-1.id

  tags = {
    Name = "pvt-sub-RT"
  }
}

#RT association with subnet
resource "aws_route_table_association" "RT-Pvt-Subnet" {
  subnet_id      = aws_subnet.pvt-sub.id
  route_table_id = aws_route_table.pvt-sub-rt.id
}

#display id of RT created for private subnet
output pvt-sub-RT-ID {
    value = "${aws_route_table.pvt-sub-rt.id}"
}

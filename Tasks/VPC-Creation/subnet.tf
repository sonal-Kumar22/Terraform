#creating public subnet
resource "aws_subnet" "pub-sub" {
  vpc_id     = aws_vpc.VPC-1.id
  cidr_block = "${var.pub-sub-cidr}"
  #Specify true to indicate that instances launched into the subnet should be assigned a public IP address
  map_public_ip_on_launch = "true" //it makes this a public subnet.
  tags = {
    Name = "pub-sub"
  }
}

#display id of public subnet created 
output pub-sub-ID {
    value = "${aws_subnet.pub-sub.id}"
}

#creating private subnet
resource "aws_subnet" "pvt-sub" {
  vpc_id     = aws_vpc.VPC-1.id
  cidr_block = "${var.pvt-sub-cidr}"

  tags = {
    Name = "pvt-sub"
  }
}

#display id of private subnet created 
output pvt-sub-ID {
    value = "${aws_subnet.pvt-sub.id}"
}
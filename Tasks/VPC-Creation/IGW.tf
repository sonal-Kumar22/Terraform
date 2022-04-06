#creation of internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.VPC-1.id

  tags = {
    Name = "VPC_Sonal-IGW"
  }
}

#I think no need for this block as we are already attaching the Internet gateway to VPC on line 3
/*
#Internet Gateway attachment
resource "aws_internet_gateway_attachment" "example" {
  internet_gateway_id = aws_internet_gateway.igw.id
  vpc_id              = aws_vpc.VPC-1.id
}
*/

#display id of IGW created
output IGW {
    value = "${aws_internet_gateway.igw.id}"
}

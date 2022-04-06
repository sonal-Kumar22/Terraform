#creating EC2 instance resource
resource "aws_instance" "EC2-Instance-1" {
  ami           = "ami-0069d66985b09d219"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.EC2-Instance-SG.id]  #attach the below created SG to the Instance

  tags = {
    Name = "Instance-1"
  }
}

#Elastic IP creation
resource "aws_eip" "lb" {
  instance = aws_instance.EC2-Instance-1.id
}

#Security Group
resource "aws_security_group" "EC2-Instance-SG" {
  name        = "EC2-SG"
  description = "SG to allow ingress (inbound) permissions"

  #instead of writing ingress codes for each port we can make it dynamic using dynamic block of terraform  

  dynamic "ingress" {
    for_each = [22, 80, 443] #list of ports that is to be replaced for each ingress
    iterator = port          #its like variable 'i'

    content {
      description = "TLS from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

output SecurityGroupDetails {
  value = "${aws_security_group.EC2-Instance-SG.id}" #here 'id' is attribute reference of security group
}
  #each ingress file wirting separately
  /*
  #ingress 1
  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  #ingress 2
  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  #ingress 3
  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  */

  



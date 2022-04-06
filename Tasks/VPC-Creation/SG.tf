#Security group for EC2 instance
resource "aws_security_group" "EC2-Instance-SG" {
  name        = "EC2-SG"
  description = "SG to allow port 22,80 permissions"
  vpc_id = "${aws_vpc.VPC-1.id}"
  #instead of writing ingress codes for each port we can make it dynamic using dynamic block of terraform  

  dynamic "ingress" {
    for_each = [22, 80] #list of ports that is to be replaced for each ingress
    iterator = port          #its like variable 'i'

    content {
      description = "TLS from VPC"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
        #all traffic 
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }

}

#print the id of the SG created above
output SecurityGroupid {
  value = "${aws_security_group.EC2-Instance-SG.id}" #here 'id' is attribute reference of security group
}
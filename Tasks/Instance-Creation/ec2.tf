#creating EC2 instance resource

resource "aws_instance" "EC2-Instance-1" {
  ami           = "ami-0069d66985b09d219"
  instance_type = "t2.micro"

  tags = {
    Name = "Instance-1"
  }
}

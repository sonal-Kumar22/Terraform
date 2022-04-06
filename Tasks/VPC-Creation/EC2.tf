
#create EC2 instance
resource "aws_instance" "web-EC2" {
  #I used lookup to get ami from the variables file because its type is map
  ami           = "${lookup(var.AMI,var.AWS_REGION)}" 
  instance_type = "${var.instanceType}"
  associate_public_ip_address = "true"
  # VPC Subnet ID to launch in.
  subnet_id = "${aws_subnet.pub-sub.id}"
  # Security Group - A list of security group names to associate with.
  vpc_security_group_ids = ["${aws_security_group.EC2-Instance-SG.id}"]

  # the Public SSH key
  key_name = "${aws_key_pair.deployer.id}"

  /*
  # nginx installation
  provisioner "file" {
        source = "nginx.sh"
        destination = "/tmp/nginx.sh"
    }
  provisioner "remote-exec" {
        inline = [
             "chmod +x /tmp/nginx.sh",
             "sudo /tmp/nginx.sh"
        ]
    }
  connection {
        type = "ssh"
        host = self.public_ip
        user = "${var.EC2_USER}"
        private_key = "${file("${var.PRIVATE_KEY_PATH}")}"
    }
   */

   provisioner "remote-exec" {
    inline = [
      "touch hello.txt",
      "echo helloworld remote provisioner >> hello.txt",
    ]
  }
  connection {
      type        = "ssh"
      host        = aws_instance.web-EC2.public_ip
      user        = "ec2-user"
      private_key = "${file("${var.PRIVATE_KEY_PATH}")}"
      timeout     = "4m"
   }



  tags = {
    Name = "Nginx-EC2"
  }
}

#KEy-pair creation in EC2
#generate key using command in terminal : ssh-keygen -f ec2-key-pair (this will create and store key in ec2-key-pair named file)
resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "${file(var.PUBLIC_KEY_PATH)}"
}
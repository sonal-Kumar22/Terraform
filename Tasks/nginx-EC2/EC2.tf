
#create EC2 instance
resource "aws_instance" "web-EC2" {
  ami                         = lookup(var.AMI, var.AWS_REGION)
  instance_type               = var.instanceType
  associate_public_ip_address = "true"
  vpc_security_group_ids      = ["${aws_security_group.EC2-Instance-SG.id}"]
  # the Public SSH key
  key_name = aws_key_pair.tf_key.id
  tags = {
    Name = "Nginx-EC2"
  }


  #EOF is for putting long string
  user_data = <<EOF
#!/bin/bash
sudo apt-get update 
sudo apt-get install nginx -y
sudo echo "Hi Sonal!! " > /var/www/html/index.nginx-debian.html
EOF

  #or
  #we can also write the above shell script as 
  #user_data = file("${path.module}/script.sh")

}




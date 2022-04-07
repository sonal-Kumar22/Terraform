#KEy-pair creation in EC2
#generate key using command in terminal : ssh-keygen -f ec2-key-pair (this will create and store key in ec2-key-pair named file)
resource "aws_key_pair" "tf_key" {
  key_name   = "deployer-key"
  public_key = file("${path.module}/id_rsa.pub")
}

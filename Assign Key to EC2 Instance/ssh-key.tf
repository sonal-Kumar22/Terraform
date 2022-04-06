resource "aws_instance" "web" {
  ami           = "ami-08ca3fed11864d6bb"
  instance_type = "t2.micro"
  key_name = "${aws_key_pair.key_tf.key_name}"
  tags = {
    Name = "EC2-Sonal"
  }
}

resource "aws_key_pair" "key_tf" {
  key_name   = "terraform-key"
  public_key = file("${path.module}/id_rsa.pub")
}

output "keyname" {
  value = "${aws_key_pair.key_tf.key_name}"
}

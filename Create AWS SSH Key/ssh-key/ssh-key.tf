resource "aws_key_pair" "key_tf" {
  key_name   = "terraform-key"
  public_key = file("${path.module}/id_rsa.pub")
}

output "keyname" {
  value = aws_key_pair.key_tf.key_name
}

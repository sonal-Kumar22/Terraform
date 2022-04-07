variable "AWS_REGION" {
  type = string
}

variable "ports" {
  type = list(number)
}

variable "AMI" {
  type = map(any)

  default = {
    eu-west-1 = "ami-08ca3fed11864d6bb" #ubuntu
    us-east-1 = "ami-0069d66985b09d219" #linux
  }
}

variable "instanceType" {
  type = string
}

variable "PRIVATE_KEY_PATH" {}

variable "PUBLIC_KEY_PATH" {}




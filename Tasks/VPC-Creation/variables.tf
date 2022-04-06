variable AWS_REGION {}

variable VPCcidrRange {}

variable vpc-tenancy {}

variable pub-sub-cidr {}

variable pvt-sub-cidr {}

variable "AMI" {
    type = map
    
    default = {
        eu-west-1 = "ami-0069d66985b09d219" #linux
        us-east-1 = "ami-08ca3fed11864d6bb" #ubuntu
    }
}

variable instanceType {}

variable PRIVATE_KEY_PATH {}

variable PUBLIC_KEY_PATH {}

variable "EC2_USER" {
  default = "ubuntu"
}


variable "ami_filter" {
    description = "AMI filter Name"
    type = string
}

variable "ami_owner" {
    description = "AMI Owner"
    type = string
}

variable "vpc_id"{
  description = "VPC ID where the EC2 will reside"
  type = string
}

variable "subnet_id" {
  description = "Subnet ID where the EC2 will reside"
  type = string
}

variable "enable_monitoring" {
  description = "Enabling monitoring ? (default: true)"
  type = string
  default = true
}

variable "key_name" {
  description = "Key Name to use for password decryption"
  type = string
}

variable "instance_type" {
  description = "EC2 Instance type (default: t3.small)"
  type = string
  default = "t3.small"
}

variable "tags" {
  description = "Default tags to apply on the resource"
  type        = map

  default = {
    terraform = "true"
  }
}

variable "ec2_ingress_port" {
  description = "Allowed EC2 ports"
  type = map
  default = { 
    "ssh" = {from_port = "22",to_port = "22",protocol = "tcp", cidr_blocks = ["0.0.0.0/0"]}
  }
}

variable "delete_on_termination" {
  description = "Keep the EBS volume when the instance is terminated. (default: true)"
  default = true
}

variable "volume_size" {
  description = "Size on the root EBS volume"
  default = 50
  type = string
}
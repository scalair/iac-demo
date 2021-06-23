# How to use

## Terraform example

```
module "Test" {
  source = "modules/terraform-aws-linux-ec2"   

  ami_filter = "*test*"
  ami_owner = "11111111"

  vpc_id = "vpc-11a111111111c"
  subnet_id = "subnet-1111f11eae1111dc1"

  enable_monitoring = "true"
  key_name = "demo"
  
  instance_type = "t3.micro"
  
  tags = {
      Terraform = "true"
      Environment = "Demo"
  } 

  ec2_ingress_port = {
      "ssh" = {from_port = "22",to_port = "22",protocol = "tcp",cidr_blocks = ["0.0.0.0/0"]},
      "http" = {from_port = "80",to_port = "80",protocol = "tcp",cidr_blocks = ["0.0.0.0/0"]}
  }

  volume_size = 15
}

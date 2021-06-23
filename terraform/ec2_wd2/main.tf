module "wordpress" {
  source = "../modules/terraform-aws-linux-ec2"   

  ami_filter = "*iac-scalair-wordpress-lastest*"
  ami_owner = "025350261160"

  vpc_id = "vpc-05a348e6827173c72"
  subnet_id = "subnet-0464f53eae6711dc7"

  enable_monitoring = "true"
  key_name = "demo"
  
  instance_type = "t3.micro"
  
  tags = {
      Terraform = "true"
      Environment = "Demo"
      Maintainer = "CloudOps"
      Name = "ec2_wd2"
  } 

  ec2_ingress_port = {
      "ssh" = {from_port = "22",to_port = "22",protocol = "tcp",cidr_blocks = ["0.0.0.0/0"]},
      "http" = {from_port = "80",to_port = "80",protocol = "tcp",cidr_blocks = ["0.0.0.0/0"]}
  }

  volume_size = 15
}
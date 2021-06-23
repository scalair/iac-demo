remote_state {
  backend = "s3"
  config = {
    bucket         = "demoiac.scalair.eu-west-3"
    key            = "terraform/${path_relative_to_include()}/terraform.tfstate"
    region         = "eu-west-3"
    encrypt        = true
    dynamodb_table = "demoiac.scalair.eu-west-3"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite"
  contents  = <<EOF
provider "aws" {
  region  = "eu-west-3"
}

terraform {
  backend "s3" {}
}
EOF
}

terraform {
  source = "github.com/terraform-aws-modules/terraform-aws-vpc?ref=v3.1.0"
}

inputs = {
  name = "demoiac"
  cidr = "10.0.0.0/16"

  azs             = ["eu-west-3a"]
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.101.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = false

  enable_public_redshift = false

  create_database_subnet_group           = false
  create_database_subnet_route_table     = false
  create_database_internet_gateway_route = false

  tags = {
    Terraform   = "true"
    Environment = "demo"
    Maintainer  = "CloudOps"
  }
}


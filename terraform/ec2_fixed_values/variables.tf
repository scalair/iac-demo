variable "tags" {
  description = "Default tags to apply on the resource"
  type        = map

  default = {
    Terraform = "true"
    Environment = "Demo"
    Maintainer = "CloudOps"
    Name = "Demo IaC"
  }
}
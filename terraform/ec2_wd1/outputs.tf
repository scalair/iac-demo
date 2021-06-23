output "public_ip" {
    description = "EC2 public ip"
    value = module.wordpress.public_ip
}

output "public_dns_name" {
    description = "EC2 public dns name"
    value = module.wordpress.public_dns_name
}

output "instance_id" {
    description = "EC2 ID"
    value = module.wordpress.instance_id
}

output "instance_sg_id" {
    description = "Security Group ID"
    value = module.wordpress.instance_sg_id
}

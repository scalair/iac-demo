output "public_ip" {
    description = "EC2 public ip"
    value = aws_instance.this.public_ip
}

output "public_dns_name" {
    description = "EC2 public dns name"
    value = aws_instance.this.public_dns
}

output "instance_id" {
    description = "EC2 ID"
    value = aws_instance.this.id
}

output "instance_sg_id" {
    description = "Security Group ID"
    value = aws_security_group.this.id
}

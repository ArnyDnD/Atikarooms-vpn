output "vpc_id" {
  value       = aws_vpc.vpc.id
  description = "ID of the VPC"
}

output "subnets" {
  value = {
    public    = [for subnet in aws_subnet.public : { id = subnet.id }]
    airgapped = [for subnet in aws_subnet.airgapped : { id = subnet.id }]
  }
  description = "Subnet IDs"
}

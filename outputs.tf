# output "transit_gateway_id" {
#   description = "Shared-services TGW ID. Pass this to spoke repos for VPC attachments."
#   value       = module.transit_gateway.transit_gateway_id
# }

# output "transit_gateway_arn" {
#   description = "Shared-services TGW ARN."
#   value       = module.transit_gateway.transit_gateway_arn
# }

# output "transit_gateway_route_table_id" {
#   description = "TGW route table ID exposed by the transit-gateway module."
#   value       = module.transit_gateway.route_table_id
# }

# output "tgw_ram_share_arn" {
#   description = "RAM share ARN for the shared-services TGW."
#   value       = module.transit_gateway.ram_share_arn
# }

output "vpc_id" {
  description = "Shared-services VPC ID."
  value       = module.vpc.vpc_id
}

output "vpc_cidr_block" {
  description = "Shared-services VPC CIDR block."
  value       = module.vpc.vpc_cidr_block
}

output "public_subnet_ids" {
  description = "Shared-services public subnet IDs."
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "Shared-services private subnet IDs."
  value       = module.vpc.private_subnet_ids
}

output "public_route_table_id" {
  description = "Shared-services public route table ID."
  value       = module.vpc.public_route_table_id
}

output "private_route_table_id" {
  description = "Shared-services private route table ID."
  value       = module.vpc.private_route_table_id
}

# output "shared_services_tgw_attachment_id" {
#   description = "Shared-services VPC attachment ID."
#   value       = aws_ec2_transit_gateway_vpc_attachment.shared_services.id
# }

output "tgw_test_instance_id" {
  description = "Temporary shared-services TGW test EC2 instance ID, or null when disabled."
  value       = var.create_tgw_test_instance ? module.tgw_test_ec2[0].instance_id : null
}

output "tgw_test_instance_private_ip" {
  description = "Temporary shared-services TGW test EC2 private IP, or null when disabled."
  value       = var.create_tgw_test_instance ? module.tgw_test_ec2[0].private_ip : null
}

output "tgw_test_instance_public_ip" {
  description = "Temporary shared-services TGW test EC2 public IP, or null when disabled."
  value       = var.create_tgw_test_instance ? module.tgw_test_ec2[0].public_ip : null
}

locals {
  tgw_share_principals = concat(
    [var.sandbox_account_id],
    var.tgw_test_account_ids
  )

  permanent_tgw_routes = {
    sandbox = var.sandbox_vpc_cidr
  }

  temporary_tgw_routes = length(var.tgw_test_account_ids) > 0 ? {
    management = var.management_test_vpc_cidr
  } : {}

  tgw_routes = merge(local.permanent_tgw_routes, local.temporary_tgw_routes)
}

# module "transit_gateway" {
#   source = "git::https://github.com/coolteddy/aws-terraform-modules.git//modules/transit-gateway?ref=v1.0.0"

#   name = "shared-services"

#   auto_accept_shared_attachments  = "enable"
#   default_route_table_association = "enable"
#   default_route_table_propagation = "enable"

#   ram_share_principals          = local.tgw_share_principals
#   ram_allow_external_principals = false

#   tags = {
#     Component = "network"
#   }
# }

# resource "aws_ec2_transit_gateway_vpc_attachment" "shared_services" {
#   transit_gateway_id = module.transit_gateway.transit_gateway_id
#   vpc_id             = module.vpc.vpc_id
#   subnet_ids         = module.vpc.private_subnet_ids

#   tags = {
#     Name      = "shared-services-tgw-attachment"
#     Component = "network"
#   }
# }

# resource "aws_route" "public_to_tgw_test_cidrs" {
#   for_each = local.tgw_routes

#   route_table_id         = module.vpc.public_route_table_id
#   destination_cidr_block = each.value
#   transit_gateway_id     = module.transit_gateway.transit_gateway_id

#   depends_on = [aws_ec2_transit_gateway_vpc_attachment.shared_services]
# }

# resource "aws_route" "private_to_tgw_test_cidrs" {
#   for_each = local.tgw_routes

#   route_table_id         = module.vpc.private_route_table_id
#   destination_cidr_block = each.value
#   transit_gateway_id     = module.transit_gateway.transit_gateway_id

#   depends_on = [aws_ec2_transit_gateway_vpc_attachment.shared_services]
# }

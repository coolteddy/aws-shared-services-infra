module "vpc" {
  source = "git::https://github.com/coolteddy/aws-terraform-modules.git//modules/vpc?ref=v1.0.0"

  name       = "shared-services"
  cidr_block = "10.1.0.0/16"

  public_subnets = {
    "eu-west-2a" = "10.1.0.0/24"
    "eu-west-2b" = "10.1.1.0/24"
  }

  private_subnets = {
    "eu-west-2a" = "10.1.10.0/24"
    "eu-west-2b" = "10.1.11.0/24"
  }

  enable_nat_gateway = false

  tags = {
    Component = "network"
  }
}

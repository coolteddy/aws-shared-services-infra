variable "region" {
  description = "AWS region for shared-services infrastructure."
  type        = string
  default     = "eu-west-2"
}

variable "shared_services_account_id" {
  description = "Shared-services AWS account ID. Used only to build the provider assume-role ARN."
  type        = string
  sensitive   = true
}

variable "sandbox_account_id" {
  description = "Sandbox AWS account ID. Permanent explicit RAM principal for the TGW share."
  type        = string
}

variable "tgw_test_account_ids" {
  description = "Temporary explicit RAM principals for TGW testing, such as the management account. Set to [] after the test."
  type        = list(string)
  default     = []
}

variable "management_test_vpc_cidr" {
  description = "Temporary management TGW test VPC CIDR."
  type        = string
  default     = "10.0.0.0/16"
}

variable "sandbox_vpc_cidr" {
  description = "Sandbox VPC CIDR used for TGW routing during the test."
  type        = string
  default     = "10.2.0.0/16"
}

variable "create_tgw_test_instance" {
  description = "Create the temporary shared-services EC2 instance for TGW connectivity testing."
  type        = bool
  default     = false
}

variable "tags" {
  description = "Default tags applied to shared-services resources."
  type        = map(string)
  default = {
    Project     = "aws-shared-services-infra"
    ManagedBy   = "terraform"
    Environment = "shared-services"
  }
}

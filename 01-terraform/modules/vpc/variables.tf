variable "prefix" {
  description = "The resource prefix name"
  type        = string
}

variable "vpc_cidr_block" {
  description = "The cidr block of vpc"
  type        = string
}

variable "public_subnet_cidr_blocks" {
  description = "The cidr block of public subnets"
  type        = list(string)
}

variable "availability_zones" {
  description = "The availability zones"
  type        = list(string)
}

variable "enable_dns_hostnames" {
  description = "Enable dns hostnames"
  type        = bool
  default     = true
}

variable "enable_dns_support" {
  description = "Enable dns support"
  type        = bool
  default     = true
}

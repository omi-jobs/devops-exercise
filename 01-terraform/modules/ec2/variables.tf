variable "prefix" {
  description = "The resource prefix name"
  type        = string
  default     = ""
}

variable "instance_type" {
  description = "The instance type of ec2"
  type        = string
  default     = "t3.micro"
}

variable "subnet_id" {
  description = "The subnet id of ec2"
  type        = string
}

variable "security_group_id" {
  description = "The security group id of ec2"
  type        = string
}

variable "instance_profile" {
  description = "The instance profile of ec2"
  type        = string
}

variable "instance_storage_type" {
  description = "The instance storage type of ec2"
  type        = string
  default     = "gp3"
}

variable "instance_storage_size" {
  description = "The instance storage size of ec2"
  type        = string
  default     = "8"
}

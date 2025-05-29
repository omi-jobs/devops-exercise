provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      ProjectName = var.project_name
      Env         = var.environment
      Terraform   = "True"
    }
  }
}
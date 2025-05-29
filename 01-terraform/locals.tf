locals {
  prefix             = "${var.environment}-${var.project_name}"
  availability_zones = ["${var.aws_region}a", "${var.aws_region}b", "${var.aws_region}c"]
}

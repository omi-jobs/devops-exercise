# IAM Role
resource "aws_iam_role" "ec2_role" {
  name               = "${var.prefix}-ec2-role"
  assume_role_policy = data.aws_iam_policy_document.assume_ec2.json
}

resource "aws_iam_instance_profile" "ec2_profile" {
  name = "${var.prefix}-ec2-instance-profile"
  role = aws_iam_role.ec2_role.name
}

resource "aws_iam_role_policy_attachment" "cw_logs" {
  role       = aws_iam_role.ec2_role.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
}

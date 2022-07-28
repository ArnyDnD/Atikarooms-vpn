resource "aws_iam_instance_profile" "vpn_profile" {
  name = "${var.app}-instance-profile"
  role = aws_iam_role.vpn_iam_role.name
}

resource "aws_iam_role" "vpn_iam_role" {
  name        = "${var.app}-iam-role"
  description = "IAM Role of the VPN node"

  assume_role_policy = jsonencode({
    Version : "2012-10-17",
    Statement : [
      {
        Effect : "Allow",
        Principal : {
          Service : "ec2.amazonaws.com"
        },
        Action : "sts:AssumeRole"
      }
    ]
  })

  force_detach_policies = true
  managed_policy_arns   = ["arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore", "arn:aws:iam::aws:policy/CloudWatchLogsFullAccess"]
}

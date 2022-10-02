data "aws_iam_policy" "aws_managed_ecs_task_execution_role" {
  name = "AmazonECSTaskExecutionRolePolicy"
}

data "aws_iam_policy" "aws_managed_ecs_service_autoscaling_role" {
  name = "AmazonEC2ContainerServiceAutoscaleRole"
}

resource "aws_iam_role" "ecs_task_execution_role" {
  name                = "ecsTaskExecutionRole"
  managed_policy_arns = [data.aws_iam_policy.aws_managed_ecs_task_execution_role.arn]
  assume_role_policy  = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ecs-tasks.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role" "ecs_service_autoscaling_role" {
  name                = "ecsAutoscaleRole"
  managed_policy_arns = [data.aws_iam_policy.aws_managed_ecs_service_autoscaling_role.arn]
  assume_role_policy  = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "application-autoscaling.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

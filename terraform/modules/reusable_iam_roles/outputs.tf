output "ecs_task_execution_role_arn" {
  value = aws_iam_role.ecs_task_execution_role.arn
}

output "ecs_service_autoscaling_role_arn" {
  value = aws_iam_role.ecs_service_autoscaling_role.arn
}

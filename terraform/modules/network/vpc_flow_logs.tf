resource "aws_flow_log" "flow_logs" {
  log_destination      = var.vpc_flow_logs_destination_s3_arn
  log_destination_type = "s3"
  traffic_type         = "ALL"
  vpc_id               = aws_vpc.vpc.id

  destination_options {
    file_format        = "parquet"
    per_hour_partition = true
  }
}

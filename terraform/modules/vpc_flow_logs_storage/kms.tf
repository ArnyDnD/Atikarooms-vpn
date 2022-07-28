resource "aws_kms_key" "s3" {
  description         = "${var.app} - This key is used to encrypt S3 bucket objects"
  enable_key_rotation = true

  policy = <<EOT
  {
    "Version": "2012-10-17",
    "Id": "terraform-managed-000",
    "Statement": [
      {
        "Sid": "Enable IAM User Permissions",
        "Effect": "Allow",
        "Principal": {
          "AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
        },
        "Action": "kms:*",
        "Resource": "*"
      },
      {
        "Sid": "Allow VPC Flow Logs to use the key",
        "Effect": "Allow",
        "Principal": {
          "Service": "delivery.logs.amazonaws.com"
        },
        "Action": [
          "kms:ReEncrypt",
          "kms:GenerateDataKey",
          "kms:Encrypt",
          "kms:DescribeKey",
          "kms:Decrypt"
        ],
        "Resource": "*"
      }
    ]
  }
  EOT
}

resource "aws_kms_alias" "s3" {
  name          = "alias/${var.app}-s3-kms-key"
  target_key_id = aws_kms_key.s3.key_id
}

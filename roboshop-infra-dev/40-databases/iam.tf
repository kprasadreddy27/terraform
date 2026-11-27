resource "aws_iam_role" "mysql" {
  name = "${var.project}-${var.environment}-mysql"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = merge(
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}-mysql"
    }
  )
}

resource "aws_iam_policy" "mysql" {
  name        = "test_policy"
  description = "IAM Policy to attach Roboshop MySql instance"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = templatefile("${path.module}/mysql-policy.json.tftpl, {
    account_id = local.account_id
    project    = "${var.project}"
    environment = "${var.environment}"
  })

    tags = merge(
    local.common_tags,
    {
        Name = "${var.project}-${var.environment}-mysql"
    }
  )
}

resource "aws_iam_role_policy_attachment" "mysql" {
  role       = aws_iam_role.mysql.name
  policy_arn = "aws_iam_policy.mysql.arn"
}

resource "aws_iam_instance_profile" "mysql" {
  name = "${var.project}-${var.environment}-mysql"
  role = aws_iam_role.mysql.name
}
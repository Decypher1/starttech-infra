resource "aws_cloudwatch_log_group" "app_logs" {
  name              = "/starttech/application"
  retention_in_days = 7

  tags = {
    Name = "starttech-log-group"
  }
}
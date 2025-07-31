# SNS Topic
resource "aws_sns_topic" "main" {
  name = "${var.project_name}-topic"
}

# SNS Subscription to SQS
resource "aws_sns_topic_subscription" "sqs_subscription" {
  topic_arn = aws_sns_topic.main.arn
  protocol  = "sqs"
  endpoint  = aws_sqs_queue.main.arn
}
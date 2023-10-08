resource "aws_kinesis_firehose_delivery_stream" "iot_to_kinesis_delivery_stream" {
  name        = "iot-delivery"
  destination = "extended_s3"

  extended_s3_configuration {
    role_arn   = aws_iam_role.firehose.arn
    bucket_arn = aws_s3_bucket.data_bucket.arn

    buffering_size     = 1
    buffering_interval = 60

    cloudwatch_logging_options {
      enabled         = "true"
      log_group_name  = aws_cloudwatch_log_group.iot_firehose_log_group.name
      log_stream_name = aws_cloudwatch_log_stream.iot_firehose_log_stream.name
    }
  }
}
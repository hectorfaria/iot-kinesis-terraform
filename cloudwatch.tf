resource "aws_cloudwatch_log_group" "iot_firehose_log_group" {
  name = "/aws/kinesisfirehose/iot-delivery"
}

resource "aws_cloudwatch_log_stream" "iot_firehose_log_stream" {
  name           = "/aws/kinesisfirehose/iot-stream"
  log_group_name = aws_cloudwatch_log_group.iot_firehose_log_group.name
}

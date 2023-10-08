resource "aws_iot_certificate" "cert" {
  active = true
}

resource "aws_iot_policy" "pubsub" {
  name = "PubSubToAnyTopic"

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Action" : "iot:Connect",
        "Resource" : "*"
      },
      {
        "Effect" : "Allow",
        "Action" : "iot:Publish",
        "Resource" : "*"
      },
      {
        "Effect" : "Allow",
        "Action" : "iot:Receive",
        "Resource" : "*"
      },
      {
        "Effect" : "Allow",
        "Action" : "iot:Subscribe",
        "Resource" : "*"
      }
    ]
  })
}

resource "aws_iot_thing" "raspberry" {
  name = var.iot_name
}

resource "aws_iot_policy_attachment" "att" {
  policy = aws_iot_policy.pubsub.name
  target = aws_iot_certificate.cert.arn
}

resource "aws_iot_thing_principal_attachment" "att" {
  principal = aws_iot_certificate.cert.arn
  thing     = aws_iot_thing.raspberry.name
}


data "aws_iot_endpoint" "iot_endpoint" {}

resource "aws_iot_topic_rule" "rule" {
  name        = "iot_kinesis_topic_rule"
  sql         = "SELECT * FROM '${var.topic_name}'"
  sql_version = "2016-03-23"
  enabled     = true

  firehose {
    role_arn             = aws_iam_role.iot_role.arn
    delivery_stream_name = aws_kinesis_firehose_delivery_stream.iot_to_kinesis_delivery_stream.name
  }
}

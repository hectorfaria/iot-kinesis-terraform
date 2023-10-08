output "private_key" {
  value       = aws_iot_certificate.cert.private_key
  sensitive   = true
  description = "Private Key"
}

output "ca_pem" {
  value       = aws_iot_certificate.cert.ca_pem
  sensitive   = true
  description = "Root CA certificate"
}

output "device_cert" {
  value       = aws_iot_certificate.cert.certificate_pem
  sensitive   = true
  description = "Device certificate"
}

output "endpoint" {
  value       = data.aws_iot_endpoint.iot_endpoint.endpoint_address
  description = "Connection Endpoint"
}

output "buck_name" {
  value       = aws_s3_bucket.data_bucket.bucket_domain_name
  description = "The domain name of the S3 bucket"
}

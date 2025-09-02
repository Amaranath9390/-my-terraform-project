output "instance_public_ip" {
description = "Public IP of created EC2 instance"
value = aws_instance.web.public_ip
}


output "s3_bucket" {
description = "S3 bucket name created"
value = aws_s3_bucket.bucket.bucket
}

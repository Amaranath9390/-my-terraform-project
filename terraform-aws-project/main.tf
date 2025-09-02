# find the most recent Amazon Linux 2 AMI
data "aws_ami" "amazon_linux" {
most_recent = true
owners = ["amazon"]
filter {
name = "name"
values = ["amzn2-ami-hvm-*-x86_64-gp2"]
}
}


# import public key from repo and create Key Pair in AWS
resource "aws_key_pair" "deployer" {
key_name = var.key_pair_name
public_key = file("${path.module}/deploy_key.pub")
}


# EC2 instance
resource "aws_instance" "web" {
ami = data.aws_ami.amazon_linux.id
instance_type = var.instance_type
key_name = aws_key_pair.deployer.key_name
associate_public_ip_address = true
tags = {
Name = "terraform-web"
}
}


# S3 bucket
resource "aws_s3_bucket" "bucket" {
bucket = var.bucket_name
acl = "private"
}

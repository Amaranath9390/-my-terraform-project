variable "region" {
description = "AWS region"
type = string
default = "ap-south-1"
}


variable "instance_type" {
description = "EC2 instance type"
type = string
default = "t2.micro"
}


variable "bucket_name" {
description = "S3 bucket name (must be globally unique). Replace this default with your unique name or provide via TF_VAR_bucket_name."
type = string
default = "REPLACE_WITH_UNIQUE_BUCKET_NAME"
}


variable "key_pair_name" {
description = "Key pair name to create in AWS (we'll use the public key file deploy_key.pub)"
type = string
default = "terraform-deployer"
}
TF

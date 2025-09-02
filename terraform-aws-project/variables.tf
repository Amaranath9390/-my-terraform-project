cat > variables.tf <<'EOF'
variable "aws_region" { type = string, default = "ap-south-1" }
variable "instance_type" { type = string, default = "t2.micro" }
variable "key_name" { type = string, default = "terraform-demo-key" }
variable "public_key_path" { type = string, default = "keys/tf_key.pub" }
variable "bucket_prefix" { type = string, default = "tf-demo-bucket" }
EOF


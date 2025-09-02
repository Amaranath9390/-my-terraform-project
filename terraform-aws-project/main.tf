cat > main.tf <<'EOF'
resource "random_id" "bucket_suffix" { byte_length = 4 }

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]
  filter { name = "name" values = ["amzn2-ami-hvm-*-x86_64-gp2"] }
}

resource "aws_s3_bucket" "this" {
  bucket = "${var.bucket_prefix}-${random_id.bucket_suffix.hex}"
  acl = "private"
  force_destroy = true
}

resource "aws_security_group" "allow_ssh_http" {
  name = "allow_ssh_http"
  ingress {
    from_port=22 to_port=22 protocol="tcp" cidr_blocks=["0.0.0.0/0"]
  }
  ingress {
    from_port=80 to_port=80 protocol="tcp" cidr_blocks=["0.0.0.0/0"]
  }
  egress { from_port=0 to_port=0 protocol="-1" cidr_blocks=["0.0.0.0/0"] }
}

resource "aws_key_pair" "deployer" {
  key_name = var.key_name
  public_key = file(var.public_key_path)
}

resource "aws_instance" "web" {
  ami = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_ssh_http.id]
  key_name = aws_key_pair.deployer.key_name
  tags = { Name = "terraform-demo-instance" }
}
EOF


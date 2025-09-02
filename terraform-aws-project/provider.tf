cat > provider.tf <<'EOF'
terraform {
  required_providers {
    aws = { source = "hashicorp/aws" }
    random = { source = "hashicorp/random" }
  }
}
provider "aws" {
  region = var.aws_region
}
EOF


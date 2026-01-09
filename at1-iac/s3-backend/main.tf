resource "aws_s3_bucket" "terraform_backend" {
  bucket = "infoline-terraform-backend-andy-629231206010"

  tags = {
    Project   = "InfoLine"
    ManagedBy = "Terraform"
    ECF       = "DevOps"
  }
}

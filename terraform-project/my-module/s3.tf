resource "aws_s3_bucket" "my_bucket" {
  bucket = "${var.my_env}-first-terraform-app-bucket"
  tags = {
    Name = "${var.my_env}-first-terraform-app-bucket"
  }
}

terraform {
  backend "s3" {
    key    = "eks-chapter"
    region = "us-east-1"
  }
}
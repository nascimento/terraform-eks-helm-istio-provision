terraform {
  backend "s3" {
    bucket = "chapter-tfstates"
    key    = "eks-chapter"
    region = "us-east-1"
  }
}
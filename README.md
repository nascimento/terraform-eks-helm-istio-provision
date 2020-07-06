# About

Terraform example projeto to provision EKS on AWS, configure Helm and install Istio.

# Requirements

Install:

- AWSCLI: 
- HELM: https://helm.sh/docs/intro/install/
- KUBECTL: https://kubernetes.io/docs/tasks/tools/install-kubectl/

## Terraform Modules

- VPC: https://github.com/terraform-aws-modules/terraform-aws-vpc
- EKS: https://github.com/terraform-aws-modules/terraform-aws-eks

> EKS are provisioned with Spot node instances on EC2. Read about Terraform-Aws-Eks module and configure as you need.
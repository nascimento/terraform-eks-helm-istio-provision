# Objetivo

Configurar EKS na AWS e Istio.

# Pré-Requisitos:

- Instalar [HELM](https://helm.sh/docs/intro/install/)
- Instalr [KUBECTL](https://kubernetes.io/docs/tasks/tools/install-kubectl/)

# Configuração AWS

A configuração da vpc e eks são feitos através dos modulos:

- VPC: https://github.com/terraform-aws-modules/terraform-aws-vpc
- EKS: https://github.com/terraform-aws-modules/terraform-aws-eks

Sendo o EKS provisionado com Nodes Spot Instance EC2.
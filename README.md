# About

Terraform example project to provision EKS on AWS and install Istio (Istioctl).

# Requirements

- TERRAFORM: https://learn.hashicorp.com/terraform/getting-started/install.html
- ISTIOCTL: https://istio.io/latest/docs/setup/getting-started/
- AWS-IAM_AUTHENTICATOR: https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html
- WGET: https://www.gnu.org/software/wget/

**Optional**
- KUBECTL: https://kubernetes.io/docs/tasks/tools/install-kubectl/

## Terraform Modules

- VPC: https://github.com/terraform-aws-modules/terraform-aws-vpc
- EKS: https://github.com/terraform-aws-modules/terraform-aws-eks

> EKS are provisioned with Spot node instances on EC2. Read about Terraform-Aws-Eks module and configure as you need.


# How-To

Run terraform

```sh
terraform init -backend=true -backend-config=bucket=[BUCKET_NAME]
terraform plan
terraform apply
```

# Testing 

Deploy an example Istio BookInfo application on K8s cluster:

```sh
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.5/samples/bookinfo/platform/kube/bookinfo.yaml 
```

## External Traffic

```sh
# Get External IngressGateway
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.6/samples/bookinfo/networking/bookinfo-gateway.yaml

kubectl -n istio-system get svc istio-ingressgateway 

export INGRESS_HOST=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].hostname}')

open http://$INGRESS_HOST/productpage
```

## Local Traffic

```sh
kubectl -n default port-forward $(kubectl -n default get pod -l app=productpage -o jsonpath='{.items[0].metadata.name}') 9080:9080

open http://localhost:9080/productpage
```

## Dashboards

**Kiali**: `istioctl dashboard kiali -n default`

**Grafana**: `istioctl dashboard grafana -n default` 

**Prometheus**: `istioctl dashboard prometheus -n default`

Other available Dashs:

```
Access to Istio web UIs

Usage:
  istioctl dashboard [flags]
  istioctl dashboard [command]

Aliases:
  dashboard, dash, d

Available Commands:
  controlz    Open ControlZ web UI
  envoy       Open Envoy admin web UI
  grafana     Open Grafana web UI
  jaeger      Open Jaeger web UI
  kiali       Open Kiali web UI
  prometheus  Open Prometheus web UI
  zipkin      Open Zipkin web UI
```
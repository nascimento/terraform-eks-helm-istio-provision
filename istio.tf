# Install istio
resource "null_resource" "helm_init" {
  provisioner "local-exec" {
    command = "export KUBECONFIG=${module.eks.kubeconfig_filename}"
  }
  provisioner "local-exec" {
    command = "istioctl manifest apply --set profile=demo" # Do not use DEMO on Production
  }
  provisioner "local-exec" {
    command = "kubectl label namespace default istio-injection=enabled"
  }
} 

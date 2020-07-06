# Configure Helm
resource "null_resource" "aws_get_kubeconfig" {
  provisioner "local-exec" {
    command = "aws eks --region us-east-1 update-kubeconfig --name eks-chapter"
  }
} 

resource "null_resource" "helm_init" {
  provisioner "local-exec" {
    command = "helm init"
  }
} 

# Install istio
# resource "null_resource" "helm_init" {
#   provisioner "local-exec" {
#     command = "helm init"
#   }
# } 

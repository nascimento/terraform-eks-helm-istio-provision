module "eks" {
  source       = "terraform-aws-modules/eks/aws"
  cluster_name = "eks-chapter"
  subnets      = module.vpc.public_subnets
  vpc_id       = module.vpc.vpc_id

  worker_groups_launch_template = [
    {
      name                    = "spot-eks-chapter"
      override_instance_types = ["t3.large", "t2.large"]
      spot_instance_pools     = 2
      asg_max_size            = 5
      asg_desired_capacity    = 2
      kubelet_extra_args      = "--node-labels=node.kubernetes.io/lifecycle=spot"
      public_ip               = true
    }
  ]
}

#creating EKS cluster
resource "aws_eks_cluster" "Cluster_1" {
  name     = "k8s_cluster_sonal"
  role_arn = aws_iam_role.iam-role-eks-cluster.arn
  version  = "1.21"
  vpc_config {
    subnet_ids             = [aws_subnet.sub_pub.id, aws_subnet.sub_pvt.id]
    security_group_ids     = ["${aws_security_group.eks-cluster.id}"]
    endpoint_public_access = true
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.eks-cluster-AmazonEKSClusterPolicy

  ]
}

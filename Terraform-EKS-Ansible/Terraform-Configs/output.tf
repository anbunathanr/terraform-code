output "cluster_ca_certificate" {
  #value = data.aws_eks_cluster.cluster.certificate_authority.0.data
  value = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
}

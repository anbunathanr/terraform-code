module "alb" {
  source = "./modules/alb"

  cluster_name = module.eks.cluster_name
  environment  = var.environment
  oidc_arn     = module.eks.oidc_provider_arn
  oidc_url     = module.eks.cluster_oidc_issuer_url

  depends_on = [module.eks]
}
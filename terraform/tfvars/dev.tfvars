workload    = "craftpledge"
environment = "dev"
location    = "swedencentral"

subscription_id = "6cad03c1-9e98-4160-8ebe-64dd30f1bbc7"

platform_monitoring_state = {
  resource_group_name  = "rg-tf-platform-monitoring-dev-uksouth-01"
  storage_account_name = "sa9d99036f14d5"
  container_name       = "tfstate"
  key                  = "terraform.tfstate"
  subscription_id      = "7760848c-794d-4a19-8cb2-52f71a21ac2b"
  tenant_id            = "e56a6947-bb9a-4a6e-846a-1f118d1c3a14"
}

platform_hosting_state = {
  resource_group_name  = "rg-tf-platform-hosting-dev-uksouth-01"
  storage_account_name = "saa3efe8753ccf"
  container_name       = "tfstate"
  key                  = "terraform.tfstate"
  subscription_id      = "7760848c-794d-4a19-8cb2-52f71a21ac2b"
  tenant_id            = "e56a6947-bb9a-4a6e-846a-1f118d1c3a14"
  use_oidc             = true
}

dns = {
  subscription_id     = "db34f572-8b71-40d6-8f99-f29a27612144"
  resource_group_name = "rg-platform-dns-prd-uksouth-01"
  domain              = "craftpledge.org"
  subdomain           = "dev"
}

tags = {
  Environment = "dev"
  Workload    = "craftpledge"
  DeployedBy  = "GitHub-Terraform"
  Git         = "https://github.com/frasermolyneux/craftpledge"
}

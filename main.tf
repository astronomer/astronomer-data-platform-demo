locals {
  data_engineering_config_files = fileset(path.module, "config/data_engineering/*.yaml")
  data_engineering_config       = { for f in local.data_engineering_config_files : trimsuffix("${f}", ".yaml") => yamldecode(file("${path.module}/${f}")) }
}

module "data_engineering_environments" {
  source = "./modules/data_engineering_team"

  for_each = local.data_engineering_config

  team_name       = each.value.name
  dev_deployment  = each.value.deployments.dev
  test_deployment = each.value.deployments.test
  acc_deployment  = each.value.deployments.acc
  prod_deployment = each.value.deployments.prod
}

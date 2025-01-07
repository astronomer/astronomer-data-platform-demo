terraform {
  required_providers {
    astro = {
      source  = "astronomer/astro"
      version = "~> 1.0.3"
    }
  }
}

# https://registry.terraform.io/providers/astronomer/astro/latest/docs/resources/workspace
resource "astro_workspace" "astro_workspace" {
  name                  = var.team_name
  description           = "Workspace for team ${var.team_name}"
  cicd_enforced_default = false
}

# https://registry.terraform.io/providers/astronomer/astro/latest/docs/resources/deployment
resource "astro_deployment" "dev_deployment" {
  count                   = var.dev_deployment ? 1 : 0
  name                    = "Development"
  description             = "Development Deployment"
  type                    = "DEDICATED"
  cluster_id              = var.astro_cluster_id
  contact_emails          = ["bas@astronomer.io"]
  default_task_pod_cpu    = "0.25"
  default_task_pod_memory = "0.5Gi"
  executor                = "CELERY"
  is_cicd_enforced        = false
  is_dag_deploy_enabled   = true
  is_development_mode     = true
  is_high_availability    = false
  resource_quota_cpu      = "10"
  resource_quota_memory   = "20Gi"
  scheduler_size          = "SMALL"
  workspace_id            = astro_workspace.astro_workspace.id
  environment_variables   = []
  worker_queues = [{
    name               = "default"
    is_default         = true
    astro_machine      = "A5"
    max_worker_count   = 10
    min_worker_count   = 0
    worker_concurrency = 5
  }]
}

# https://registry.terraform.io/providers/astronomer/astro/latest/docs/resources/deployment
resource "astro_deployment" "test_deployment" {
  count                   = var.test_deployment ? 1 : 0
  name                    = "Test"
  description             = "Test Deployment"
  type                    = "DEDICATED"
  cluster_id              = var.astro_cluster_id
  contact_emails          = ["bas@astronomer.io"]
  default_task_pod_cpu    = "0.25"
  default_task_pod_memory = "0.5Gi"
  executor                = "CELERY"
  is_cicd_enforced        = false
  is_dag_deploy_enabled   = true
  is_development_mode     = true
  is_high_availability    = false
  resource_quota_cpu      = "10"
  resource_quota_memory   = "20Gi"
  scheduler_size          = "SMALL"
  workspace_id            = astro_workspace.astro_workspace.id
  environment_variables   = []
  worker_queues = [{
    name               = "default"
    is_default         = true
    astro_machine      = "A5"
    max_worker_count   = 10
    min_worker_count   = 0
    worker_concurrency = 5
  }]
}

# https://registry.terraform.io/providers/astronomer/astro/latest/docs/resources/deployment
resource "astro_deployment" "acc_deployment" {
  count                   = var.acc_deployment ? 1 : 0
  name                    = "Acceptance"
  description             = "Acceptance Deployment"
  type                    = "DEDICATED"
  cluster_id              = var.astro_cluster_id
  contact_emails          = ["bas@astronomer.io"]
  default_task_pod_cpu    = "0.25"
  default_task_pod_memory = "0.5Gi"
  executor                = "CELERY"
  is_cicd_enforced        = false
  is_dag_deploy_enabled   = true
  is_development_mode     = true
  is_high_availability    = true
  resource_quota_cpu      = "10"
  resource_quota_memory   = "20Gi"
  scheduler_size          = "LARGE"
  workspace_id            = astro_workspace.astro_workspace.id
  environment_variables   = []
  worker_queues = [{
    name               = "default"
    is_default         = true
    astro_machine      = "A10"
    max_worker_count   = 10
    min_worker_count   = 0
    worker_concurrency = 10
  }]
}

# https://registry.terraform.io/providers/astronomer/astro/latest/docs/resources/deployment
resource "astro_deployment" "prod_deployment" {
  count                   = var.prod_deployment ? 1 : 0
  name                    = "Production"
  description             = "Production Deployment"
  type                    = "DEDICATED"
  cluster_id              = var.astro_cluster_id
  contact_emails          = ["bas@astronomer.io"]
  default_task_pod_cpu    = "0.25"
  default_task_pod_memory = "0.5Gi"
  executor                = "CELERY"
  is_cicd_enforced        = false
  is_dag_deploy_enabled   = true
  is_development_mode     = true
  is_high_availability    = true
  resource_quota_cpu      = "10"
  resource_quota_memory   = "20Gi"
  scheduler_size          = "LARGE"
  workspace_id            = astro_workspace.astro_workspace.id
  environment_variables   = []
  worker_queues = [{
    name               = "default"
    is_default         = true
    astro_machine      = "A10"
    max_worker_count   = 10
    min_worker_count   = 0
    worker_concurrency = 10
  }]
}

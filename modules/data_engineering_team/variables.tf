variable "team_name" {
  description = "Name of the data engineering team. Name will be used in infrastructure resource names."
  type        = string
}

variable "dev_deployment" {
  description = "Whether to create an Astro Deployment designated as development environment."
  type        = bool
  default     = false
}

variable "test_deployment" {
  description = "Whether to create an Astro Deployment designated as test environment."
  type        = bool
  default     = false
}

variable "acc_deployment" {
  description = "Whether to create an Astro Deployment designated as acceptance environment."
  type        = bool
  default     = false
}

variable "prod_deployment" {
  description = "Whether to create an Astro Deployment designated as production environment."
  type        = bool
  default     = false
}

variable "astro_cluster_id" {
  type    = string
  default = "clsnqbuxm04yl01mjwn979vz8"
}

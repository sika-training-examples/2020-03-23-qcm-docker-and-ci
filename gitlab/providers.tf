variable "gitlab_token" {}
variable "gitlab_domain" {}

provider "gitlab" {
  base_url = "https://${var.gitlab_domain}/api/v4/"
  token    = var.gitlab_token
}

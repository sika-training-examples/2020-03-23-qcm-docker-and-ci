variable "project_id" {}

resource "gitlab_project_variable" "DEV_DOCKER_HOST" {
  project   = var.project_id
  key       = "DEV_DOCKER_HOST"
  value     = "tcp://dev.qcm.sikademo.com:2376"
  protected = false
}

resource "gitlab_project_variable" "DEV_DOMAIN" {
  project   = var.project_id
  key       = "DEV_DOMAIN"
  value     = "cf02.eu"
  protected = false
}


resource "gitlab_project_variable" "DEV_DOCKER_CA_CERT" {
  project       = var.project_id
  key           = "DEV_DOCKER_CA_CERT"
  value         = file("../certs/minica.pem")
  protected     = false
  variable_type = "file"
}

resource "gitlab_project_variable" "DEV_DOCKER_CERT" {
  project       = var.project_id
  key           = "DEV_DOCKER_CERT"
  value         = file("../certs/dev.qcm.sikademo.com/cert.pem")
  protected     = false
  variable_type = "file"
}

resource "gitlab_project_variable" "DEV_DOCKER_KEY" {
  project       = var.project_id
  key           = "DEV_DOCKER_KEY"
  value         = file("../certs/dev.qcm.sikademo.com/key.pem")
  protected     = false
  variable_type = "file"
}

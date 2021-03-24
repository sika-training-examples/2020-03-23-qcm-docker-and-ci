resource "gitlab_project_variable" "PROD_DOCKER_HOST" {
  project   = var.project_id
  key       = "PROD_DOCKER_HOST"
  value     = "tcp://prod.qcm.sikademo.com:2376"
  protected = false
}

resource "gitlab_project_variable" "PROD_DOMAIN" {
  project   = var.project_id
  key       = "PROD_DOMAIN"
  value     = "prod.qcm.sikademo.com"
  protected = false
}

resource "gitlab_project_variable" "PROD_DOCKER_CA_CERT" {
  project       = var.project_id
  key           = "PROD_DOCKER_CA_CERT"
  value         = file("../certs/minica.pem")
  protected     = false
  variable_type = "file"
}

resource "gitlab_project_variable" "PROD_DOCKER_CERT" {
  project       = var.project_id
  key           = "PROD_DOCKER_CERT"
  value         = file("../certs/prod.qcm.sikademo.com/cert.pem")
  protected     = false
  variable_type = "file"
}

resource "gitlab_project_variable" "PROD_DOCKER_KEY" {
  project       = var.project_id
  key           = "PROD_DOCKER_KEY"
  value         = file("../certs/prod.qcm.sikademo.com/key.pem")
  protected     = false
  variable_type = "file"
}

resource "gitlab_project_variable" "MYSQL_HOST" {
  project           = var.project_id
  key               = "MYSQL_HOST"
  value             = "prod-do-user-3868619-0.b.db.ondigitalocean.com:25060"
  protected         = false
  environment_scope = "prod"
}

resource "gitlab_project_variable" "MYSQL_USER" {
  project           = var.project_id
  key               = "MYSQL_USER"
  value             = "doadmin"
  protected         = false
  environment_scope = "prod"

}

resource "gitlab_project_variable" "MYSQL_PASSWORD" {
  project           = var.project_id
  key               = "MYSQL_PASSWORD"
  value             = "vy30do4kal6dm6wt"
  protected         = false
  environment_scope = "prod"

}

resource "gitlab_project_variable" "MYSQL_DATABASE" {
  project           = var.project_id
  key               = "MYSQL_DATABASE"
  value             = "hello"
  protected         = false
  environment_scope = "prod"
}

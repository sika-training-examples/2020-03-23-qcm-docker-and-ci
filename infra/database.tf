resource "digitalocean_database_cluster" "prod" {
  name       = "prod"
  engine     = "mysql"
  version    = "8"
  size       = "db-s-1vcpu-1gb"
  region     = "fra1"
  node_count = 1
}

resource "digitalocean_database_firewall" "prod" {
  cluster_id = digitalocean_database_cluster.prod.id

  rule {
    type  = "droplet"
    value = digitalocean_droplet.prod.id
  }

  rule {
    type  = "ip_addr"
    value = "176.114.249.139"
  }
}

resource "digitalocean_database_db" "hello" {
  cluster_id = digitalocean_database_cluster.prod.id
  name       = "hello"
}

output "prod-mysql-host" {
  value = digitalocean_database_cluster.prod.host
}

output "prod-mysql-port" {
  value = digitalocean_database_cluster.prod.port
}

output "prod-mysql-host-private" {
  value = digitalocean_database_cluster.prod.private_host
}

output "prod-mysql-user" {
  value = digitalocean_database_cluster.prod.user
}

output "prod-mysql-password" {
  value = digitalocean_database_cluster.prod.password
}
